#include "contemporaryinitialisation.h"

#include "contemporarystyle.h"
#include <QQmlApplicationEngine>

void ContemporaryInitialisation::init()
{
    qmlRegisterUncreatableType<ContemporaryStyle>("Contemporary", 1, 0, "Contemporary", "Contemporary is an attached property");
}
