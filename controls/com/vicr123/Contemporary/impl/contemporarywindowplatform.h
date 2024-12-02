#ifndef CONTEMPORARYWINDOWPLATFORM_H
#define CONTEMPORARYWINDOWPLATFORM_H

#include <QObject>
#include <QQmlEngine>
#include <QQuickWindow>
#include <QAbstractNativeEventFilter>

struct ContemporaryWindowPlatformPrivate;
class ContemporaryWindowPlatform : public QObject, public QAbstractNativeEventFilter {
        Q_OBJECT
        Q_PROPERTY(QQuickWindow* window READ window WRITE setWindow NOTIFY windowChanged FINAL)
        Q_PROPERTY(int windowMargins READ windowMargins NOTIFY windowMarginsChanged FINAL)
        QML_ELEMENT
    public:
        explicit ContemporaryWindowPlatform(QObject* parent = nullptr);
        ~ContemporaryWindowPlatform();

        QQuickWindow* window();
        void setWindow(QQuickWindow* window);

        int windowMargins();

    signals:
        void windowChanged();
        void windowMarginsChanged();

    private:
        ContemporaryWindowPlatformPrivate* d;

        // QAbstractNativeEventFilter interface
    public:
        bool nativeEventFilter(const QByteArray& eventType, void* message, qintptr* result);
};

#endif // CONTEMPORARYWINDOWPLATFORM_H
