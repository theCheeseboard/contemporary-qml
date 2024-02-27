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
    SOURCES
        contemporarystyle.cpp contemporarystyle.h
        contemporaryinitialisation.h contemporaryinitialisation.cpp
    PLUGIN_TARGET contemporary-corecontrols-plugin
    QML_FILES SpinBox.qml
    QML_FILES BusyIndicator.qml
)

target_link_libraries(contemporary-corecontrols
    PRIVATE Qt6::Quick Qt6::QuickControls2
)
