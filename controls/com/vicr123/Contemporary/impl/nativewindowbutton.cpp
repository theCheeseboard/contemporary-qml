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
