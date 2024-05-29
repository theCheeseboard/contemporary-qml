#include "contemporaryqmlplatform.h"

#include "contemporarydummyplatform.h"
#include "contemporarymacplatform.h"

ContemporaryQmlPlatform::ContemporaryQmlPlatform(QObject* parent) :
    QObject{parent} {
}

ContemporaryQmlPlatform* ContemporaryQmlPlatform::platform() {
    static ContemporaryQmlPlatform* platform = nullptr;
    if (platform) return platform;

#ifdef Q_OS_MAC
    platform = new ContemporaryMacPlatform();
    return platform;
#endif

    platform = new ContemporaryDummyPlatform();
    return platform;
}
