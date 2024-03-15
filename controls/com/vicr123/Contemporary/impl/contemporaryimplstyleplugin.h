#ifndef CONTEMPORARYSTYLEPLUGIN_H
#define CONTEMPORARYSTYLEPLUGIN_H

#include <QQmlEngineExtensionPlugin>

class ContemporaryImplStylePlugin : public QQmlEngineExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlEngineExtensionInterface_iid FILE "contemporaryimplstyle.json")

    public:
    explicit ContemporaryImplStylePlugin(QObject *parent = nullptr);

    void initializeEngine(QQmlEngine* engine, const char* uri) override;
};

#endif // CONTEMPORARYSTYLEPLUGIN_H
