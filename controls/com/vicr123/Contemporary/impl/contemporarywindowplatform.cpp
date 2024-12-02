#include "contemporarywindowplatform.h"

#include <QTimer>

#ifdef Q_OS_WIN
    #include <Windows.h>
    #include <dwmapi.h>
    #include <windowsx.h>
#endif

struct ContemporaryWindowPlatformPrivate {
    QQuickWindow* window = nullptr;

#ifdef Q_OS_WIN
    HWND windowHandle;
#endif
};

ContemporaryWindowPlatform::ContemporaryWindowPlatform(QObject* parent) :
    QObject{parent}, d{new ContemporaryWindowPlatformPrivate} {
    qApp->installNativeEventFilter(this);
}

ContemporaryWindowPlatform::~ContemporaryWindowPlatform() {
    qApp->removeNativeEventFilter(this);
    delete d;
}

QQuickWindow* ContemporaryWindowPlatform::window() {
    return d->window;
}

void ContemporaryWindowPlatform::setWindow(QQuickWindow* window) {
    if (d->window) {
        d->window->disconnect(this);
    }
    d->window = window;
    if (d->window) {
        connect(d->window, &QQuickWindow::visibilityChanged, this, &ContemporaryWindowPlatform::windowMarginsChanged);
    }
    emit windowChanged();
    emit windowMarginsChanged();

#ifdef Q_OS_WIN
    d->windowHandle = {};
#endif

    if (!window) return;

#ifdef Q_OS_WIN
    d->windowHandle = reinterpret_cast<HWND>(window->winId());

    MARGINS borderless = {1, 1, 1, 1};
    DwmExtendFrameIntoClientArea(d->windowHandle, &borderless);

    // Force the window to recalculate its frame
    SetWindowPos(d->windowHandle, nullptr, 0, 0, 0, 0, SWP_FRAMECHANGED | SWP_NOMOVE | SWP_NOSIZE);
#endif
}

int ContemporaryWindowPlatform::windowMargins() {
    if (!d->window) return 0;
#ifdef Q_OS_WIN
    return d->window->visibility() == QQuickWindow::Maximized || d->window->visibility() == QQuickWindow::FullScreen ? 7 : 0;
#else
    return d->window->visibility() == QQuickWindow::Maximized || d->window->visibility() == QQuickWindow::FullScreen ? 0 : 5;
#endif
}

bool ContemporaryWindowPlatform::nativeEventFilter(const QByteArray& eventType, void* message, qintptr* result) {
#ifdef Q_OS_WIN
    if (eventType == "windows_generic_MSG") {
        auto msg = static_cast<MSG*>(message);
        if (msg->message == WM_NCCALCSIZE) {
            if (d->windowHandle == msg->hwnd) {
                result = 0;
                return true;
            }
        }
    }
#endif
    return false;
}
