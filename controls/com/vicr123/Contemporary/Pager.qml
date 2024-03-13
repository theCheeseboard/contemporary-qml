import QtQuick
import QtQuick.Controls

ContemporaryStackView {
    id: root

    default property list<Item> pages
    property int currentIndex
    property var defaultItem: Item { }

    initialItem: defaultItem
    currentAnimation: ContemporaryStackView.Animation.SlideHorizontal

    QtObject {
        id: d

        property bool animBackward: false
        property int oldIndex
    }

    onCurrentIndexChanged: {
        d.animBackward = root.currentIndex >= d.oldIndex;
        d.oldIndex = root.currentIndex
        replacePage()
    }

    Component.onCompleted: replacePage()

    onPagesChanged: () => {
        if (root.currentItem === defaultItem) replacePage()
    }

    function replacePage() {
        root.replace(null, pages[currentIndex] ?? defaultItem, {}, d.animBackward ? StackView.PopTransition : StackView.PushTransition);
    }
}
