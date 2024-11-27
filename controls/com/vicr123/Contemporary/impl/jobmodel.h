#ifndef JOBMODEL_H
#define JOBMODEL_H

#include <QAbstractListModel>
#include <QQmlComponent>

struct JobModelPrivate;
class tJob;
class JobModel : public QAbstractListModel {
        Q_OBJECT
        Q_PROPERTY(bool jobButtonVisible READ jobButtonVisible NOTIFY jobButtonVisibleChanged FINAL)
        Q_PROPERTY(bool jobsPending READ jobsPending NOTIFY jobsPendingChanged FINAL)
        Q_PROPERTY(qreal totalProgress READ totalProgress NOTIFY totalProgressChanged FINAL)
        Q_PROPERTY(int ping READ ping NOTIFY pingChanged FINAL)
        QML_ELEMENT

    public:
        explicit JobModel(QObject* parent = nullptr);
        ~JobModel();

        enum Roles {
            JobRole
        };

        // Basic functionality:
        int rowCount(const QModelIndex& parent = QModelIndex()) const override;
        QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;

        bool jobButtonVisible();
        bool jobsPending();
        qreal totalProgress();
        int ping();

        Q_SCRIPTABLE void jobsShown();

    signals:
        void jobButtonVisibleChanged();
        void totalProgressChanged();
        void jobsPendingChanged();
        void pingChanged();

    private:
        JobModelPrivate* d;

        void setupJob(tJob* job);

        // QAbstractItemModel interface
    public:
        QHash<int, QByteArray> roleNames() const override;
};

#endif // JOBMODEL_H
