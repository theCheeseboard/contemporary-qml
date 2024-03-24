#ifndef CONTEMPORARYSTYLE_H
#define CONTEMPORARYSTYLE_H

#include "layercalculator.h"

#include <QColor>
#include <QObject>
#include <QtQml>

struct ContemporaryStylePrivate;
class ContemporaryStyle : public QObject
{
    public:
        enum class ColorTheme {
            Light,
            Dark,
            Custom
        };
        Q_ENUM(ColorTheme)

    private:
    Q_OBJECT
    Q_PROPERTY(QColor accent READ accent WRITE setAccent NOTIFY accentChanged)
    Q_PROPERTY(QColor background READ background WRITE setBackground NOTIFY backgroundChanged)
    Q_PROPERTY(QColor foreground READ foreground WRITE setForeground NOTIFY foregroundChanged)
    Q_PROPERTY(QColor line READ line WRITE setLine NOTIFY lineChanged)
    Q_PROPERTY(QColor focusDecoration READ focusDecoration WRITE setFocusDecoration NOTIFY focusDecorationChanged)
    Q_PROPERTY(QColor backgroundAccent READ backgroundAccent WRITE setBackgroundAccent NOTIFY backgroundAccentChanged)
    Q_PROPERTY(QColor layer READ layer WRITE setlayer NOTIFY layerChanged)
    Q_PROPERTY(QColor destructiveAccent READ destructiveAccent WRITE setDestructiveAccent NOTIFY destructiveAccentChanged)
    Q_PROPERTY(Qt::Edge windowControlSide READ windowControlSide CONSTANT)
    Q_PROPERTY(ColorTheme colorTheme READ colorTheme NOTIFY colorThemeChanged)

    QML_NAMED_ELEMENT(Contemporary)
    QML_UNCREATABLE("")
    QML_ATTACHED(ContemporaryStyle)

public:
    explicit ContemporaryStyle(QObject *parent = nullptr);
    ~ContemporaryStyle();

    static ContemporaryStyle* qmlAttachedProperties(QObject *object);

    QColor accent() const;
    void setAccent(QColor accent);

    QColor background() const;
    void setBackground(QColor background);

    QColor foreground() const;
    void setForeground(QColor foreground);

    QColor line() const;
    void setLine(QColor line);

    QColor focusDecoration() const;
    void setFocusDecoration(QColor focusDecoration);

    QColor backgroundAccent() const;
    void setBackgroundAccent(QColor backgroundAccent);

    QColor layer() const;
    void setlayer(QColor layer);

    QColor destructiveAccent() const;
    void setDestructiveAccent(QColor destructiveAccent);

    Qt::Edge windowControlSide() const;

    ColorTheme colorTheme();

    Q_INVOKABLE static QColor hovered(QColor color);
    Q_INVOKABLE static QColor pressed(QColor color);
    Q_INVOKABLE static QColor disabled(QColor color);
    Q_INVOKABLE QColor calculateColor(QColor color, bool hovered, bool pressed, bool disabled);
    Q_INVOKABLE LayerCalculator* calculateLayer(uint layer);
    Q_INVOKABLE LayerCalculator* calculateLayer(uint layer, QColor base);
    // ReSharper disable once CppRedundantQualifier
    Q_INVOKABLE void setColorTheme(ContemporaryStyle::ColorTheme colorTheme);

signals:
    void accentChanged();
    void backgroundChanged();
    void foregroundChanged();
    void lineChanged();
    void focusDecorationChanged();
    void backgroundAccentChanged();
    void layerChanged();
    void destructiveAccentChanged();
    void colorThemeChanged();

private:
    ContemporaryStylePrivate* d;

    QColor readColor(const QJsonValue& jsonColor);
};

QML_DECLARE_TYPEINFO(ContemporaryStyle, QML_HAS_ATTACHED_PROPERTIES)

#endif // CONTEMPORARYSTYLE_H
