import QtQuick
import QtQuick.Controls

ContemporaryStackView {
    id: root

    default property list<Item> pages
    property int currentIndex
    property var defaultItem: Item {}

    initialItem: defaultItem
    currentAnimation: ContemporaryStackView.Animation.SlideHorizontal

    QtObject {
        id: d

        property bool animBackward: false
        property int oldIndex
    }

    onCurrentIndexChanged: {
        d.animBackward = root.currentIndex >= d.oldIndex;
        d.oldIndex = root.currentIndex;
        replacePage();
    }

    Component.onCompleted: replacePage()

    onPagesChanged: () => {
        if (root.currentItem === defaultItem)
            replacePage();
    }

    function replacePage() {
        const newPage = pages[currentIndex] ?? defaultItem;
        if (root.currentItem === newPage)
            return;
        root.replace(null, newPage, {}, d.animBackward ? StackView.PopTransition : StackView.PushTransition);
    }

    function push(page) {
        pages.push(page);
        replacePage();
    }

    function remove(page) {
        pages = Array.from(pages).filter(p => p !== page);
        if (pages.length <= currentIndex && pages.length !== 0) {
            currentIndex = pages.length - 1;
            return;
        }
        replacePage();
    }
}
