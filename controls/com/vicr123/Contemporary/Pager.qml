import QtQuick
import QtQuick.Controls

StackView {
    id: root

    enum Animation {
        Fade,
        SlideHorizontal
    }

    default property list<Item> pages
    property int currentIndex
    property int currentAnimation: Pager.Animation.Fade
    property var defaultItem: Item { }

    initialItem: defaultItem

    Transition {
        id: animFadeEnter
        NumberAnimation {
            property: "opacity"
            from: 0
            to: 1
            duration: 150
        }
    }

    Transition {
        id: animFadeExit
        NumberAnimation {
            property: "opacity"
            from: 1
            to: 0
            duration: 150
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
            }
            XAnimator {
                from: 50
                to: 0
                duration: 150
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
            }
            XAnimator {
                from: 0
                to: -50
                duration: 150
            }
        }
    }

    replaceEnter: animFadeEnter;
    replaceExit: animFadeExit;
    pushEnter: animFadeEnter;
    pushExit: animFadeExit;

    onCurrentIndexChanged: () => {
        root.replace(null, pages[currentIndex] ?? defaultItem);
    }

    onCurrentAnimationChanged: () => {
        switch (root.currentAnimation) {
            case Pager.Animation.Fade:
                root.replaceEnter = animFadeEnter;
                root.replaceExit = animFadeExit;
                root.pushEnter = animFadeEnter;
                root.pushExit = animFadeExit;
                break;
            case Pager.Animation.SlideHorizontal:
                root.replaceEnter = animSlideHEnter;
                root.replaceExit = animSlideHExit;
                root.pushEnter = animSlideHEnter;
                root.pushExit = animSlideHExit;
                break;
        }
    }

    Component.onCompleted: root.currentIndex = 0
}
