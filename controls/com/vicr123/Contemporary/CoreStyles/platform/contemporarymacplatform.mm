#include "contemporarymacplatform.h"

#import <AppKit/AppKit.h>
#import <Foundation/Foundation.h>

@interface Notifier : NSObject {
    ContemporaryMacPlatform* _platform;
}

- (id)initWithPlatform:(ContemporaryMacPlatform*)platform;
- (void)listenToInterfaceChangesNotification;
- (void)interfaceModeChanged;

@end

@implementation Notifier

- (id)initWithPlatform:(ContemporaryMacPlatform *)platform {
    self = [super init];
    if (self) {
        _platform = platform;
        [self listenToInterfaceChangesNotification];
    }
    return self;
}

- (void)listenToInterfaceChangesNotification {
    NSDistributedNotificationCenter *center = [NSDistributedNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(interfaceModeChanged) name:@"AppleInterfaceThemeChangedNotification" object:nil];
}

- (void)interfaceModeChanged {
    _platform->systemColorThemeChanged();
}

- (void)dealloc {
    NSDistributedNotificationCenter *center = [NSDistributedNotificationCenter defaultCenter];
    [center removeObserver:self name:@"AppleInterfaceThemeChangedNotification" object:nil];
    [super dealloc];
}

@end

struct ContemporaryMacPlatformPrivate {
    Notifier* notifier;
};

ContemporaryMacPlatform::ContemporaryMacPlatform(QObject* parent) :
    ContemporaryQmlPlatform{parent}, d{new ContemporaryMacPlatformPrivate()} {
    d->notifier = [[Notifier alloc] initWithPlatform:this];
}

ContemporaryMacPlatform::~ContemporaryMacPlatform() {
    delete d;
}

ContemporaryStyle::ColorTheme ContemporaryMacPlatform::systemColorTheme() {
    auto appearance = [[NSApp effectiveAppearance] name];
    if (appearance == NSAppearanceNameDarkAqua || appearance == NSAppearanceNameVibrantDark || appearance == NSAppearanceNameAccessibilityHighContrastDarkAqua) {
        return ContemporaryStyle::ColorTheme::Dark;
    }
    return ContemporaryStyle::ColorTheme::Light;
}
