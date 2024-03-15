#ifndef CONTEMPORARYSTYLE_H
#define CONTEMPORARYSTYLE_H

#include <QObject>
#include <QtQml>
#include <QIcon>

struct ContemporaryApplicationPrivate;
class ContemporaryApplication : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList softwareVersions READ softwareVersions CONSTANT)
    Q_PROPERTY(QStringList copyrightLines READ copyrightLines CONSTANT)
    Q_PROPERTY(QIcon applicationIcon READ applicationIcon CONSTANT)
    Q_PROPERTY(QString genericName READ genericName CONSTANT)
    Q_PROPERTY(QUrl websiteUrl READ websiteUrl CONSTANT)
    Q_PROPERTY(QUrl fileBugUrl READ fileBugUrl CONSTANT)
    Q_PROPERTY(QUrl sourcesUrl READ sourcesUrl CONSTANT)
    QML_NAMED_ELEMENT(ContemporaryApplication)
    QML_UNCREATABLE("")
    QML_ATTACHED(ContemporaryApplication)

public:
    explicit ContemporaryApplication(QObject *parent = nullptr);
    ~ContemporaryApplication();

    static ContemporaryApplication* qmlAttachedProperties(QObject *object);

    QIcon applicationIcon();
    QStringList softwareVersions();
    QStringList copyrightLines();
    QString genericName();
    QUrl websiteUrl();
    QUrl fileBugUrl();
    QUrl sourcesUrl();

private:
    ContemporaryApplicationPrivate* d;
};

QML_DECLARE_TYPEINFO(ContemporaryApplication, QML_HAS_ATTACHED_PROPERTIES)

#endif // CONTEMPORARYSTYLE_H