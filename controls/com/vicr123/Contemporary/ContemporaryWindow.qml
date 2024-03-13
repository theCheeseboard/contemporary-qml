import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
// import QtQuick.Effects
import Contemporary
import com.vicr123.Contemporary.impl

ApplicationWindow {
    id: window

    flags: Qt.Window | Qt.FramelessWindowHint | Qt.MaximizeUsingFullScreenGeometryHint

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

    MouseArea {
        id: outsideMouseArea
        anchors.fill: parent

        hoverEnabled: true

        // Prevent bubbling of mouse events
        MouseArea {
            id: insideMouseArea
            anchors.fill: parent
            anchors.margins: (window.visibility === Window.Maximized && window.visibility !== Window.FullScreen) ? 0 : 5

            Rectangle {
                id: rootRect
                color: Contemporary.background
                anchors.fill: parent
                radius: (window.visibility === Window.Maximized && window.visibility !== Window.FullScreen) ? 0 : 5

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

        // MultiEffect {
        //     source: rootRect
        //     anchors.fill: insideMouseArea
        //     shadowBlur: 1.0
        //     shadowEnabled: window.visibility !== Window.Maximized && window.visibility !== Window.FullScreen
        //     shadowColor: "#000000"
        //     shadowVerticalOffset: 0
        //     shadowHorizontalOffset: 0
        //     shadowScale: 1
        // }

        function edges(event) {
            const edgeSize = 10;
            const windowWidth = window.width;
            const windowHeight = window.height;
            const mouseX = event.x;
            const mouseY = event.y;
            let edges = 0;

            if(mouseX <= edgeSize) {
                edges = edges + Qt.LeftEdge;
            }
            if (mouseX >= windowWidth - edgeSize) {
                edges = edges + Qt.RightEdge
            }
            if (mouseY <= edgeSize) {
                edges = edges + Qt.TopEdge
            }
            if (mouseY >= windowHeight - edgeSize) {
                edges = edges + Qt.BottomEdge
            }

            return edges;
        }

        onPressed: event => window.startSystemResize(edges(event))
        onPositionChanged: event => {
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
            }
        }
    }
}
