cmake_minimum_required(VERSION 3.16)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt${QT_VERSION_MAJOR} 6.4 REQUIRED COMPONENTS Quick QuickControls2)

qt_standard_project_setup()

qt_add_library(contemporary-cppextensions STATIC
    contemporarystyle.cpp contemporarystyle.h
    contemporaryinitialisation.h contemporaryinitialisation.cpp
)

target_link_libraries(contemporary-cppextensions
    PRIVATE Qt6::Quick Qt6::QuickControls2
)
