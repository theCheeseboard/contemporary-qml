import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import com.vicr123.Contemporary

Control {
    id: rectangle
    Layout.fillHeight: true
    Layout.fillWidth: true

    RowLayout {
        anchors.top: parent.top
        anchors.topMargin: SafeZone.top
        anchors.bottomMargin: SafeZone.bottom

        Tumbler {
            model: 100
        }

        Tumbler {
            enabled: false
            model: 100
        }
    }
}
