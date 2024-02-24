#ifndef NATIVEWINDOWBUTTON_H
#define NATIVEWINDOWBUTTON_H

#include <QQmlEngine>
#include <QQuickPaintedItem>

struct NativeWindowButtonPrivate;
class NativeWindowButton : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(int systemWindowType READ systemWindowType WRITE setSystemWindowType NOTIFY systemWindowTypeChanged FINAL)
    Q_PROPERTY(bool haveNativeControls READ haveNativeControls CONSTANT)
    QML_ELEMENT

public:
    explicit NativeWindowButton(QQuickItem* parent = 0);
    ~NativeWindowButton();

    static bool haveNativeControls();

    int systemWindowType();
    void setSystemWindowType(int systemWindowType);

signals:
    void systemWindowTypeChanged(int systemWindowType);

private:
    NativeWindowButtonPrivate* d;

    // QQuickPaintedItem interface
public:
    void paint(QPainter *painter);
};

#endif // NATIVEWINDOWBUTTON_H
