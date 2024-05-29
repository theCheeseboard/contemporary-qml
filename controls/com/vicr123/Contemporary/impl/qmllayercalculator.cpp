#include "qmllayercalculator.h"

#include "layercalculator.h"
#include <QColor>

struct QmlLayerCalculatorPrivate {
        int layer = 1;
        QColor baseColor;
        QColor layerColor;
};

QmlLayerCalculator::QmlLayerCalculator(QObject* parent) :
    QObject{parent}, d{new QmlLayerCalculatorPrivate()} {
}

QmlLayerCalculator::~QmlLayerCalculator() {
    delete d;
}

int QmlLayerCalculator::layer() {
    return d->layer;
}

void QmlLayerCalculator::setLayer(int layer) {
    d->layer = layer;
    emit layerChanged();
    emit colorChanged();
}

QColor QmlLayerCalculator::baseColor() {
    return d->baseColor;
}

void QmlLayerCalculator::setBaseColor(QColor color) {
    d->baseColor = color;
    emit baseColorChanged();
    emit colorChanged();
}

QColor QmlLayerCalculator::layerColor() {
    return d->layerColor;
}

void QmlLayerCalculator::setLayerColor(QColor color) {
    d->layerColor = color;
    emit layerColorChanged();
    emit colorChanged();
}

QColor QmlLayerCalculator::color() {
    LayerCalculator calc(d->layer, d->layerColor, d->baseColor);
    return calc.value();
}
