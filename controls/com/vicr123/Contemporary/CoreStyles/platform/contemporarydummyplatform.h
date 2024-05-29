#ifndef CONTEMPORARYDUMMYPLATFORM_H
#define CONTEMPORARYDUMMYPLATFORM_H

#include "contemporaryqmlplatform.h"
#include <QObject>

class ContemporaryDummyPlatform : public ContemporaryQmlPlatform {
        Q_OBJECT
    public:
        explicit ContemporaryDummyPlatform(QObject* parent = nullptr);

        // ContemporaryQmlPlatform interface
    public:
        ContemporaryStyle::ColorTheme systemColorTheme();
};

#endif // CONTEMPORARYDUMMYPLATFORM_H
