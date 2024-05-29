#include "layercalculator.h"

#include <QColor>

struct LayerCalculatorPrivate {
    uint layer = 1;
    QColor layerBase = Qt::transparent;
    QColor layerColor;
};

LayerCalculator::LayerCalculator(uint layer, QColor layerColor, QColor layerBase, QObject* parent) :
    QObject{parent}, d{new LayerCalculatorPrivate} {
    d->layer = layer;
    d->layerColor = layerColor;
    d->layerBase = layerBase;
}

LayerCalculator::~LayerCalculator() {
    delete d;
}

uint LayerCalculator::layer() const {
    return d->layer;
}

QColor LayerCalculator::layerBase() const {
    return d->layerBase;
}

QColor LayerCalculator::value() const {
    if (d->layer <= 0) return d->layerBase;

    auto layerColor = this->layerColor();
    auto base = this->layerBase();
    for (auto i = 0; i < d->layer; i++) {
        base.setRedF(layerColor.alphaF() * layerColor.redF() + (1 - layerColor.alphaF()) * base.redF());
        base.setGreenF(layerColor.alphaF() * layerColor.greenF() + (1 - layerColor.alphaF()) * base.greenF());
        base.setBlueF(layerColor.alphaF() * layerColor.blueF() + (1 - layerColor.alphaF()) * base.blueF());
    }
    return base;
}

void LayerCalculator::setLayer(uint layer) {
    d->layer = layer;
    emit layerChanged();
    emit valueChanged();
}

void LayerCalculator::setLayerBase(const QColor& color) {
    d->layerBase = color;
    emit layerBaseChanged();
    emit valueChanged();
}

QColor LayerCalculator::layerColor() const {
    return d->layerColor;
}

void LayerCalculator::setLayerColor(const QColor& color) {
    d->layerColor = color;
    emit layerColorChanged();
    emit valueChanged();
}

