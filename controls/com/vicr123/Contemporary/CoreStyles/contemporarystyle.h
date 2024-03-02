#ifndef CONTEMPORARYSTYLE_H
#define CONTEMPORARYSTYLE_H

#include <QObject>
#include <QColor>
#include <QtQml>

struct ContemporaryStylePrivate;
class ContemporaryStyle : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QColor accent READ accent WRITE setAccent NOTIFY accentChanged)
    Q_PROPERTY(QColor background READ background WRITE setBackground NOTIFY backgroundChanged)
    Q_PROPERTY(QColor foreground READ foreground WRITE setForeground NOTIFY foregroundChanged)
    Q_PROPERTY(QColor line READ line WRITE setLine NOTIFY lineChanged)
    Q_PROPERTY(QColor focusDecoration READ focusDecoration WRITE setFocusDecoration NOTIFY focusDecorationChanged)
    Q_PROPERTY(QColor backgroundAccent READ backgroundAccent WRITE setBackgroundAccent NOTIFY backgroundAccentChanged)
    Q_PROPERTY(Qt::Edge windowControlSide READ windowControlSide CONSTANT)
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

    Qt::Edge windowControlSide() const;

    Q_INVOKABLE static QColor hovered(QColor color);
    Q_INVOKABLE static QColor pressed(QColor color);
    Q_INVOKABLE static QColor disabled(QColor color);
    Q_INVOKABLE QColor calculateColor(QColor color, bool hovered, bool pressed, bool disabled);

signals:
    void accentChanged();
    void backgroundChanged();
    void foregroundChanged();
    void lineChanged();
    void focusDecorationChanged();
    void backgroundAccentChanged();

private:
    ContemporaryStylePrivate* d;
};

QML_DECLARE_TYPEINFO(ContemporaryStyle, QML_HAS_ATTACHED_PROPERTIES)

#endif // CONTEMPORARYSTYLE_H