#include "contemporaryimplstyleplugin.h"

#include "contemporaryapplication.h"

ContemporaryImplStylePlugin::ContemporaryImplStylePlugin(QObject* parent) {

}

void ContemporaryImplStylePlugin::initializeEngine(QQmlEngine* engine, const char* uri) {
    QQmlEngineExtensionPlugin::initializeEngine(engine, uri);
    qmlRegisterUncreatableType<ContemporaryApplication>("com.vicr123.Contemporary.impl", 1, 0, "ContemporaryApplication", "ContemporaryApplication is an attached property");
}
