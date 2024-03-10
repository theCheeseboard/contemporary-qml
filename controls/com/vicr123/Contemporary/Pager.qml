import QtQuick
import QtQuick.Controls

StackView {
    id: root

    enum Animation {
        Fade,
        SlideHorizontal,
        Lift
    }

    default property list<Item> pages
    property int currentIndex
    property int currentAnimation: Pager.Animation.Fade
    property var defaultItem: Item { }

    QtObject {
        id: d

        property bool animBackward
        property int oldIndex
    }

    initialItem: defaultItem

    Transition {
        id: animFadeEnter
        NumberAnimation {
            property: "opacity"
            from: 0
            to: 1
            duration: 150
            easing.type: Easing.OutCubic
        }
    }

    Transition {
        id: animFadeExit
        NumberAnimation {
            property: "opacity"
            from: 1
            to: 0
            duration: 150
            easing.type: Easing.OutCubic
        }
    }

    Transition {
        id: animSlideHEnter
        ParallelAnimation {
            NumberAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 150
                easing.type: Easing.OutCubic
            }
            XAnimator {
                from: d.animBackward ^ Qt.application.layoutDirection === Qt.RightToLeft ? 50 : -50
                to: 0
                duration: 150
                easing.type: Easing.OutCubic
            }
        }
    }

    Transition {
        id: animSlideHExit
        ParallelAnimation {
            NumberAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 150
                easing.type: Easing.OutCubic
            }
            XAnimator {
                from: 0
                to: d.animBackward ^ Qt.application.layoutDirection === Qt.RightToLeft ? -50 : 50
                duration: 150
                easing.type: Easing.OutCubic
            }
        }
    }

    Transition {
        id: animLiftEnter
        ParallelAnimation {
            NumberAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 150
                easing.type: Easing.OutCubic
            }
            YAnimator {
                from: 50
                to: 0
                duration: 150
                easing.type: Easing.OutCubic
            }
        }
    }

    Transition {
        id: animLiftExit
        ParallelAnimation {
            NumberAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 150
                easing.type: Easing.OutCubic
            }
        }
    }

    replaceEnter: animFadeEnter;
    replaceExit: animFadeExit;

    onCurrentIndexChanged: {
        d.animBackward = root.currentIndex >= d.oldIndex;
        d.oldIndex = root.currentIndex
        replacePage()
    }

    onCurrentAnimationChanged: () => {
        switch (root.currentAnimation) {
            case Pager.Animation.Fade:
                root.replaceEnter = animFadeEnter;
                root.replaceExit = animFadeExit;
                break;
            case Pager.Animation.SlideHorizontal:
                root.replaceEnter = animSlideHEnter;
                root.replaceExit = animSlideHExit;
                break;
            case Pager.Animation.Lift:
                root.replaceEnter = animLiftEnter;
                root.replaceExit = animLiftExit;
                break;
        }
    }

    Component.onCompleted: replacePage()

    onPagesChanged: () => {
        if (root.currentItem === defaultItem) replacePage()
    }

    function replacePage() {
        root.replace(null, pages[currentIndex] ?? defaultItem);
    }
}
