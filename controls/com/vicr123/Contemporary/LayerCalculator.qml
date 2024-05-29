import QtQuick
import com.vicr123.Contemporary.impl as Impl
import Contemporary

QtObject {
    id: root

    property int layer: 1
    property color backgroundColor: Contemporary.background

    readonly property Impl.LayerCalculator calculator: Impl.LayerCalculator {
        layer: root.layer
        baseColor: root.backgroundColor
        layerColor: Contemporary.layer
    }

    readonly property var color: calculator.color
}
