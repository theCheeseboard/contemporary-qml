#include "contemporarystyleplugin.h"

#include "contemporarystyle.h"
#include <QIcon>

extern void qml_register_types_com_vicr123_Contemporary_CoreStyles();

ContemporaryStylePlugin::ContemporaryStylePlugin(QObject* parent) {
    volatile auto registration = &qml_register_types_com_vicr123_Contemporary_CoreStyles;
    Q_UNUSED(registration);
}

void ContemporaryStylePlugin::initializeEngine(QQmlEngine* engine, const char* uri) {
    QQmlEngineExtensionPlugin::initializeEngine(engine, uri);
    qmlRegisterUncreatableType<ContemporaryStyle>("Contemporary", 1, 0, "Contemporary", "Contemporary is an attached property");

#ifdef CNTP_COMPILED_ICONS
    QIcon::setThemeName("contemporary-icons");
    QIcon::setThemeSearchPaths({QStringLiteral(":/com/vicr123/libcontemporary/")});
#endif
}
