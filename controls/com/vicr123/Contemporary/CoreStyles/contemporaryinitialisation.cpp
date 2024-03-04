#include "contemporaryinitialisation.h"

#include "contemporarystyle.h"
#include <QGuiApplication>
#include <QPalette>

void ContemporaryInitialisation::init()
{
    qmlRegisterUncreatableType<ContemporaryStyle>("Contemporary", 1, 0, "Contemporary", "Contemporary is an attached property");

    ContemporaryStyle style;
    auto pal = QGuiApplication::palette();

    pal.setColor(QPalette::Normal, QPalette::WindowText, style.foreground());
    pal.setColor(QPalette::Normal, QPalette::Window, style.background());

    QGuiApplication::setPalette(pal);
}
