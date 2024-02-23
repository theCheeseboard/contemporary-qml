cmake_minimum_required(VERSION 3.16)

qt_add_qml_module(contemporary-controls-impl
    URI com.vicr123.Contemporary.impl
    QML_FILES
        WindowControls.qml
    PLUGIN_TARGET contemporary-controls-impl-plugin
)

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
