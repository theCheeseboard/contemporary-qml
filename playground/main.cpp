#include <tapplication.h>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQuickStyle>
#include <QIcon>

int main(int argc, char* argv[]) {
    tApplication app(argc, argv);
    app.setWindowIcon(QIcon::fromTheme("com.vicr123.thebeat"));
    app.setApplicationVersion("1.0");

    QQuickStyle::setStyle("com.vicr123.Contemporary.CoreStyles");
    // QQuickStyle::setStyle("Material");
    // QQuickStyle::setStyle("Fusion");
    QIcon::setThemeName("contemporary");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/qt/qml/playground/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() {
        QCoreApplication::exit(-1);
    },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

#ifdef Q_OS_IOS
#include <QQmlExtensionPlugin>
Q_IMPORT_QML_PLUGIN(com_vicr123_Contemporary_CoreStylesPlugin)
#endif
