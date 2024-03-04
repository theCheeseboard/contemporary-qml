import QtQuick
import QtQuick.Controls

Item {
    id: root
    property string text
    property font font
    property alias verticalAlignment: label.verticalAlignment
    property alias color: label.color

    implicitWidth: label.implicitWidth
    implicitHeight: label.implicitHeight

    Label {
        id: label
        anchors.fill: parent

        text: root.text.toLocaleUpperCase()
        elide: Text.ElideRight
    }

    onFontChanged: () => {
        const font = root.font;
        font.bold = true;
        label.font = font;
    }
}
