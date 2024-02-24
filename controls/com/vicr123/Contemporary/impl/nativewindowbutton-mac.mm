#import <AppKit/AppKit.h>

#include "nativewindowbutton.h"

#include <QPainter>
#include <QWindow>
#include <QQuickWindow>

struct NativeWindowButtonPrivate {
    NativeWindowButton* parent;
    QWindow* window = nullptr;
    NSButton* button = nil;
    int systemWindowType;

    void setupWindow(QQuickWindow *window);
    void repositionButton();
    NSButton* standardWindowButton(NSWindowButton windowButton, NSWindowStyleMask styleMask, QWindow *parent);
};

NSButton* NativeWindowButtonPrivate::standardWindowButton(NSWindowButton windowButton, NSWindowStyleMask styleMask, QWindow* parent) {
    auto button = [NSWindow standardWindowButton:windowButton forStyleMask:styleMask];
    auto parentWindow = reinterpret_cast<NSView*>(parent->winId());
    [parentWindow addSubview:button];

    return button;
}

NativeWindowButton::NativeWindowButton(QQuickItem *parent) : QQuickPaintedItem(parent) {
    d = new NativeWindowButtonPrivate();
    d->parent = this;
    connect(this, &NativeWindowButton::windowChanged, this, [this](QQuickWindow* window) {
        d->setupWindow(window);
    });
    connect(this, &NativeWindowButton::visibleChanged, this, [this] {
        [d->button setHidden:!this->isVisible()];
    });

    d->setupWindow(this->window());
}

NativeWindowButton::~NativeWindowButton()
{
    delete d;
}

bool NativeWindowButton::haveNativeControls()
{
    return true;
}

int NativeWindowButton::systemWindowType()
{
    return d->systemWindowType;
}

void NativeWindowButton::setSystemWindowType(int systemWindowType)
{
    d->systemWindowType = systemWindowType;
    d->setupWindow(this->window());
    emit systemWindowTypeChanged(systemWindowType);
}

void NativeWindowButtonPrivate::setupWindow(QQuickWindow *window)
{
    if (this->window) {
        [button setHidden:YES];
    }
    this->window = window;
    if (this->window) {
        auto mask = NSWindowStyleMaskFullSizeContentView | NSWindowStyleMaskResizable | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable;
        NSWindowButton button = NSWindowCloseButton;
        switch (this->systemWindowType) {
            case 0:
                button = NSWindowCloseButton;
                break;
            case 1:
                button = NSWindowMiniaturizeButton;
                break;
            case 2:
                button = NSWindowZoomButton;
                break;
        }
        this->button = standardWindowButton(button, mask, window);

        this->repositionButton();
    }
}

void NativeWindowButtonPrivate::repositionButton()
{
    if (this->window) {
        auto coords = this->window->mapFromGlobal(this->parent->mapToGlobal(QPoint(0, 0)));
        [this->button setFrameOrigin:{coords.x(), coords.y()}];
    }
}

void NativeWindowButton::paint(QPainter *painter)
{
    d->repositionButton();
}
