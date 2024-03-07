cmake_minimum_required(VERSION 3.16)

add_subdirectory(impl)

qt_add_qml_module(contemporary-controls
    URI com.vicr123.Contemporary
    QML_FILES
        ExampleControl.qml
        ContemporaryWindow.qml
        ActionBar.qml
        ActionBarTabber.qml
        Pager.qml
        Grandstand.qml
        SubtitleLabel.qml
        Layer.qml
        MenuSection.qml
    SOURCES
        contemporarycontrolsqmlplugin.h contemporarycontrolsqmlplugin.cpp
        safezone.h safezone.cpp
    PLUGIN_TARGET contemporary-controls-plugin
)

target_link_libraries(contemporary-controls
    PRIVATE contemporary-controls-impl Qt6::Quick Qt6::QuickControls2
)

add_subdirectory(CoreStyles)
