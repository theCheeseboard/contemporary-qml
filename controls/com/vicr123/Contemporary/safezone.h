#ifndef SAFEZONE_H
#define SAFEZONE_H

#include <QQmlProperty>
#include <QQuickAttachedPropertyPropagator>
#include <QQuickItem>

struct SafeZonePrivate;
class SafeZone : public QQuickAttachedPropertyPropagator {
        Q_OBJECT

        Q_PROPERTY(qreal left READ left WRITE setLeft RESET resetLeft NOTIFY leftChanged)
        Q_PROPERTY(qreal right READ right WRITE setRight RESET resetRight NOTIFY rightChanged)
        Q_PROPERTY(qreal top READ top WRITE setTop RESET resetTop NOTIFY topChanged)
        Q_PROPERTY(qreal bottom READ bottom WRITE setBottom RESET resetBottom NOTIFY bottomChanged)

        QML_ELEMENT
        QML_ATTACHED(SafeZone)
        QML_UNCREATABLE("")

    public:
        explicit SafeZone(QObject* parent);
        ~SafeZone();

        static SafeZone* qmlAttachedProperties(QObject* object);

        qreal left() const;
        void setLeft(qreal left);
        void resetLeft();

        qreal right() const;
        void setRight(qreal right);
        void resetRight();

        qreal top() const;
        void setTop(qreal top);
        void resetTop();

        qreal bottom() const;
        void setBottom(qreal bottom);
        void resetBottom();

    signals:
        void leftChanged();
        void rightChanged();
        void topChanged();
        void bottomChanged();

    private:
        struct SafeZonePrivate* d;

        void propagate();
        void inherit(SafeZonePrivate* other);

    protected:
        void attachedParentChange(QQuickAttachedPropertyPropagator* newParent, QQuickAttachedPropertyPropagator* oldParent) override;
};

#endif // SAFEZONE_H