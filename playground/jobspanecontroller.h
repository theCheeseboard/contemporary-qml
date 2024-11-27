#ifndef JOBSPANECONTROLLER_H
#define JOBSPANECONTROLLER_H

#include <QObject>
#include <QQmlEngine>

class JobsPaneController : public QObject {
        Q_OBJECT
        QML_ELEMENT
    public:
        explicit JobsPaneController(QObject* parent = nullptr);

        Q_SCRIPTABLE void addJob();
        Q_SCRIPTABLE void addIndeterminateJob();
        Q_SCRIPTABLE void addTransientJob();
        Q_SCRIPTABLE void addFailingJob();

    signals:
};

#endif // JOBSPANECONTROLLER_H
