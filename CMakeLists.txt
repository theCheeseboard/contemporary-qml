cmake_minimum_required(VERSION 3.16)

project(contemporary-qml VERSION 0.1 LANGUAGES CXX)

find_package(QT REQUIRED NAMES Qt6)
find_package(Qt${QT_VERSION_MAJOR} 6.4 REQUIRED COMPONENTS Quick QuickControls2)

qt_policy(
    SET QTP0001 NEW
)

add_subdirectory(controls)
add_subdirectory(playground)
