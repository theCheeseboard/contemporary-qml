import QtQuick
import QtQuick.Controls
import com.vicr123.Contemporary.impl

StackView {
    id: root

    enum Animation {
        Fade,
        SlideHorizontal,
        Lift
    }

    property int currentAnimation: ContemporaryStackView.Animation.Fade

    TransitionFade {
        id: animFade
    }

    TransitionSlide {
        id: animSlide
    }

    TransitionLift {
        id: animLift
    }

    Component.onCompleted: root.updateAnimation()

    onCurrentAnimationChanged: root.updateAnimation()

    function updateAnimation() {
        switch (root.currentAnimation) {
            case Pager.Animation.Fade:
                animFade.install(root);
                break;
            case Pager.Animation.SlideHorizontal:
                animSlide.install(root);
                break;
            case Pager.Animation.Lift:
                animLift.install(root);
                break;
        }
    }
}
