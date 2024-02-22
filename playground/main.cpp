#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlEngine>
#include <QQmlEngineExtensionPlugin>

#include "contemporaryinitialisation.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickStyle::setStyle("com.vicr123.Contemporary.CoreStyles");
    // QQuickStyle::setStyle("Material");
    // QQuickStyle::setStyle("Fusion");

    ContemporaryInitialisation::init();

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/qt/qml/playground/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

#ifdef Q_OS_IOS
Q_IMPORT_QML_PLUGIN(com_vicr123_ContemporaryPlugin)
#endif
