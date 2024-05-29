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
        SwipeAction.qml
        Interstitial.qml
        ContemporaryStackView.qml
        ContemporaryWindowSurface.qml
        AboutSurface.qml
        NativeMenuBar.qml
    SOURCES
        contemporarycontrolsqmlplugin.h contemporarycontrolsqmlplugin.cpp
        safezone.h safezone.cpp
    PLUGIN_TARGET contemporary-controls-plugin
    NO_CACHEGEN
    QML_FILES LayerCalculator.qml
)

target_link_libraries(contemporary-controls
    PRIVATE contemporary-controls-impl Qt6::Quick Qt6::QuickControls2
)

install(TARGETS contemporary-controls
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)


add_subdirectory(CoreStyles)
