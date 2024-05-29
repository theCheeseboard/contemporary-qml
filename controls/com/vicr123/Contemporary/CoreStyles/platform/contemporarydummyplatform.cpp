#include "contemporarydummyplatform.h"

ContemporaryDummyPlatform::ContemporaryDummyPlatform(QObject* parent) :
    ContemporaryQmlPlatform{parent} {
}

ContemporaryStyle::ColorTheme ContemporaryDummyPlatform::systemColorTheme() {
    return ContemporaryStyle::ColorTheme::Dark;
}
