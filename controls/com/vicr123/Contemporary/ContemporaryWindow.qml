import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects
import Contemporary
import com.vicr123.Contemporary.impl

ApplicationWindow {
    id: window

    flags: Qt.Window | Qt.FramelessWindowHint | Qt.MaximizeUsingFullScreenGeometryHint

    default property alias contents: contentContainer.data
    property alias actionBar: actionBarLoader.sourceComponent
    property bool overlayActionBar: false

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

                Loader {
                    id: actionBarLoader
                    Layout.preferredHeight: childrenRect.height
                    Layout.fillWidth: true

                    z: 100
                }

                WindowControls {
                    id: windowControls
                    control: window
                    z: 100
                }

                RowLayout {
                    id: contentContainer
                }

                MouseArea {
                    id: titleBar

                    Label {
                        anchors.fill: parent
                        text: window.title
                        horizontalAlignment: Qt.AlignLeft
                        verticalAlignment: Qt.AlignVCenter
                    }

                    onPressed: window.startSystemMove();
                }

                states: [
                    State {
                        name: "mobile"
                        when: window.width < 640
                        AnchorChanges {
                            target: windowControls
                            anchors.left: Contemporary.windowControlSide === Qt.RightEdge ? undefined : rootRect.left
                            anchors.top: rootRect.top
                            anchors.right: Contemporary.windowControlSide === Qt.RightEdge ? rootRect.right : undefined
                        }
                        AnchorChanges {
                            target: contentContainer
                            anchors.left: rootRect.left
                            anchors.top: window.overlayActionBar ? rootRect.top : windowControls.bottom
                            anchors.right: rootRect.right
                            anchors.bottom: window.overlayActionBar ? rootRect.bottom : actionBarLoader.top
                        }
                        AnchorChanges {
                            target: titleBar
                            anchors.left: Contemporary.windowControlSide === Qt.RightEdge ? rootRect.left : windowControls.right
                            anchors.top: rootRect.top
                            anchors.right: Contemporary.windowControlSide === Qt.RightEdge ? windowControls.left : rootRect.right
                            anchors.bottom: windowControls.bottom

                        }
                        AnchorChanges {
                            target: actionBarLoader
                            anchors.left: rootRect.left
                            anchors.right: rootRect.right
                            anchors.bottom: rootRect.bottom
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
                        when: window.width >= 640
                        AnchorChanges {
                            target: windowControls
                            anchors.left: Contemporary.windowControlSide === Qt.RightEdge ? undefined : rootRect.left
                            anchors.top: rootRect.top
                            anchors.right: Contemporary.windowControlSide === Qt.RightEdge ? rootRect.right : undefined
                        }
                        AnchorChanges {
                            target: actionBarLoader
                            anchors.left: Contemporary.windowControlSide === Qt.RightEdge ? rootRect.left : windowControls.right
                            anchors.top: rootRect.top
                            anchors.right: Contemporary.windowControlSide === Qt.RightEdge ? windowControls.left : rootRect.right
                            anchors.bottom: windowControls.bottom
                        }
                        AnchorChanges {
                            target: contentContainer
                            anchors.left: rootRect.left
                            anchors.top: window.overlayActionBar ? rootRect.top : windowControls.bottom
                            anchors.right: rootRect.right
                            anchors.bottom: rootRect.bottom
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
        }

        MultiEffect {
            source: rootRect
            anchors.fill: insideMouseArea
            shadowBlur: 1.0
            shadowEnabled: window.visibility !== Window.Maximized && window.visibility !== Window.FullScreen
            shadowColor: "#000000"
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
