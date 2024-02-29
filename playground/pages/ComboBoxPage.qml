import QtQuick 2.15
import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import com.vicr123.Contemporary

Control {
    id: rectangle
    Layout.fillHeight: true
    Layout.fillWidth: true

    ColumnLayout {
        anchors.top: parent.top
        anchors.topMargin: SafeZone.top
        anchors.bottomMargin: SafeZone.bottom

        ComboBox {
            model: 100
        }

        ComboBox {
            enabled: false
            model: 100
        }
    }
}
