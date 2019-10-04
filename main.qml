import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0

Window {
    id: mainWin
    visible: true
    width: 600
    height: 600
    title: qsTr("Hello World")

    Button{
        text: qsTr("模态窗口1")
        onClicked: {
            childWin.show()
        }
    }

    Button{
        text: qsTr("模态窗口2")
        anchors.centerIn: parent
        onClicked: {
            modalWin.visible = true
        }
    }

    ModalWindowTemplate{
        id:modalWin
        visible: false
        Rectangle{
            id: content
            color: "#FF6677"
            visible: modalWin.visible
            anchors.centerIn: modalWin.contaners
            width: 300
            height: 50
            clip: true
            radius: 3



            TextEdit {
                visible:  modalWin.contaners.visible
                text: qsTr("hello world111")
                focus: true
                width: 100
                height: 30
            }
            //设置focus,但并没有响应按键事件
            focus: true
            Keys.enabled: true

            Keys.onPressed: {
              console.log("key press")
            }
        }
//注释这段代码，弹出讲无法响应按键
//        onVisibleChanged: {
//            if(visible)
//            {
//                content.focus = true
//            }
//        }
    }

    WindowTemplate{
        id: childWin
        visible: false
        parent:mainWin

        Rectangle{
            color: "#FF6677"
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            width: parent.width
            height: parent.height - 30
            clip: true
            radius: 3

            TextEdit {
                text: qsTr("hello world")
//                focus: true
                width: 100
                height: 30
                anchors.centerIn: parent
            }
            //设置focus,就可响应按键事件
            focus: true
            Keys.enabled: true
          Keys.onPressed: {
              console.log("key press")
          }
        }

    }


    Component.onCompleted: {
//        mainWin.showMaximized()
    }
}
