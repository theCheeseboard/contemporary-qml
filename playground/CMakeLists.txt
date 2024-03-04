cmake_minimum_required(VERSION 3.16)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Quick QuickControls2 LinguistTools)

qt_standard_project_setup()

qt_add_executable(appplayground
    main.cpp
)

qt_add_qml_module(appplayground
    URI playground
    VERSION 1.0
    QML_FILES
        Main.qml
        components/Root.qml
        components/Buttons.qml
        components/CheckboxesRadioButtons.qml
        components/TextInput.qml
        components/TumblerPage.qml
        components/ComboBoxPage.qml
        components/Ranges.qml
        components/Progress.qml
        components/Scrollable.qml

)


qt_add_resources(appplayground "contemporary-playground-resources"
    PREFIX "/com/vicr123/Contemporary/playground"
    FILES
        exploration.jpeg
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
    QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android
)

target_link_libraries(appplayground
    PRIVATE contemporary-corecontrols contemporary-controls Qt::Quick Qt::QuickControls2
)

target_include_directories(appplayground
    PRIVATE ../controls/com/vicr123/Contemporary/CoreStyles
)

if(CMAKE_SYSTEM_NAME STREQUAL "iOS")
    target_link_libraries(appplayground
        PRIVATE contemporary-corecontrols-plugin contemporary-controls-plugin
    )
endif()

include(GNUInstallDirs)
install(TARGETS appplayground
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
