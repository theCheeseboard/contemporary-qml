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
    PLUGIN_TARGET contemporary-corecontrols-plugin
    NO_GENERATE_PLUGIN_SOURCE
    NO_PLUGIN_OPTIONAL
    CLASS_NAME ContemporaryStylePlugin
)

target_link_libraries(contemporary-corecontrols
    PRIVATE Qt::Quick Qt::QuickControls2
)

target_sources(contemporary-corecontrols-plugin PRIVATE
    contemporarystyleplugin.h contemporarystyleplugin.cpp
    contemporarystyle.cpp contemporarystyle.h
    contemporaryinitialisation.h contemporaryinitialisation.cpp
)

target_link_libraries(contemporary-corecontrols-plugin
        PRIVATE Qt::Quick Qt::QuickControls2
)