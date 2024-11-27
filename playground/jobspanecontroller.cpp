#include "jobspanecontroller.h"

#include <QVariantAnimation>
#include <tjobmanager.h>
#include <tstandardjob.h>

JobsPaneController::JobsPaneController(QObject* parent) :
    QObject{parent} {
}

void JobsPaneController::addJob() {
    auto job = new tStandardJob(false);
    job->setTitleString(tr("Standard Job"));
    job->setStatusString(tr("Job Status"));
    job->setProgress(0);
    job->setTotalProgress(100);
    job->setState(tJob::Processing);
    tJobManager::instance()->trackJob(job);

    auto progress = new QVariantAnimation(this);
    progress->setStartValue(0);
    progress->setEndValue(100);
    progress->setDuration(10000);
    connect(progress, &QVariantAnimation::valueChanged, this, [job](QVariant value) {
        job->setProgress(value.toInt());
    });
    connect(progress, &QVariantAnimation::finished, this, [job] {
        job->setStatusString(tr("Job is now complete"));
        job->setState(tJob::Finished);
    });
    progress->start(QVariantAnimation::DeleteWhenStopped);
}

void JobsPaneController::addIndeterminateJob() {
    auto job = new tStandardJob(false);
    job->setTitleString(tr("Indeterminate Job"));
    job->setStatusString(tr("This job has an indeterminate progress bar"));
    job->setProgress(0);
    job->setTotalProgress(0);
    job->setState(tJob::Processing);
    tJobManager::instance()->trackJob(job);

    auto progress = new QVariantAnimation(this);
    progress->setStartValue(0);
    progress->setEndValue(100);
    progress->setDuration(10000);
    connect(progress, &QVariantAnimation::valueChanged, this, [job](QVariant value) {
        job->setProgress(value.toInt());
    });
    connect(progress, &QVariantAnimation::finished, this, [job] {
        job->setStatusString(tr("Job is now complete"));
        job->setState(tJob::Finished);
    });
    progress->start(QVariantAnimation::DeleteWhenStopped);
}

void JobsPaneController::addTransientJob() {
    auto job = new tStandardJob(true);
    job->setTitleString(tr("Transient Job"));
    job->setStatusString(tr("This job is transient and so will disappear automatically once it is complete"));
    job->setProgress(0);
    job->setTotalProgress(100);
    job->setState(tJob::Processing);
    tJobManager::instance()->trackJob(job);

    auto progress = new QVariantAnimation(this);
    progress->setStartValue(0);
    progress->setEndValue(100);
    progress->setDuration(10000);
    connect(progress, &QVariantAnimation::valueChanged, this, [job](QVariant value) {
        job->setProgress(value.toInt());
    });
    connect(progress, &QVariantAnimation::finished, this, [job] {
        job->setStatusString(tr("Job is now complete"));
        job->setState(tJob::Finished);
    });
    progress->start(QVariantAnimation::DeleteWhenStopped);
}

void JobsPaneController::addFailingJob() {
    auto job = new tStandardJob(false);
    job->setTitleString(tr("Failing job"));
    job->setStatusString(tr("This job will fail halfway through processing"));
    job->setProgress(0);
    job->setTotalProgress(100);
    job->setState(tJob::Processing);
    tJobManager::instance()->trackJob(job);

    auto progress = new QVariantAnimation(this);
    progress->setStartValue(0);
    progress->setEndValue(50);
    progress->setDuration(5000);
    connect(progress, &QVariantAnimation::valueChanged, this, [job](QVariant value) {
        job->setProgress(value.toInt());
    });
    connect(progress, &QVariantAnimation::finished, this, [job] {
        job->setStatusString(tr("Job has failed"));
        job->setState(tJob::Failed);
    });
    progress->start(QVariantAnimation::DeleteWhenStopped);
}
