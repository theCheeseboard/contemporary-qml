#include "safezone.h"

struct SafeZonePrivate {
    SafeZone* parent = nullptr;
    qreal left = 0;
    bool leftSet = false;
    qreal right = 0;
    bool rightSet = false;
    qreal top = 0;
    bool topSet = false;
    qreal bottom = 0;
    bool bottomSet = false;
    qreal plusTop = 0;
    qreal plusLeft = 0;
    qreal plusRight = 0;
    qreal plusBottom = 0;
};

SafeZone::SafeZone(QObject* parent) : QQuickAttachedPropertyPropagator(parent) {
    d = new SafeZonePrivate();
    this->initialize();
}

SafeZone::~SafeZone() {
    delete d;
}

SafeZone* SafeZone::qmlAttachedProperties(QObject* object) {
    return new SafeZone(object);
}

qreal SafeZone::left() const {
    return d->left;
}

void SafeZone::setLeft(qreal left) {
    d->left = left;
    d->leftSet = true;
    emit leftChanged();
    this->propagate();
}

void SafeZone::resetLeft() {
    d->left = 0;
    d->leftSet = false;
    emit leftChanged();
    this->propagate();
}

qreal SafeZone::right() const {
    return d->right;
}

void SafeZone::setRight(qreal right) {
    d->right = right;
    d->rightSet = true;
    emit rightChanged();
    this->propagate();
}

void SafeZone::resetRight() {
    d->right = 0;
    d->rightSet = false;
    emit rightChanged();
    this->propagate();
}

qreal SafeZone::top() const {
    return d->top;
}

void SafeZone::setTop(qreal top) {
    d->top = top;
    d->topSet = true;
    emit topChanged();
    this->propagate();
}

void SafeZone::resetTop() {
    d->top = 0;
    d->topSet = false;
    emit topChanged();
    this->propagate();
}

qreal SafeZone::bottom() const {
    return d->bottom;
}

void SafeZone::setBottom(qreal bottom) {
    d->bottom = bottom;
    d->bottomSet = true;
    emit bottomChanged();
    this->propagate();
}

void SafeZone::resetBottom() {
    d->bottom = 0;
    d->bottomSet = false;
    emit bottomChanged();
    this->propagate();
}

qreal SafeZone::plusTop() const {
    return d->plusTop;
}

void SafeZone::setPlusTop(qreal plusTop) {
    d->plusTop = plusTop;
    emit plusTopChanged();
    this->propagate();
}

void SafeZone::resetPlusTop() {
    setPlusTop(0);
}

qreal SafeZone::plusLeft() const {
    return d->plusLeft;
}

qreal SafeZone::plusRight() const {
    return d->plusRight;
}

qreal SafeZone::plusBottom() const {
    return d->plusBottom;
}
void SafeZone::setPlusLeft(qreal plusLeft) {
    d->plusLeft = plusLeft;
    emit plusLeftChanged();
    this->propagate();
}

void SafeZone::setPlusRight(qreal plusRight) {
    d->plusRight = plusRight;
    emit plusRightChanged();
    this->propagate();
}

void SafeZone::setPlusBottom(qreal plusBottom) {
    d->plusBottom = plusBottom;
    emit plusBottomChanged();
    this->propagate();
}
void SafeZone::resetPlusLeft() {
    setPlusLeft(0);
}

void SafeZone::resetPlusRight() {
    setPlusRight(0);
}

void SafeZone::resetPlusBottom() {
    setPlusBottom(0);
}

void SafeZone::propagate() {
    auto safeZones = this->attachedChildren();
    for (const auto child : safeZones) {
        if (auto childSafeZone = qobject_cast<SafeZone*>(child)) childSafeZone->inherit(d);
    }
}

void SafeZone::inherit(SafeZonePrivate* other) {
    if (!d->leftSet) {
        d->left = other->left + other->plusLeft;
        emit leftChanged();
    }

    if (!d->rightSet) {
        d->right = other->right + other->plusRight;
        emit rightChanged();
    }

    if (!d->topSet) {
        d->top = other->top + other->plusTop;
        emit topChanged();
    }

    if (!d->bottomSet) {
        d->bottom = other->bottom + other->plusBottom;
        emit bottomChanged();
    }

    this->propagate();
}

void SafeZone::attachedParentChange(QQuickAttachedPropertyPropagator* newParent, QQuickAttachedPropertyPropagator* oldParent) {
    if (auto safeZone = qobject_cast<SafeZone*>(newParent)) {
        this->inherit(safeZone->d);
    }
}