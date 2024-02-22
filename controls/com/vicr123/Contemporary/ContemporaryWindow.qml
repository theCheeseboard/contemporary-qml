import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

ApplicationWindow {
    id: window

    flags: Qt.Window | Qt.FramelessWindowHint

    default property alias contents: contentContainer.data
    property alias actionBar: actionBarLoader.sourceComponent

    minimumWidth: 640
    minimumHeight: 480

    color: "transparent"

    MouseArea {
        id: outsideMouseArea
        anchors.fill: parent

        hoverEnabled: true

        // Prevent bubbling of mouse events
        MouseArea {
            id: insideMouseArea
            anchors.fill: parent
            anchors.margins: 5

            Rectangle {
                id: rootRect
                color: "black"
                anchors.fill: parent
                radius: 5

                ColumnLayout {
                    anchors.fill: parent

                    RowLayout {
                        Layout.fillHeight: false

                        Loader {
                            id: actionBarLoader
                            height: childrenRect.height
                            Layout.fillWidth: true
                        }
                    }

                    RowLayout {
                        id: contentContainer
                    }
                }
            }
        }

        MultiEffect {
            source: rootRect
            anchors.fill: insideMouseArea
            shadowBlur: 1.0
            shadowEnabled: true
            shadowColor: "#808080"
            shadowVerticalOffset: 0
            shadowHorizontalOffset: 0
            shadowScale: 1
        }

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
