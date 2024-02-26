import QtQuick
import QtQuick.Shapes
import QtQuick.Templates as T
import Contemporary

T.BusyIndicator {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    contentItem: Shape {
        id: indicator
        implicitWidth: 32
        implicitHeight: 32
        asynchronous: true
        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            // running: control.running
            // opacity: control.running ? 1 : 0
            strokeColor: Contemporary.foreground
            // strokeWidth: Math.min(indicator.width, indicator.height)
            strokeWidth: 4
            capStyle: ShapePath.RoundCap
            fillColor: "transparent"

            PathAngleArc {
                id: arc
                centerX: indicator.width / 2
                centerY: indicator.height / 2
                radiusX: Math.min(indicator.width, indicator.height) / 2
                radiusY: Math.min(indicator.width, indicator.height) / 2
                startAngle: 0
                sweepAngle: 30
            }
        }

        SequentialAnimation {
            loops: Animation.Infinite
            running: true
            NumberAnimation {
                target: arc
                property: "sweepAngle"
                from: 15
                to: 310
                duration: 500
                easing.type: Easing.InOutCubic
            }
            ScriptAction {
                script: arc.startAngle += 310;
            }
            NumberAnimation {
                target: arc
                property: "sweepAngle"
                from: -310
                to: -15
                duration: 500
                easing.type: Easing.InOutCubic
            }
            ScriptAction {
                script: arc.startAngle -= 15;
            }
        }

        RotationAnimation on rotation {
            loops: Animation.Infinite
            running: true
            from: 0
            to: 360
            duration: 2000
        }
    }
}
