#ifndef CONTEMPORARYMACPLATFORM_H
#define CONTEMPORARYMACPLATFORM_H

#include "contemporaryqmlplatform.h"
#include <QObject>

struct ContemporaryMacPlatformPrivate;
class ContemporaryMacPlatform : public ContemporaryQmlPlatform {
        Q_OBJECT
    public:
        explicit ContemporaryMacPlatform(QObject* parent = nullptr);
        ~ContemporaryMacPlatform();

    private:
        ContemporaryMacPlatformPrivate* d;

        // ContemporaryQmlPlatform interface
    public:
        ContemporaryStyle::ColorTheme systemColorTheme();
};

#endif // CONTEMPORARYMACPLATFORM_H
