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
        Q_PROPERTY(qreal plusTop READ plusTop WRITE setPlusTop RESET resetPlusTop NOTIFY plusTopChanged)
        Q_PROPERTY(qreal plusLeft READ plusLeft WRITE setPlusLeft RESET resetPlusLeft NOTIFY plusLeftChanged)
        Q_PROPERTY(qreal plusRight READ plusRight WRITE setPlusRight RESET resetPlusRight NOTIFY plusRightChanged)
        Q_PROPERTY(qreal plusBottom READ plusBottom WRITE setPlusBottom RESET resetPlusBottom NOTIFY plusBottomChanged)

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

        qreal plusTop() const;
        void setPlusTop(qreal plusTop);
        void resetPlusTop();

        qreal plusLeft() const;
        void setPlusLeft(qreal plusLeft);
        void resetPlusLeft();

        qreal plusRight() const;
        void setPlusRight(qreal plusRight);
        void resetPlusRight();

        qreal plusBottom() const;
        void setPlusBottom(qreal plusBottom);
        void resetPlusBottom();

    signals:
        void leftChanged();
        void rightChanged();
        void topChanged();
        void bottomChanged();
        void plusTopChanged();

        void plusLeftChanged();
        void plusRightChanged();
        void plusBottomChanged();

    private:
        SafeZonePrivate* d;

        void propagate();
        void inherit(SafeZonePrivate* other);

    protected:
        void attachedParentChange(QQuickAttachedPropertyPropagator* newParent, QQuickAttachedPropertyPropagator* oldParent) override;
};

#endif // SAFEZONE_H