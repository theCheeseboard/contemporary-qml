cmake_minimum_required(VERSION 3.16)

qt_add_qml_module(contemporary-controls-impl
    URI com.vicr123.Contemporary.impl
    QML_FILES
        WindowControls.qml
        FocusDecoration.qml
        ButtonBackground.qml
    SOURCES
        nativewindowbutton.h
    PLUGIN_TARGET contemporary-controls-impl-plugin
)

if(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    target_sources(contemporary-controls-impl PRIVATE nativewindowbutton-mac.mm)
else()
    target_sources(contemporary-controls-impl PRIVATE nativewindowbutton.cpp)
endif()

qt_add_resources(contemporary-controls-impl "contemporary-qml-impl-resources"
    PREFIX "/com/vicr123/Contemporary/qml"
    FILES
        icons/close.svg
        icons/max.svg
        icons/min.svg
        icons/res.svg
)

target_link_libraries(contemporary-controls-impl
    PRIVATE Qt6::Quick Qt6::QuickControls2
)
