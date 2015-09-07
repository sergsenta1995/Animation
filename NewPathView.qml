import QtQuick 2.0

Item{  
    property double t1 : 0;
    property double t2 : 1;
    property double deltha: 1;
    property double typeSpeed : 1;

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
            //////////////////////////

            function sinSpeed()
            {
                t1 = t2;
                t2++;
                deltha = 1 + (Math.sin(t2) - Math.sin(t1))*10;
            }

            function linearSpeed(k)
            {
                deltha = k;
            }

            function quadSpeed()
            {
                t1 = t2;
                t2++;
                deltha = t2*t2 - t1*t1;
            }

            function cubicSpeed()
            {
                t1 = t2;
                t2++;
                deltha = t2*t2*t2 - t1*t1*t1;
            }

            function limit()
            {
                if (x>250)
                    t = 0;
            }

            Timer
            {
                interval: 10;
                repeat: true;
                running: true;
                onTriggered: {
                    switch(typeSpeed)
                    {
                    case 1: linearSpeed(1); break;
                    case 2: quadSpeed();   break;
                    case 3: cubicSpeed();  break;
                    case 4: sinSpeed();    break;
                    default: linearSpeed();
                    }

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

