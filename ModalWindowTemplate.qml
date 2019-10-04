import QtQuick 2.0

Rectangle{
    id:rootModalWin
    anchors.fill: parent
    width: parent.width
    height: parent.height + 10
    property alias contaners: rootWin
    property int winWidth: 500
    property int winHeight: 400
    property string titleText: qsTr("hello world")
    color: "transparent"
    focus: true
    Keys.enabled: true
     z: 1000
     MouseArea{
         anchors.fill: parent
         hoverEnabled: false
     }

    Rectangle {
        id: rootWin
        width: winWidth
        height: winHeight
        x: parent.width/2 - rootWin.width/2 + parent.x
        y: parent.height/2 - rootWin.height/2 + parent.y

        Rectangle{
            anchors.fill: parent
            radius: 3
            color: "#87C056"
        }

        Rectangle{
            id:titleArea
            color: "#335577"
            anchors.left: parent.left
            anchors.top: parent.top
            width: parent.width
            height: 30
            radius: 3
            z:100
            Text {
                text: titleText
                anchors.horizontalCenter: parent.horizontalCenter
                height: parent.height
                font.pixelSize: 14
                verticalAlignment: Text.AlignVCenter
                color: "#FFFFFF"
            }

            Image {
                id:closeBtn
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/image/icon_close.png"
                z:200
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        rootModalWin.visible = false
                    }
                }
            }

            MouseArea{
                anchors.fill: parent
                property point clickPoint: "0,0"
                acceptedButtons: Qt.LeftButton
                onPressed: {

                    clickPoint  = Qt.point(mouse.x, mouse.y)
                }
                onPositionChanged: {
                    var offset = Qt.point(mouse.x - clickPoint.x, mouse.y - clickPoint.y)
                    setDlgPoint(offset.x, offset.y)
                }

            }

        }

    }
    function setDlgPoint(dlgX,dlgY){
        //设置窗口拖拽不能超过父窗口
        if(rootWin.x + dlgX < rootWin.parent.x)
        {
            rootWin.x = rootWin.parent.x
        }
        else if(rootWin.x + dlgX > rootWin.parent.width - rootWin.width + rootWin.parent.x)
        {
            rootWin.x = (rootWin.parent.width - rootWin.width) + rootWin.parent.x
        }
        else
        {
            rootWin.x = rootWin.x + dlgX
        }

        if(rootWin.y + dlgY < rootWin.parent.y)
        {
            rootWin.y = rootWin.parent.y
        }
        else if(rootWin.y + dlgY > rootWin.parent.height - rootWin.height + rootWin.parent.y)
        {
            rootWin.y = (rootWin.parent.height - rootWin.height) + rootWin.parent.y
        }
        else
        {
            rootWin.y = rootWin.y + dlgY
        }
    }

}

