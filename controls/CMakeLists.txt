cmake_minimum_required(VERSION 3.16)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt${QT_VERSION_MAJOR} 6.4 REQUIRED COMPONENTS Quick QuickControls2)

qt_standard_project_setup()

set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml)
set(QML_IMPORT_PATH ${QT_QML_OUTPUT_DIRECTORY} CACHE STRING "Import paths for QML" FORCE)

if (NOT DEFINED CACHE{QML_INSTALL_PATH})
    # Find the directory to install QML files
    set(qmake_executable ${QT_QMAKE_EXECUTABLE})
    if (NOT qmake_executable)
        set(qmake_executable "qmake")
    endif()
    execute_process(COMMAND ${qmake_executable} -query QT_INSTALL_QML
        OUTPUT_VARIABLE QT_INSTALL_QML
    )
    set(QML_INSTALL_PATH ${QT_INSTALL_QML} CACHE PATH "Directory to install QML files to")
endif()

add_subdirectory(com/vicr123/Contemporary)

install(DIRECTORY ${QT_QML_OUTPUT_DIRECTORY}
    DESTINATION ${QML_INSTALL_PATH})
