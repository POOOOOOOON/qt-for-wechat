import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Window{
    id: login
    width: 280
    height: 400
    visible: true
    flags: Qt.Window | Qt.FramelessWindowHint | Qt.WindowMinMaxButtonsHint
    color: "#f9f9f9"

    property var displayTextColor: "#0050a0"
    property var displayText : "切换账号"
    property var dynamicText : ['正在登录','正在登录.','正在登录..','正在登录...']
    property var i: 0
    property var j: 0

    Rectangle{
        width: parent.width
        height: 25
        color: "transparent"

        Label{
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            text: "微信"
            font.family: "FangSong"
            font.pointSize: 10
            color: "gray"
        }

        Button{
            id: loginSettingButton
            anchors.right: parent.right
            anchors.rightMargin: 35
            width: 35
            height: parent.height
            icon.source:"qrc:/images/setting.png"
            background: Rectangle{
                color: parent.hovered ? "#dbdbdb":"transparent"
            }
        }

        Button{
            id: loginCloseButton
            anchors.right: parent.right
            width: 35
            height: parent.height
            icon.source:"qrc:/images/close.png"
            background: Rectangle{
                color: parent.hovered ? "#ff4c4c":"transparent"
            }

            ToolTip{
                visible: parent.hovered
                delay: 500
                text: qsTr("关闭")
                background: Rectangle{
                    border.color: "#7f7f7f"
                    radius: 3
                }
            }
        }

        MouseArea{
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton
            property point clickPos: "0,0"
            cursorShape: (loginSettingButton.hovered || loginCloseButton.hovered) ? Qt.PointingHandCursor:Qt.ArrowCursor
            onPressed: { //接收鼠标按下事件
                clickPos  = Qt.point(mouse.x,mouse.y)
            }
            onPositionChanged: { //鼠标按下后改变位置
                //鼠标偏移量
                var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)

                //如果mainwindow继承自QWidget,用setPos
                login.setX(login.x+delta.x)
                login.setY(login.y+delta.y)
            }
            onClicked: {
                if(mouseX >= loginCloseButton.x){
                    Qt.quit()
                }
            }
        }
    }

    Component{
        id: mainView

        Rectangle{
            color: "transparent"
            Button{
                id: loginHeadButton
                width: 90
                height: 90
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 70
                background: Rectangle{
                    anchors.fill: parent
                    color: "transparent"
                    Image {
                        anchors.fill: parent
                        mipmap:true
                        source: "qrc:/images/head.jpg"
                    }
                }

                MouseArea{
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton
                    cursorShape: Qt.PointingHandCursor
                }
            }

            Label{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 180
                text: "POON"
                font.family: "FangSong"
                font.pointSize: 13
                color: "gray"
            }

            Button{
                id: loginAfterButton
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 240
                visible: false
                Text {
                    anchors.centerIn: parent
                    text: "请在手机上确认登录"
                    font.family: "NSimSun"
                    font.pointSize: 10
                    color: "gray"
                }
                background: Rectangle{
                    anchors.fill: parent
                    color: "transparent"
                }
            }

            Button{
                id: loginButton
                width: 200
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 220
                Text {
                    anchors.centerIn: parent
                    text: "登录"
                    font.family: "NSimSun"
                    font.pointSize: 10
                    color: "white"
                }
                background: Rectangle{
                    anchors.fill: parent
                    color: parent.hovered ? "#009900":"#00b200"
                }

                MouseArea{
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        loginButton.visible = false
                        loginAfterButton.visible = true
                        clickLogin.start()
                        displayTextColor = "gray"
                    }
                }
            }

            Timer{
                id: clickLogin
                interval: 200
                repeat: true
                onTriggered:{
                    if(i >= 4)
                        i = 0
                    if(j > 10){
                        login.opacity = 0.0
                        root.show()
                    }

                    displayText = dynamicText[i]
                    i++
                    j++
                }
            }

            Button{
                id: loginChangeButton
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 50
                Text {
                    anchors.centerIn: parent
                    text: displayText
                    font.family: "NSimSun"
                    font.pointSize: 10
                    color: displayTextColor
                }
                background: Rectangle{
                    anchors.fill: parent
                    color: "transparent"
                }

                MouseArea{
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }
    }

    StackView{
        id: loginStackView
        anchors.top: parent.top
        anchors.topMargin: 25
        width: parent.width
        height: parent.height - 25
        initialItem: mainView
    }


    Window {
        id: root
        visible: false
        width: 850
        height: 590
        title: qsTr("WeChat")
        flags: Qt.Window | Qt.FramelessWindowHint | Qt.WindowMinMaxButtonsHint

        //背景
        Rectangle {
            id: bg
            anchors.fill: parent
            color: "transparent"
            border.color: "red"
        }

        SideBar{
            id: sideBar
        }

        ListBar{
            id:listBar
        }

        ContentBar{
            id: contentBar
        }
    }
}



