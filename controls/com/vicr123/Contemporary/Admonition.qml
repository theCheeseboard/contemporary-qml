import QtQuick
import QtQuick.Controls
import Contemporary

GroupBox {
    id: root

    enum Severity {
        Info,
        Warning,
        Error
    }

    property string text
    property int severity: Admonition.Severity.Info

    background: Rectangle {
        width: parent.width
        height: parent.height
        radius: 4

        color: ({
                [Admonition.Severity.Info]: Qt.rgba(0, 200, 255, 0.1),
                [Admonition.Severity.Warning]: Qt.rgba(255, 200, 0, 0.1),
                [Admonition.Severity.Error]: Qt.rgba(200, 0, 0, 0.1)
            })[root.severity]

        Rectangle {
            anchors.fill: parent
            radius: 4
            color: "transparent"
            border.color: Contemporary.translucentBorder
        }
    }

    Label {
        anchors.left: parent.left
        anchors.right: parent.right
        text: root.text
        wrapMode: Text.WordWrap
    }
}
