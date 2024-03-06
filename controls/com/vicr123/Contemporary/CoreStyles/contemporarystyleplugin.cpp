#include "contemporarystyleplugin.h"

#include "contemporarystyle.h"

ContemporaryStylePlugin::ContemporaryStylePlugin(QObject* parent) {

}

void ContemporaryStylePlugin::initializeEngine(QQmlEngine* engine, const char* uri) {
    QQmlEngineExtensionPlugin::initializeEngine(engine, uri);
    qmlRegisterUncreatableType<ContemporaryStyle>("Contemporary", 1, 0, "Contemporary", "Contemporary is an attached property");
}