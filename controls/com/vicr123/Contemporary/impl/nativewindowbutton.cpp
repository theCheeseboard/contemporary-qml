#include "nativewindowbutton.h"

#include <QPainter>

NativeWindowButton::NativeWindowButton(QQuickItem *parent)
    : QQuickPaintedItem(parent) {
    this->setVisible(false);
}

NativeWindowButton::~NativeWindowButton() {}

bool NativeWindowButton::haveNativeControls()
{
    return false;
}

bool NativeWindowButton::haveWindowControls()
{
#if defined(Q_OS_IOS) | defined(Q_OS_ANDROID)
    return false;
#else
    return true;
#endif
}

void NativeWindowButton::paint(QPainter *painter)
{

}

int NativeWindowButton::systemWindowType()
{
    return 0;
}

void NativeWindowButton::setSystemWindowType(int systemWindowType)
{

}

void NativeWindowButton::geometryChange(const QRectF &newGeometry, const QRectF &oldGeometry)
{
}
