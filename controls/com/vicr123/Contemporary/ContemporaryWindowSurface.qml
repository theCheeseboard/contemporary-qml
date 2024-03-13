import QtQuick
import QtQuick.Controls
import com.vicr123.Contemporary.impl
import Contemporary

Item {
    id: root

    property alias actionBar: actionBarLoader.sourceComponent
    property bool overlayActionBar: false
    default property alias contents: contentContainer.data

    Loader {
        id: actionBarLoader
        z: 100
    }

    WindowControls {
        id: windowControls
        z: 100
    }

    Item {
        id: contentContainer
    }

    MouseArea {
        id: titleBar

        Label {
            anchors.fill: parent
            text: Window.window.title
            horizontalAlignment: Qt.AlignLeft
            verticalAlignment: Qt.AlignVCenter
        }

        onPressed: Window.window.startSystemMove();
    }


    QtObject {
        id: safeZones
        property real top: 0
        property real bottom: 0
    }

    SafeZone.plusTop: safeZones.top
    SafeZone.plusBottom: safeZones.bottom

    states: [
        State {
            name: "mobile"
            when: root.width < 640
            AnchorChanges {
                target: windowControls
                anchors.left: Contemporary.windowControlSide === Qt.RightEdge ? undefined : parent.left
                anchors.top: parent.top
                anchors.right: Contemporary.windowControlSide === Qt.RightEdge ? parent.right : undefined
            }
            AnchorChanges {
                target: contentContainer
                anchors.left: parent.left
                anchors.top: root.overlayActionBar ? parent.top : windowControls.bottom
                anchors.right: parent.right
                anchors.bottom: root.overlayActionBar ? parent.bottom : actionBarLoader.top
            }
            AnchorChanges {
                target: titleBar
                anchors.left: Contemporary.windowControlSide === Qt.RightEdge ? parent.left : windowControls.right
                anchors.top: parent.top
                anchors.right: Contemporary.windowControlSide === Qt.RightEdge ? windowControls.left : parent.right
                anchors.bottom: windowControls.bottom

            }
            AnchorChanges {
                target: actionBarLoader
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
            }
            PropertyChanges {
                target: titleBar
                visible: true
            }
            PropertyChanges {
                target: safeZones
                top: Math.max(windowControls.height, titleBar.height)
                bottom: actionBarLoader.height
            }
        },
        State {
            name: "desktop"
            when: root.width >= 640
            AnchorChanges {
                target: windowControls
                anchors.left: Contemporary.windowControlSide === Qt.RightEdge ? undefined : parent.left
                anchors.top: parent.top
                anchors.right: Contemporary.windowControlSide === Qt.RightEdge ? parent.right : undefined
            }
            AnchorChanges {
                target: actionBarLoader
                anchors.left: Contemporary.windowControlSide === Qt.RightEdge ? parent.left : windowControls.right
                anchors.top: parent.top
                anchors.right: Contemporary.windowControlSide === Qt.RightEdge ? windowControls.left : parent.right
                anchors.bottom: windowControls.bottom
            }
            AnchorChanges {
                target: contentContainer
                anchors.left: parent.left
                anchors.top: root.overlayActionBar ? parent.top : windowControls.bottom
                anchors.right: parent.right
                anchors.bottom: parent.bottom
            }
            PropertyChanges {
                target: titleBar
                visible: false
            }
            PropertyChanges {
                target: safeZones
                top: Math.max(windowControls.height, actionBarLoader.height)
                bottom: 0
            }
        }
    ]
}