#ifndef LAYERCALCULATOR_H
#define LAYERCALCULATOR_H

#include <QObject>
#include <QColor>

struct LayerCalculatorPrivate;
class LayerCalculator : public QObject {
        Q_OBJECT
        Q_PROPERTY(uint layer READ layer WRITE setLayer NOTIFY layerChanged)
        Q_PROPERTY(QColor layerBase READ layerBase WRITE setLayerBase NOTIFY layerBaseChanged)
        Q_PROPERTY(QColor layerColor READ layerColor WRITE setLayerColor NOTIFY layerColorChanged)
        Q_PROPERTY(QColor value READ value NOTIFY valueChanged)

    public:
        explicit LayerCalculator(uint layer, QColor layerColor, QColor layerBase = Qt::transparent, QObject* parent = nullptr);
        ~LayerCalculator();

        uint layer() const;
        void setLayer(uint layer);

        QColor layerBase() const;
        void setLayerBase(const QColor& color);

        QColor layerColor() const;
        void setLayerColor(const QColor& color);

        QColor value() const;

    signals:
        void layerChanged();
        void layerBaseChanged();
        void layerColorChanged();
        void valueChanged();

    private:
        LayerCalculatorPrivate* d;
};

#endif // LAYERCALCULATOR_H
