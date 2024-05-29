# Bundle icons from https://github.com/theCheeseboard/contemporary-icons

set(ICONS_REPO_DIR "${CMAKE_CURRENT_BINARY_DIR}/remote/contemporary-icons")

include(FetchContent)
FetchContent_Declare(contemporary-icons
  GIT_REPOSITORY "https://github.com/theCheeseboard/contemporary-icons.git"
  GIT_TAG "master"
  SOURCE_DIR ${ICONS_REPO_DIR}
)
FetchContent_MakeAvailable(contemporary-icons)

file(GLOB_RECURSE ICONS_ALL_SOURCES ${ICONS_REPO_DIR}/*)

foreach(source ${ICONS_ALL_SOURCES})
    if(EXISTS ${source})
        list(APPEND ICONS_SOURCES ${source})
    endif()
endforeach()

qt_add_resources(contemporary-corecontrols-plugin libcontemporary-qml-contemporaryicons
    PREFIX "/com/vicr123/libcontemporary/contemporary-icons"
    FILES ${ICONS_SOURCES}
    BASE ${ICONS_REPO_DIR}
)

target_compile_definitions(contemporary-corecontrols-plugin PRIVATE
    CNTP_COMPILED_ICONS
)
