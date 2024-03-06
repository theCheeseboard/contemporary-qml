#include "contemporaryinitialisation.h"

#include "contemporarystyle.h"
#include <QGuiApplication>
#include <QPalette>

void ContemporaryInitialisation::init()
{
    ContemporaryStyle style;
    auto pal = QGuiApplication::palette();

    pal.setColor(QPalette::Normal, QPalette::WindowText, style.foreground());
    pal.setColor(QPalette::Normal, QPalette::Window, style.background());

    QGuiApplication::setPalette(pal);
}
