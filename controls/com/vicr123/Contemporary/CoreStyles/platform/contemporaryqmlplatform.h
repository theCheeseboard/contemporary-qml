#ifndef CONTEMPORARYQMLPLATFORM_H
#define CONTEMPORARYQMLPLATFORM_H

#include "../contemporarystyle.h"
#include <QObject>

class ContemporaryQmlPlatform : public QObject {
        Q_OBJECT
    public:
        explicit ContemporaryQmlPlatform(QObject* parent = nullptr);

        static ContemporaryQmlPlatform* platform();

        virtual ContemporaryStyle::ColorTheme systemColorTheme() = 0;

    signals:
        void systemColorThemeChanged();
};

#endif // CONTEMPORARYQMLPLATFORM_H
