import QtQuick 2.0
import QtQuick.Window 2.2

Window {
    width: 1000;
    height: 1000;

    property int linearAnimationSpeed : 1;
    property int quadAnimationSpeed   : 2;
    property int cubicAnimationSpeed  : 3;
    property int sinAnimationSpeed    : 4;
    property int backAnimationSpeed   : 5;

    NewPathView
    {
        parent: typeSpeed = backAnimationSpeed;
    }   

    visible:true;
}

