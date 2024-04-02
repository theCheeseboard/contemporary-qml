#ifndef CONTEMPORARYSTYLEPLUGIN_H
#define CONTEMPORARYSTYLEPLUGIN_H

#include <QQmlEngineExtensionPlugin>

class Q_DECL_EXPORT ContemporaryStylePlugin : public QQmlEngineExtensionPlugin {
        Q_OBJECT
        Q_PLUGIN_METADATA(IID QQmlEngineExtensionInterface_iid FILE "contemporarystyle.json")

    public:
        explicit ContemporaryStylePlugin(QObject* parent = nullptr);

        void initializeEngine(QQmlEngine* engine, const char* uri) override;
};

#endif // CONTEMPORARYSTYLEPLUGIN_H
