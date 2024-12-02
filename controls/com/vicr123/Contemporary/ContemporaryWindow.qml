import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
// import QtQuick.Effects
import Contemporary
import com.vicr123.Contemporary.impl

ApplicationWindow {
    id: window

    // flags: Qt.Window | Qt.FramelessWindowHint | Qt.MaximizeUsingFullScreenGeometryHint
    default property alias contents: contentContainer.data

    minimumWidth: 200
    minimumHeight: 480

    color: "transparent"

    LayoutMirroring.enabled: Qt.application.layoutDirection === Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    palette: Palette {
        window: Contemporary.background
        windowText: Contemporary.foreground
    }

    ContemporaryWindowPlatform {
        id: windowPlatform
    }

    onVisibleChanged: () => {
        if (window.visible) {
            windowPlatform.window = window;
        } else {
            windowPlatform.window = null;
        }
    }

    // Prevent bubbling of mouse events
    MouseArea {
        id: insideMouseArea
        anchors.fill: parent
        anchors.margins: windowPlatform.windowMargins

        Rectangle {
            id: rootRect
            color: Contemporary.background
            anchors.fill: parent
            radius: windowPlatform.windowMargins

            clip: true

            QtObject {
                id: safeZones
                property real top: 0
                property real bottom: 0
            }

            SafeZone.top: safeZones.top
            SafeZone.bottom: safeZones.bottom

            Item {
                id: contentContainer
                anchors.fill: parent
            }
        }
    }

    component SizeGrip: MouseArea {
        id: outsideMouseArea

        hoverEnabled: true
        visible: window.visibility != Window.Maximized && window.visibility != Window.FullScreen

        function edges(event) {
            const edgeSize = 10;
            const windowWidth = window.width;
            const windowHeight = window.height;
            const mouseX = event.x + outsideMouseArea.x;
            const mouseY = event.y + outsideMouseArea.y;
            let edges = 0;

            if (mouseX <= edgeSize) {
                edges = edges + Qt.LeftEdge;
            }
            if (mouseX >= windowWidth - edgeSize) {
                edges = edges + Qt.RightEdge;
            }
            if (mouseY <= edgeSize) {
                edges = edges + Qt.TopEdge;
            }
            if (mouseY >= windowHeight - edgeSize) {
                edges = edges + Qt.BottomEdge;
            }

            return edges;
        }

        onPressed: event => {
            if (window.visibility == Window.Maximized || window.visibility == Window.FullScreen) {
                event.accepted = false;
                return;
            }

            const edge = edges(event);
            if (edge) {
                window.startSystemResize(edge);
                event.accepted = true;
            } else {
                event.accepted = false;
            }
        }
        onPositionChanged: event => {
            event.accepted = false;
            if (window.visibility == Window.Maximized || window.visibility == Window.FullScreen) {
                outsideMouseArea.cursorShape = Qt.ArrowCursor;
                return;
            }

            switch (edges(event)) {
            case Qt.LeftEdge:
            case Qt.RightEdge:
                outsideMouseArea.cursorShape = Qt.SizeHorCursor;
                break;
            case Qt.TopEdge:
            case Qt.BottomEdge:
                outsideMouseArea.cursorShape = Qt.SizeVerCursor;
                break;
            case Qt.TopEdge + Qt.LeftEdge:
            case Qt.BottomEdge + Qt.RightEdge:
                outsideMouseArea.cursorShape = Qt.SizeFDiagCursor;
                break;
            case Qt.TopEdge + Qt.RightEdge:
            case Qt.BottomEdge + Qt.LeftEdge:
                outsideMouseArea.cursorShape = Qt.SizeBDiagCursor;
                break;
            default:
                outsideMouseArea.cursorShape = Qt.ArrowCursor;
                break;
            }
        }
    }

    Item {
        anchors.fill: parent

        SizeGrip {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            width: 10
        }
        SizeGrip {
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            width: 10
        }
        SizeGrip {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: 10
        }
        SizeGrip {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: 10
        }
    }
}
