import QtQuick 2.0

Item{  
    property double slower    : 90;
    property double t         : 0;
    property double deltha    : 1;
    property int    typeSpeed : 1;

    property double amplituda : 5;

    Component
    {
         id: delegate

         Rectangle
         {
            id: rect;
            width: 20
            height: 20
            color: "orchid"
            border {
                color: "black"
                width: 1
            }           

            ///////////////////////////
            // функции скоростей
            ///////////////////////////

            function sinSpeed()
            {                
                t += 1 / slower;
                deltha = (Math.sin(t)) * amplituda;
            }

            function linearSpeed(k)
            {
                deltha = k;
            }

            function quadSpeed()
            {
                t += 1 / slower;
                deltha = (t*t) * amplituda;
            }

            function cubicSpeed()
            {
                t += 1 / slower;
                deltha = (t*t*t) * amplituda;
            }

            function back(s)
            {
                t += 1 / slower;;
                deltha = ( (s+1)*t*t*t - s*t*t ) * amplituda;
            }

            function limit(lim)
            {
                if (x>lim)
                    deltha = 0;
            }

            Timer
            {
                interval: slower;
                repeat: true;
                running: true;                               

                onTriggered: {
                    switch(typeSpeed)
                    {
                        case 1:  linearSpeed(1); break;
                        case 2:  quadSpeed();    break;
                        case 3:  cubicSpeed();   break;
                        case 4:  sinSpeed();     break;
                        case 5:  back(5);        break;
                        default: linearSpeed();
                    }

                    limit(550);
                    x += deltha;
                }
            }            
         }
    }
    PathView
    {        
        id: myPath;
        anchors.fill: parent
        model: ListModelForPathView{}
        delegate: delegate;

        path: Path {
            startX: 120; startY: 100
             PathQuad { x: 120; y: 25; controlX: 260; controlY: 75 }
             PathQuad { x: 120; y: 100; controlX: -20; controlY: 75 }
        }        
    }    

    visible: true;
}

