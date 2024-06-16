#include "contemporarystyle.h"

#include "platform/contemporaryqmlplatform.h"

#include <QColor>

struct ContemporaryStylePrivate {
        ContemporaryStyle::ColorTheme colorTheme = ContemporaryStyle::ColorTheme::Custom;
        bool followSystemColorTheme = true;

        QColor accent{0, 50, 150};
        QColor background{40, 40, 40};
        QColor foreground{255, 255, 255};
        QColor line{85, 85, 85};
        QColor focusDecoration{20, 125, 200};
        QColor backgroundAccent{50, 50, 50};
        QColor layer{255, 255, 255, 10};
        QColor destructiveAccent{200, 0, 0};
};

ContemporaryStyle::ContemporaryStyle(QObject* parent) :
    QObject{parent} {
    d = new ContemporaryStylePrivate();
    this->setColorTheme(ContemporaryQmlPlatform::platform()->systemColorTheme());
    d->followSystemColorTheme = true;
    emit followSystemColorThemeChanged();

    connect(ContemporaryQmlPlatform::platform(), &ContemporaryQmlPlatform::systemColorThemeChanged, this, [this] {
        if (d->followSystemColorTheme) {
            this->setColorTheme(ContemporaryQmlPlatform::platform()->systemColorTheme());
            d->followSystemColorTheme = true;
            emit followSystemColorThemeChanged();
        }
    });
}

ContemporaryStyle::~ContemporaryStyle() {
    delete d;
}

ContemporaryStyle* ContemporaryStyle::qmlAttachedProperties(QObject* object) {
    static auto instance = new ContemporaryStyle();
    return instance;
}

QColor ContemporaryStyle::accent() const {
    return d->accent;
}

void ContemporaryStyle::setAccent(QColor accent) {
    d->accent = accent;
    emit accentChanged();
    d->followSystemColorTheme = false;
    emit followSystemColorThemeChanged();
    d->colorTheme = ColorTheme::Custom;
    emit colorThemeChanged();
}

QColor ContemporaryStyle::background() const {
    return d->background;
}

void ContemporaryStyle::setBackground(QColor background) {
    d->background = background;
    emit backgroundChanged();
    d->followSystemColorTheme = false;
    emit followSystemColorThemeChanged();
    d->colorTheme = ColorTheme::Custom;
    emit colorThemeChanged();
}

QColor ContemporaryStyle::foreground() const {
    return d->foreground;
}

void ContemporaryStyle::setForeground(QColor foreground) {
    d->foreground = foreground;
    emit foregroundChanged();
    d->followSystemColorTheme = false;
    emit followSystemColorThemeChanged();
    d->colorTheme = ColorTheme::Custom;
    emit colorThemeChanged();
}

QColor ContemporaryStyle::line() const {
    return d->line;
}

void ContemporaryStyle::setLine(QColor line) {
    d->line = line;
    emit lineChanged();
    d->followSystemColorTheme = false;
    emit followSystemColorThemeChanged();
    d->colorTheme = ColorTheme::Custom;
    emit colorThemeChanged();
}

QColor ContemporaryStyle::focusDecoration() const {
    return d->focusDecoration;
}

void ContemporaryStyle::setFocusDecoration(QColor focusDecoration) {
    d->focusDecoration = focusDecoration;
    emit focusDecorationChanged();
    d->followSystemColorTheme = false;
    emit followSystemColorThemeChanged();
    d->colorTheme = ColorTheme::Custom;
    emit colorThemeChanged();
}

QColor ContemporaryStyle::backgroundAccent() const {
    return d->backgroundAccent;
}

void ContemporaryStyle::setBackgroundAccent(QColor backgroundAccent) {
    d->backgroundAccent = backgroundAccent;
    emit backgroundAccentChanged();
    d->followSystemColorTheme = false;
    emit followSystemColorThemeChanged();
    d->colorTheme = ColorTheme::Custom;
    emit colorThemeChanged();
}

QColor ContemporaryStyle::layer() const {
    return d->layer;
}

void ContemporaryStyle::setlayer(QColor layer) {
    d->layer = layer;
    emit layerChanged();
    d->followSystemColorTheme = false;
    emit followSystemColorThemeChanged();
    d->colorTheme = ColorTheme::Custom;
    emit colorThemeChanged();
}

QColor ContemporaryStyle::destructiveAccent() const {
    return d->destructiveAccent;
}

