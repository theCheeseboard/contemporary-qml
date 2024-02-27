import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Contemporary

T.ScrollBar {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding)

    visible: control.policy !== T.ScrollBar.AlwaysOff
    minimumSize: orientation === Qt.Horizontal ? height / width : width / height

    hoverEnabled: true

    contentItem: Item {
        id: gutter
        implicitWidth: control.interactive ? 6 : 3
        implicitHeight: control.interactive ? 6 : 3

        Rectangle {
            id: thumb
            width: 3
            height: 3

            anchors.right: gutter.right
            anchors.top: orientation === Qt.Vertical ? gutter.top : null
            anchors.bottom: gutter.bottom
            anchors.left: orientation === Qt.Horizontal ? gutter.left : null

            color: control.pressed ? Contemporary.pressed(Contemporary.accent) : Contemporary.accent
            opacity: 0.1

            states: State {
                name: "active"
                when: control.policy === T.ScrollBar.AlwaysOn || (control.active && control.size < 1.0) || (control.hovered && control.interactive)
                PropertyChanges {
                    thumb.opacity: 1
                    thumb.width: 6
                    thumb.height: 6
                }
            }

            transitions: Transition {
                from: "active"
                SequentialAnimation {
                    PauseAnimation {
                        duration: 450
                    }
                    ParallelAnimation {
                        NumberAnimation {
                            target: thumb
                            duration: 200
                            property: "opacity"
                            to: 0.0
                        }
                        NumberAnimation {
                            target: thumb
                            duration: 200
                            property: "width"
                            to: 3
                        }
                        NumberAnimation {
                            target: thumb
                            duration: 200
                            property: "height"
                            to: 3
                        }
                    }
                }
            }
        }
    }
}
