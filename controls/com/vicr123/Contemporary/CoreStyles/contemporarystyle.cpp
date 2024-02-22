#include "contemporarystyle.h"

#include <QColor>

struct ContemporaryStylePrivate {
    QColor accent{0, 50, 150};
    QColor background{40, 40, 40};
    QColor foreground{255, 255, 255};
};

ContemporaryStyle::ContemporaryStyle(QObject *parent)
    : QObject{parent}
{
    d = new ContemporaryStylePrivate();
}

ContemporaryStyle::~ContemporaryStyle()
{
    delete d;
}

ContemporaryStyle *ContemporaryStyle::qmlAttachedProperties(QObject *object)
{
    return new ContemporaryStyle(object);
}

QColor ContemporaryStyle::accent() const {
    return d->accent;
}

void ContemporaryStyle::setAccent(QColor accent) {
    d->accent = accent;
    emit accentChanged();
}

QColor ContemporaryStyle::background() const {
    return d->background;
}

void ContemporaryStyle::setBackground(QColor background) {
    d->background = background;
    emit backgroundChanged();
}

QColor ContemporaryStyle::foreground() const {
    return d->foreground;
}

void ContemporaryStyle::setForeground(QColor foreground) {
    d->foreground = foreground;
    emit foregroundChanged();
}

QColor ContemporaryStyle::hovered(QColor color)
{
    return color.lighter();
}

QColor ContemporaryStyle::pressed(QColor color)
{
    return color.darker();
}

QColor ContemporaryStyle::disabled(QColor color)
{
    return QColor::fromHsvF(color.hsvHueF(), color.hsvSaturationF() / 2, color.valueF() / 2);
}

QColor ContemporaryStyle::calculateColor(QColor color, bool hovered, bool pressed, bool disabled)
{
    if (disabled) return this->disabled(color);
    if (pressed) return this->pressed(color);
    if (hovered) return this->hovered(color);
    return color;
}