void ContemporaryStyle::setDestructiveAccent(QColor destructiveAccent) {
    d->destructiveAccent = destructiveAccent;
    emit destructiveAccentChanged();
    d->followSystemColorTheme = false;
    emit followSystemColorThemeChanged();
    d->colorTheme = ColorTheme::Custom;
    emit colorThemeChanged();
}

Qt::Edge ContemporaryStyle::windowControlSide() const {
#ifdef Q_OS_MAC
    return Qt::LeftEdge;
#else
    return Qt::RightEdge;
#endif
}

ContemporaryStyle::ColorTheme ContemporaryStyle::colorTheme() {
    return d->colorTheme;
}

bool ContemporaryStyle::followSystemColorTheme() {
    return d->followSystemColorTheme;
}

void ContemporaryStyle::setFollowSystemColorTheme(bool followSystemColorTheme) {
    d->followSystemColorTheme = followSystemColorTheme;
    emit followSystemColorThemeChanged();

    if (followSystemColorTheme) {
        // Update the color theme now
        setColorTheme(ContemporaryQmlPlatform::platform()->systemColorTheme());
        d->followSystemColorTheme = true;
        emit followSystemColorThemeChanged();
    }
}

QColor ContemporaryStyle::hovered(QColor color) {
    if (color.alpha() == 0) return QColor{255, 255, 255, 75};
    return color.lighter();
}

QColor ContemporaryStyle::pressed(QColor color) {
    if (color.alpha() == 0) return QColor{0, 0, 0, 75};
    return color.darker();
}

QColor ContemporaryStyle::disabled(QColor color) {
    if (color.alpha() == 0) return color;

    if (color.valueF() < 0.5) {
        return QColor::fromHsvF(color.hsvHueF(), color.hsvSaturationF() / 2, (1 - color.valueF()) / 2);
    } else {
        return QColor::fromHsvF(color.hsvHueF(), color.hsvSaturationF() / 2, color.valueF() / 2);
    }
}

QColor ContemporaryStyle::calculateColor(QColor color, bool hovered, bool pressed, bool disabled) {
    if (disabled) return this->disabled(color);
    if (pressed) return this->pressed(color);
    if (hovered) return this->hovered(color);
    return color;
}

void ContemporaryStyle::setColorTheme(ColorTheme colorTheme) {
    // Read color resources
    QFile colorResourceFile(":/com/vicr123/libcontemporary/corestyles/colors.json");
    colorResourceFile.open(QFile::ReadOnly);
    auto colors = QJsonDocument::fromJson(colorResourceFile.readAll()).object();
    colorResourceFile.close();

    QJsonObject colorObject;
    if (colorTheme == ColorTheme::Dark) {
        colorObject = colors.value("dark").toObject();
    } else if (colorTheme == ColorTheme::Light) {
        colorObject = colors.value("light").toObject();
    }

    if (colorObject.isEmpty()) return;

    d->accent = readColor(colorObject.value("accent"));
    d->background = readColor(colorObject.value("background"));
    d->foreground = readColor(colorObject.value("foreground"));
    d->line = readColor(colorObject.value("line"));
    d->focusDecoration = readColor(colorObject.value("focusDecoration"));
    d->backgroundAccent = readColor(colorObject.value("backgroundAccent"));
    d->layer = readColor(colorObject.value("layer"));
    d->destructiveAccent = readColor(colorObject.value("destructiveAccent"));

    emit accentChanged();
    emit backgroundChanged();
    emit foregroundChanged();
    emit lineChanged();
    emit focusDecorationChanged();
    emit backgroundAccentChanged();
    emit layerChanged();
    emit destructiveAccentChanged();

    d->followSystemColorTheme = false;
    emit followSystemColorThemeChanged();

    d->colorTheme = colorTheme;
    emit colorThemeChanged();
}

QString ContemporaryStyle::quoteString(QString string) {
    return QLocale().quoteString(string);
}

QString ContemporaryStyle::quoteString(QString locale, QString string) {
    return QLocale(locale).quoteString(string);
}

QColor ContemporaryStyle::readColor(const QJsonValue& jsonColor) {
    QJsonArray colorArray = jsonColor.toArray();
    return {colorArray[0].toInt(), colorArray[1].toInt(), colorArray[2].toInt(), colorArray.size() == 4 ? colorArray[3].toInt() : 255};
}
