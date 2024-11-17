#include <QIcon>
#include <QMessageBox>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQuickStyle>
#include <tapplication.h>
#include <tlogger.h>

int main(int argc, char* argv[]) {
    tApplication app(argc, argv);
    app.setApplicationVersion("1.0");
    app.setGenericName(QApplication::translate("main", "Control Playground"));
    app.setApplicationLicense(tApplication::Gpl3OrLater);
    app.setCopyrightHolder("Victor Tran");
    app.setCopyrightYear("2024");
    app.setOrganizationName("theSuite");
    app.setApplicationName(T_APPMETA_READABLE_NAME);
    app.setDesktopFileName(T_APPMETA_DESKTOP_ID);

    app.setGenericName(QApplication::translate("main", "Control Playground"));
    app.setApplicationLicense(tApplication::Gpl3OrLater);
    app.setCopyrightHolder("Victor Tran");
    app.setCopyrightYear("2024");
    app.setOrganizationName("theSuite");
    app.setApplicationName(T_APPMETA_READABLE_NAME);
    app.setDesktopFileName(T_APPMETA_DESKTOP_ID);

    QQuickStyle::setStyle("com.vicr123.Contemporary.CoreStyles");
    // QQuickStyle::setStyle("Material");
    // QQuickStyle::setStyle("Fusion");
    QIcon::setThemeName("contemporary");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/qt/qml/playground/Main.qml"_qs);
    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreationFailed, &app, [](QUrl url) {
        QTextStream(stderr) << "Object creation failed";
        QTextStream(stderr) << url.toString();
        QCoreApplication::exit(1);
    }, Qt::QueuedConnection);
    QObject::connect(
        &engine, &QQmlApplicationEngine::warnings, &app, [](const QList<QQmlError>& warnings) {
        for (auto warning : warnings) {
            QTextStream(stderr) << "QML: " << warning.toString();
        }
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

#if defined(Q_OS_IOS)
    #include <QQmlExtensionPlugin>
Q_IMPORT_QML_PLUGIN(com_vicr123_Contemporary_CoreStylesPlugin)
#endif
