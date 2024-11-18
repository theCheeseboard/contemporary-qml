cmake_minimum_required(VERSION 3.16)

project(contemporary-qml VERSION 0.1 LANGUAGES CXX)

option(BUILD_PLAYGROUND "Whether to build the playground" OFF)

find_package(QT REQUIRED NAMES Qt6)
find_package(Qt${QT_VERSION_MAJOR} 6.4 REQUIRED COMPONENTS Quick QuickControls2)

qt_policy(
    SET QTP0001 NEW
)

if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    set(CNTP_BUNDLE_ICONS_DEFAULT OFF)
else()
    set(CNTP_BUNDLE_ICONS_DEFAULT ON)
endif()
option(CNTP_BUNDLE_ICONS "Bundle Contemporary Icons" ${CNTP_BUNDLE_ICONS_DEFAULT})

add_subdirectory(controls)

if(BUILD_PLAYGROUND)
    add_subdirectory(playground)
endif()
