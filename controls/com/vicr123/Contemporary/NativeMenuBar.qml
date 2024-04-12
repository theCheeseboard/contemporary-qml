import QtQuick
import Qt.labs.platform as Labs

Item {
    id: root
    default property list<QtObject> menuBarData

    Component {
        id: menuBar

        Labs.MenuBar {
            id: nativeMenuBar
            data: root.menuBarData
        }
    }

    Loader {
        sourceComponent: Qt.platform.os !== "windows" ? menuBar : null
    }
}
