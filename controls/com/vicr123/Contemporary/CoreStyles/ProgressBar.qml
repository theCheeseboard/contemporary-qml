import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.Basic.impl
import Contemporary

T.ProgressBar {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, implicitContentHeight + topPadding + bottomPadding)

    contentItem: Item {
        implicitHeight: 24
        implicitWidth: 200

        Rectangle {
            width: control.visualPosition * parent.width
            height: parent.height
            radius: 4
            visible: !control.indeterminate
            color: Contemporary.accent
        }

        Item {
            anchors.fill: parent
            visible: control.indeterminate
            clip: true

            Rectangle {
                id: indeterminateForeground
                height: parent.height
                x: 0
                width: 0
                color: Contemporary.accent
                radius: 4
            }

            Rectangle {
                id: indeterminateForeground1
                height: parent.height
                x: 0
                width: 0
                color: Contemporary.accent
                radius: 4
            }

            SequentialAnimation {
                running: true
                loops: Animation.Infinite

                // Part 1
                PropertyAction {
                    target: indeterminateForeground1
                    property: "visible"
                    value: false
                }
                ParallelAnimation {
                    NumberAnimation {
                        target: indeterminateForeground
                        property: "x"
                        from: 0
                        to: parent.width
                        duration: 1000
                    }
                    NumberAnimation {
                        target: indeterminateForeground
                        property: "width"
                        from: 0
                        to: parent.width
                        duration: 1000
                    }
                }
                PropertyAction {
                    target: indeterminateForeground
                    property: "x"
                    value: 0
                }
                NumberAnimation {
                    target: indeterminateForeground
                    property: "width"
                    from: 0
                    to: parent.width
                    duration: 1000
                }

                // Part 2
                PropertyAction {
                    target: indeterminateForeground1
                    property: "visible"
                    value: true
                }
                PropertyAction {
                    target: indeterminateForeground1
                    property: "x"
                    value: 0
                }
                ParallelAnimation {
                    NumberAnimation {
                        target: indeterminateForeground
                        property: "x"
                        from: 0
                        to: parent.width
                        duration: 500
                    }
                    NumberAnimation {
                        target: indeterminateForeground1
                        property: "width"
                        from: 0
                        to: parent.width
                        duration: 1000
                    }
                }
                NumberAnimation {
                    target: indeterminateForeground1
                    property: "x"
                    from: 0
                    to: parent.width
                    duration: 1000
                }
            }
        }
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 24
        y: (control.height - height) / 2
        height: 24
        radius: 4

        color: Contemporary.layer
    }
}
