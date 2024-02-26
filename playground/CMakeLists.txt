cmake_minimum_required(VERSION 3.16)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt${QT_VERSION_MAJOR} 6.4 REQUIRED COMPONENTS Quick QuickControls2)

qt_standard_project_setup()

qt_add_executable(appplayground
    main.cpp
)

qt_add_qml_module(appplayground
    URI playground
    VERSION 1.0
    QML_FILES Main.qml pages/Buttons.qml
    QML_FILES pages/CheckboxesRadioButtons.qml
    QML_FILES pages/TextInput.qml
    QML_FILES pages/TumblerPage.qml
    QML_FILES pages/ComboBoxPage.qml
    QML_FILES pages/Ranges.qml
    QML_FILES pages/Progress.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appplayground PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appplayground
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appplayground
    PRIVATE contemporary-corecontrols contemporary-controls Qt6::Quick Qt6::QuickControls2
)
target_include_directories(appplayground
    PRIVATE ../controls/com/vicr123/Contemporary/CoreStyles
)

include(GNUInstallDirs)
install(TARGETS appplayground
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
