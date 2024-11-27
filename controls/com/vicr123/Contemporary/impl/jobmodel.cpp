#include "jobmodel.h"

#include <tjob.h>
#include <tjobmanager.h>

struct JobModelPrivate {
        QList<tJob*> shownJobs;
        QList<tJob*> processingJobs;
};

JobModel::JobModel(QObject* parent) :
    QAbstractListModel(parent), d(new JobModelPrivate) {
    for (auto job : tJobManager::instance()->jobs()) {
        if (!job->isTransient()) {
            d->shownJobs.append(job);
            continue;
        }

        if (job->state() == tJob::Finished || job->state() == tJob::Failed) {
            continue;
        }

        d->shownJobs.append(job);
        setupJob(job);
    }

    d->shownJobs = tJobManager::instance()->jobs();
    connect(tJobManager::instance(), &tJobManager::jobAdded, this, [this](tJob* job) {
        beginInsertRows({}, d->shownJobs.length(), d->shownJobs.length());
        d->shownJobs.append(job);
        endInsertRows();

        setupJob(job);

        emit jobButtonVisibleChanged();
        emit totalProgressChanged();
        emit jobsPendingChanged();
    });
}

JobModel::~JobModel() {
    delete d;
}

int JobModel::rowCount(const QModelIndex& parent) const {
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid())
        return 0;

    return d->shownJobs.length();
}

QVariant JobModel::data(const QModelIndex& index, int role) const {
    if (!index.isValid())
        return QVariant();

    auto job = d->shownJobs.at(index.row());
    switch (role) {
        case JobModel::JobRole:
            return QVariant::fromValue(job);
    }

    return QVariant();
}

bool JobModel::jobButtonVisible() {
    return !d->processingJobs.isEmpty();
}

bool JobModel::jobsPending() {
    for (auto job : d->shownJobs) {
        if (job->state() == tJob::Processing || job->state() == tJob::RequiresAttention) {
            return true;
        }
    }
    return false;
}

qreal JobModel::totalProgress() {
    qreal progress = 0;
    qreal totalProgress = 0;
    for (auto job : d->processingJobs) {
        if (job->totalProgress() == 0) continue;

        progress += job->progress();
        totalProgress += job->totalProgress();
    }
    return progress / totalProgress;
}

int JobModel::ping() {
    auto currentPing = 0;
    for (auto job : d->processingJobs) {
        if (job->state() == tJob::Finished && currentPing < 1) {
            currentPing = 1;
        } else if (job->state() == tJob::Failed && currentPing < 2) {
            currentPing = 2;
        } else if (job->state() == tJob::RequiresAttention && currentPing < 3) {
            currentPing = 3;
        }
    }
    return currentPing;
}

void JobModel::jobsShown() {
    QList<tJob*> removedJobs;
    for (auto job : d->processingJobs) {
        if (job->state() == tJob::Finished || job->state() == tJob::Failed) {
            removedJobs.append(job);
        }
    }

    for (auto job : removedJobs) {
        d->processingJobs.removeOne(job);
    }

    emit jobButtonVisibleChanged();
    emit totalProgressChanged();
    emit pingChanged();
}

void JobModel::setupJob(tJob* job) {
    if (job->state() == tJob::Processing || job->state() == tJob::RequiresAttention) {
        d->processingJobs.append(job);
    }

    connect(job, &tJob::progressChanged, this, [this] {
        emit totalProgressChanged();
    });
    connect(job, &tJob::totalProgressChanged, this, [this] {
        emit totalProgressChanged();
    });
    connect(job, &tJob::stateChanged, this, [job, this](tJob::State state) {
        emit jobsPendingChanged();
        if (job->isTransient()) {
            if (job->state() == tJob::Finished || job->state() == tJob::Failed) {
                // Remove this job and hide the job button if necessary
                auto i = d->shownJobs.indexOf(job);
                beginRemoveRows({}, i, i);
                d->shownJobs.removeAt(i);
                endRemoveRows();

                // Also remove from processing jobs
                d->processingJobs.removeOne(job);

                emit jobButtonVisibleChanged();
                emit totalProgressChanged();
                emit pingChanged();
                return;
            }
        }
        emit pingChanged();
    });
    emit pingChanged();
}

QHash<int, QByteArray> JobModel::roleNames() const {
    return {
        {JobModel::JobRole, "job"}
    };
}
