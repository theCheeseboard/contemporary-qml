#include "contemporaryapplication.h"

#include <tapplication.h>

struct ContemporaryApplicationPrivate {

};

ContemporaryApplication::ContemporaryApplication(QObject* parent) : QObject(parent), d{new ContemporaryApplicationPrivate()} {

}

ContemporaryApplication::~ContemporaryApplication() {
    delete d;
}

ContemporaryApplication* ContemporaryApplication::qmlAttachedProperties(QObject* object) {
    return new ContemporaryApplication(object);
}

QIcon ContemporaryApplication::applicationIcon() {
    return tApplication::applicationIcon();
}

QStringList ContemporaryApplication::softwareVersions() {
    QStringList versions;
    for (const auto& [first, second] : tApplication::versions()) {
        versions.append(first);
        versions.append(second);
    }
    return versions;
}

QStringList ContemporaryApplication::copyrightLines() {
    return tApplication::copyrightLines();
}

QString ContemporaryApplication::genericName() {
    return tApplication::genericName();
}

QUrl ContemporaryApplication::websiteUrl() {
    return tApplication::applicationUrl(tApplication::Website);
}

QUrl ContemporaryApplication::fileBugUrl() {
    return tApplication::applicationUrl(tApplication::FileBug);
}

QUrl ContemporaryApplication::sourcesUrl() {
    return tApplication::applicationUrl(tApplication::Sources);
}
