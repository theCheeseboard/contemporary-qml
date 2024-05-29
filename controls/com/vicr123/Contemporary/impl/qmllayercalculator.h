#ifndef QMLLAYERCALCULATOR_H
#define QMLLAYERCALCULATOR_H

#include <QObject>
#include <QQmlEngine>

struct QmlLayerCalculatorPrivate;
class QmlLayerCalculator : public QObject {
        Q_OBJECT
        Q_PROPERTY(int layer READ layer WRITE setLayer NOTIFY layerChanged FINAL)
        Q_PROPERTY(QColor baseColor READ baseColor WRITE setBaseColor NOTIFY baseColorChanged FINAL)
        Q_PROPERTY(QColor layerColor READ layerColor WRITE setLayerColor NOTIFY layerColorChanged FINAL)
        Q_PROPERTY(QColor color READ color NOTIFY colorChanged FINAL)
        QML_NAMED_ELEMENT(LayerCalculator)
    public:
        explicit QmlLayerCalculator(QObject* parent = nullptr);
        ~QmlLayerCalculator();

        int layer();
        void setLayer(int layer);

        QColor baseColor();
        void setBaseColor(QColor color);

        QColor layerColor();
        void setLayerColor(QColor color);

        QColor color();

    signals:
        void layerChanged();
        void baseColorChanged();
        void layerColorChanged();
        void colorChanged();

    private:
        QmlLayerCalculatorPrivate* d;
};

#endif // QMLLAYERCALCULATOR_H
