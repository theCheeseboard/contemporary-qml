import QtQuick 2.15
import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import com.vicr123.Contemporary
import Contemporary

Control {
    id: rectangle

    LayerCalculator {
        id: layer2
        layer: 2
    }

    Grandstand {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        id: grandstand

        innerTopMargin: SafeZone.top

        z: 10
        text: "Combo Box";
        color: layer2.color
    }

    ColumnLayout {
        anchors.top: grandstand.bottom
        anchors.bottomMargin: SafeZone.bottom
        anchors.topMargin: 6

        ComboBox {
            model: 100
        }

        ComboBox {
            enabled: false
            model: 100
        }
    }
}
