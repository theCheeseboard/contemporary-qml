#include "contemporarystyle.h"

#include <QColor>

struct ContemporaryStylePrivate {
    QColor accent{0, 50, 150};
    QColor background{40, 40, 40};
    QColor foreground{255, 255, 255};
    QColor line{85, 85, 85};
    QColor focusDecoration{20, 125, 200};
    QColor backgroundAccent{50, 50, 50};
    QColor layer{255, 255, 255, 10};
    QColor destructiveAccent{200, 0, 0};
    // QColor accent{0, 150, 255};
    // QColor background{245, 245, 245};
    // QColor foreground{0, 0, 0};
    // QColor line{230, 230, 230};
    // QColor focusDecoration{20, 125, 200};
    // QColor backgroundAccent{50, 50, 50};
    // QColor layer{0, 0, 0, 20};
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

QColor ContemporaryStyle::line() const {
    return d->line;
}

void ContemporaryStyle::setLine(QColor line) {
    d->line = line;
    emit lineChanged();
}

QColor ContemporaryStyle::focusDecoration() const {
    return d->focusDecoration;
}

void ContemporaryStyle::setFocusDecoration(QColor focusDecoration) {
    d->focusDecoration = focusDecoration;
    emit focusDecorationChanged();
}

QColor ContemporaryStyle::backgroundAccent() const {
    return d->backgroundAccent;
}

void ContemporaryStyle::setBackgroundAccent(QColor backgroundAccent) {
    d->backgroundAccent = backgroundAccent;
    emit backgroundAccentChanged();
}

QColor ContemporaryStyle::layer() const {
    return d->layer;
}

void ContemporaryStyle::setlayer(QColor layer) {
    d->layer = layer;
    emit layerChanged();
}

QColor ContemporaryStyle::destructiveAccent() const {
    return d->destructiveAccent;
}

void ContemporaryStyle::setDestructiveAccent(QColor destructiveAccent) {
    d->destructiveAccent = destructiveAccent;
    emit destructiveAccentChanged();
}

Qt::Edge ContemporaryStyle::windowControlSide() const
{
#ifdef Q_OS_MAC
    return Qt::LeftEdge;
#else
    return Qt::RightEdge;
#endif
}

QColor ContemporaryStyle::hovered(QColor color)
{
    if (color.alpha() == 0) return QColor{255, 255, 255, 75};
    return color.lighter();
}

QColor ContemporaryStyle::pressed(QColor color)
{
    if (color.alpha() == 0) return QColor{0, 0, 0, 75};
    return color.darker();
}

QColor ContemporaryStyle::disabled(QColor color)
{
    if (color.alpha() == 0) return color;

    return QColor::fromHsvF(color.hsvHueF(), color.hsvSaturationF() / 2, color.valueF() / 2);
}

QColor ContemporaryStyle::calculateColor(QColor color, bool hovered, bool pressed, bool disabled) {
    if (disabled) return this->disabled(color);
    if (pressed) return this->pressed(color);
    if (hovered) return this->hovered(color);
    return color;
}

QColor ContemporaryStyle::calculateLayer(uint layer) {
    return this->calculateLayer(layer, this->background());
}

QColor ContemporaryStyle::calculateLayer(uint layer, QColor base) {
    if (layer <= 0) return base;

    auto layerColor = this->layer();
    for (auto i = 0; i < layer; i++) {
        base.setRedF(layerColor.alphaF() * layerColor.redF() + (1 - layerColor.alphaF()) * base.redF());
        base.setGreenF(layerColor.alphaF() * layerColor.greenF() + (1 - layerColor.alphaF()) * base.greenF());
        base.setBlueF(layerColor.alphaF() * layerColor.blueF() + (1 - layerColor.alphaF()) * base.blueF());
    }
    return base;
}
