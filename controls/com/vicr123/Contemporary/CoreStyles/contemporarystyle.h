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

public:
    explicit ContemporaryStyle(QObject *parent = nullptr);
    ~ContemporaryStyle();

    static ContemporaryStyle* qmlAttachedProperties(QObject *object);

    QColor accent() const;
    void setAccent(QColor accent);

    Q_INVOKABLE QColor hovered(QColor color);
    Q_INVOKABLE QColor pressed(QColor color);
    Q_INVOKABLE QColor disabled(QColor color);
    Q_INVOKABLE QColor calculateColor(QColor color, bool hovered, bool pressed, bool disabled);

signals:
    void accentChanged();

private:
    ContemporaryStylePrivate* d;
};

QML_DECLARE_TYPEINFO(ContemporaryStyle, QML_HAS_ATTACHED_PROPERTIES)

#endif // CONTEMPORARYSTYLE_H
