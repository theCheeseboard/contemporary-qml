cmake_minimum_required(VERSION 3.16)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt${QT_VERSION_MAJOR} 6.4 REQUIRED COMPONENTS Quick QuickControls2)
find_package(libcontemporary)

cntp_define_build_dirs()

qt_standard_project_setup()

set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml)
set(QML_IMPORT_PATH ${QT_QML_OUTPUT_DIRECTORY} CACHE STRING "Import paths for QML" FORCE)

add_subdirectory(com/vicr123/Contemporary)

if(CMAKE_SYSTEM_NAME STREQUAL "Android")
    install(DIRECTORY ${QT_QML_OUTPUT_DIRECTORY}/
        DESTINATION ${CNTP_INSTALL_QML})
endif()
