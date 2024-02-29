cmake_minimum_required(VERSION 3.16)

add_subdirectory(impl)

qt_add_qml_module(contemporary-controls
    URI com.vicr123.Contemporary
    QML_FILES
        ExampleControl.qml
        ContemporaryWindow.qml
    SOURCES
        contemporarycontrolsqmlplugin.h contemporarycontrolsqmlplugin.cpp
        safezone.h safezone.cpp
    PLUGIN_TARGET contemporary-controls-plugin
    QML_FILES ActionBar.qml
)

target_link_libraries(contemporary-controls
    PRIVATE contemporary-controls-impl Qt6::Quick Qt6::QuickControls2
)

add_subdirectory(CoreStyles)
