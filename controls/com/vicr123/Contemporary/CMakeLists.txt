cmake_minimum_required(VERSION 3.16)

add_subdirectory(impl)

qt_add_qml_module(contemporary-controls
    URI com.vicr123.Contemporary
    QML_FILES
        ExampleControl.qml
        ContemporaryWindow.qml
    SOURCES
        contemporarycontrolsqmlplugin.h contemporarycontrolsqmlplugin.cpp
    PLUGIN_TARGET contemporary-controls-plugin
    QML_FILES ActionBar.qml
)

target_link_libraries(contemporary-controls
    PRIVATE contemporary-controls-impl
)

add_subdirectory(CoreStyles)
