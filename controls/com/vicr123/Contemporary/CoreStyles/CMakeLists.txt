cmake_minimum_required(VERSION 3.16)

qt_add_qml_module(contemporary-corecontrols
    URI com.vicr123.Contemporary.CoreStyles
    QML_FILES
        ApplicationWindow.qml
        Button.qml
        CheckBox.qml
        RadioButton.qml
        TextField.qml
        Drawer.qml
        ScrollBar.qml
        ScrollView.qml
        Switch.qml
        Menu.qml
        MenuItem.qml
        MenuSeparator.qml
        GroupBox.qml
        SpinBox.qml
        BusyIndicator.qml
        Popup.qml
        Tumbler.qml
        Label.qml
        ProgressBar.qml
        ComboBox.qml
    PLUGIN_TARGET contemporary-corecontrols-plugin
    NO_GENERATE_PLUGIN_SOURCE
    NO_PLUGIN_OPTIONAL
    CLASS_NAME ContemporaryStylePlugin
    NO_CACHEGEN
)

target_link_libraries(contemporary-corecontrols
    PRIVATE Qt::Quick Qt::QuickControls2
)

target_sources(contemporary-corecontrols-plugin PRIVATE
    contemporarystyleplugin.h contemporarystyleplugin.cpp
    contemporarystyle.cpp contemporarystyle.h
    contemporaryinitialisation.h contemporaryinitialisation.cpp

    platform/contemporaryqmlplatform.h platform/contemporaryqmlplatform.cpp
    platform/contemporarydummyplatform.h platform/contemporarydummyplatform.cpp
)

if(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    target_sources(contemporary-corecontrols-plugin PRIVATE
        platform/contemporarymacplatform.h
        platform/contemporarymacplatform.mm
    )
endif()

qt_add_resources(contemporary-corecontrols-plugin libcontemporary-qml-corestyles
    PREFIX "/com/vicr123/libcontemporary/corestyles"
    FILES
        colors.json
        combobox-corner.svg
)

target_link_libraries(contemporary-corecontrols-plugin
        PRIVATE Qt::Quick Qt::QuickControls2
)

install(TARGETS contemporary-corecontrols
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

if(CNTP_BUNDLE_ICONS)
    include(IconBundler.cmake)
endif()
