cmake_minimum_required(VERSION 3.16)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(ANDROID_VERSION_CODE 1 CACHE STRING "Android Version Code")

find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Quick QuickControls2 LinguistTools)
find_package(libcontemporary)

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
    NO_CACHEGEN
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
        MACOSX_BUNDLE_GUI_IDENTIFIER com.vicr123.contemporary.PlaygrounC
        MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
        MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
        MACOSX_BUNDLE_INFO_PLIST ${CMAKE_CURRENT_SOURCE_DIR}/Info.plist.in
        MACOSX_BUNDLE TRUE
        WIN32_EXECUTABLE TRUE
        QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android
        QT_ANDROID_VERSION_CODE ${ANDROID_VERSION_CODE}
        CNTP_DATA_SUBDIR contemporary/playground
        QT_QML_IMPORT_PATH ${CMAKE_BINARY_DIR}/qml
        QT_ANDROID_TARGET_SDK_VERSION 33
)

cntp_init(appplayground 20)
cntp_translate(appplayground)
cntp_target_name(appplayground "Contemporary Playground")
cntp_app_icon(appplayground
    BASEICON icons/baseicon.svg
    BASEICON_MAC icons/baseicon-mac.svg
)

target_link_libraries(appplayground
    PRIVATE libcontemporary Qt::Quick Qt::QuickControls2
)

target_include_directories(appplayground
    PRIVATE ../controls/com/vicr123/Contemporary/CoreStyles
)

if(CMAKE_SYSTEM_NAME STREQUAL "iOS")
    target_link_libraries(appplayground
        PRIVATE contemporary-corecontrols-plugin contemporary-controls-plugin
    )
else()
    # Ensure the plugins are built
    add_dependencies(appplayground
        contemporary-corecontrols-plugin contemporary-controls-plugin
    )
endif()

include(GNUInstallDirs)
install(TARGETS appplayground
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
