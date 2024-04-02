#include "contemporaryimplstyleplugin.h"

#include "contemporaryapplication.h"

extern void qml_register_types_com_vicr123_Contemporary_impl();

ContemporaryImplStylePlugin::ContemporaryImplStylePlugin(QObject* parent) {
    volatile auto registration = &qml_register_types_com_vicr123_Contemporary_impl;
    Q_UNUSED(registration);
}

void ContemporaryImplStylePlugin::initializeEngine(QQmlEngine* engine, const char* uri) {
    QQmlEngineExtensionPlugin::initializeEngine(engine, uri);
    qmlRegisterUncreatableType<ContemporaryApplication>("com.vicr123.Contemporary.impl", 1, 0, "ContemporaryApplication", "ContemporaryApplication is an attached property");
}
