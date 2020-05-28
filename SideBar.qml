import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.13

Rectangle {
    id: sideBar
    width: 56
    height: parent.height
    color: "#323232"

    property var flag : 0

    ColumnLayout{
        id: column
        anchors.fill: parent
        anchors.top: parent.top
        anchors.topMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 5

        Button{
            id: headButton
            width: parent.width
            height: 50
            icon.source:"qrc:/images/head.jpg"
            icon.color: "transparent"
            icon.width: 40
            icon.height: 40
            background: Rectangle{
                anchors.fill: parent
                color: "transparent"
            }                        
        }

        Button{
            id: chatButton
            width: parent.width
            height: 40
            icon.source: flag === 0 ? "qrc:/images/chat1.png":"qrc:/images/chat.png"
            icon.color: (flag !== 0 && chatButton.hovered) ? "white":"transparent"
            icon.width: 30
            icon.height: 30
            background: Rectangle{
                anchors.fill: parent
                color: "transparent"
            }

            ToolTip{
                visible: chatButton.hovered
                delay: 500
                text:qsTr("聊天")
                background: Rectangle{
                    border.color: "#7f7f7f"
                    radius: 3
                }
            }
        }

        Button{
            id: mailListButton
            width: parent.width
            height: 40
            icon.source: flag === 1 ? "qrc:/images/mailList1.png":"qrc:/images/mailList.png"
            icon.color: (flag !== 1 && mailListButton.hovered) ? "white":"transparent"
            icon.width: 30
            icon.height: 30
            background: Rectangle{
                anchors.fill: parent
                color: "transparent"
            }

            ToolTip{
                visible: mailListButton.hovered
                delay: 500
                text:qsTr("通讯录")
                background: Rectangle{
                    border.color: "#7f7f7f"
                    radius: 3
                }
            }
        }

        Button{
            id: collectButton
            width: parent.width
            height: 40
            icon.source: flag === 2 ? "qrc:/images/collect1.png":"qrc:/images/collect.png"
            icon.color: (flag !== 2 && collectButton.hovered) ? "white":"transparent"
            icon.width: 30
            icon.height: 30
            background: Rectangle{
                anchors.fill: parent
                color: "transparent"
            }
            ToolTip{
                visible: collectButton.hovered
                delay: 500
                text:qsTr("收藏")
                background: Rectangle{
                    border.color: "#7f7f7f"
                    radius: 3
                }
            }
        }

        Item{
            Layout.fillHeight: true
        }


        Button{
            id: moreButton
            width: parent.width
            height: 40
            icon.source: "qrc:/images/more.png"
            icon.color: moreButton.hovered ? "white":"transparent"
            icon.width: 30
            icon.height: 30
            background: Rectangle{
                anchors.fill: parent
                color: "transparent"
            }
            ToolTip{
                visible: moreButton.hovered
                delay: 500
                text:qsTr("更多")
                background: Rectangle{
                    border.color: "#7f7f7f"
                    radius: 3
                }
            }
        }
    }

    Popup{
        id: introduction
        x: headButton.x + headButton.width/2
        y: headButton.y + headButton.height/2
        width: 300
        height: 220
        //focus: true
        closePolicy: Popup.CloseOnPressOutside | Popup.CloseOnReleaseOutside

        background: Rectangle{
            anchors.fill: parent
            border.color: "white"
            radius: 5
        }

        TextField{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.topMargin: 20
            text: "POON"
            font.family: "NSimSun"
            font.pointSize: 20
            selectByMouse:true
            selectedTextColor: "white"
            selectionColor: "#5772ff"
            readOnly: true
            background: Rectangle{
                anchors.fill: parent
                border.color: "transparent"
            }
        }

        Image {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 90
            anchors.topMargin: 30
            width: 20
            height: 20
            source: "qrc:/images/sex.png"
        }

        Label{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.topMargin: 60
            text: "微信号:"
            font.family: "NSimSun"
            font.pointSize: 10
            color: "gray"
        }

        TextField{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 75
            anchors.topMargin: 55
            text: "P1234567"
            font.family: "NSimSun"
            font.pointSize: 10
            color: "gray"
            selectByMouse:true
            selectedTextColor: "white"
            selectionColor: "#5772ff"
            readOnly: true
            background: Rectangle{
                anchors.fill: parent
                color: "transparent"
                border.color: "transparent"
            }
        }

        Button{
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.rightMargin: 15
            anchors.topMargin: 20
            width: 70
            height: 70
            icon.source:"qrc:/images/head.jpg"
            icon.color: "transparent"
            icon.width: 70
            icon.height: 70
            background: Rectangle{
                anchors.fill: parent
                color: "transparent"
            }
        }

        Rectangle{
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.rightMargin: 15
            anchors.topMargin: 110
            width: parent.width - 45
            height: 1
            color: "#f7f7f9"
        }

        Label{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.topMargin: 130
            text: qsTr("地 区")
            font.family: "NSimSun"
            font.pointSize: 10
            color: "gray"
        }

        TextField{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 75
            anchors.topMargin: 120
            text: qsTr("山东 青岛")
            font.family: "NSimSun"
            font.pointSize: 12
            color: "#000000"
            selectByMouse:true
            selectedTextColor: "white"
            selectionColor: "#5772ff"
            readOnly: true
            background: Rectangle{
                anchors.fill: parent
                color: "transparent"
                border.color: "transparent"
            }
        }

        Button{
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: 50
            anchors.bottomMargin: 5
            width: 50
            height: 50
            icon.source:"qrc:/images/share.png"
            icon.color: hovered ? "black":"transparent"
            icon.width: 50
            icon.height: 50
            background: Rectangle{
                anchors.fill: parent
                color: "transparent"
            }

            ToolTip{
                visible: parent.hovered
                delay: 500
                text:qsTr("发送名片")
                background: Rectangle{
                    border.color: "#7f7f7f"
                    radius: 3
                }
            }
        }

        Button{
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.bottomMargin: 5
            width: 50
            height: 50
            icon.source:"qrc:/images/chat.png"
            icon.color: hovered ? "black":"#bfbfbf"
            icon.width: 50
            icon.height: 50
            background: Rectangle{
                anchors.fill: parent
                color: "transparent"
            }

            ToolTip{
                visible: parent.hovered
                delay: 500
                text:qsTr("发消息")
                background: Rectangle{
                    border.color: "#7f7f7f"
                    radius: 3
                }
            }
        }
    }

    Menu{
        id: moreMenu
        width: 110
        height: 120
        background: Rectangle{
            anchors.fill:parent
            color: "#323232"
        }

        MenuItem{
            Text {
                text: "意见反馈"
                color: "white"
                font.family: "NSimSun"
                font.pixelSize: 15
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
            }
            height: 40
            background: Rectangle{
                anchors.fill: parent
                color: parent.hovered ? "#444444":"transparent"
            }
        }
        MenuItem{
            Text {
                text: "备份与恢复"
                color: "white"
                font.family: "NSimSun"
                font.pixelSize: 15
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
            }
            height: 40
            background: Rectangle{
                anchors.fill: parent
                color: parent.hovered ? "#444444":"transparent"
            }
        }
        MenuItem{
            Text {
                text: "设置"
                color: "white"
                font.family: "NSimSun"
                font.pixelSize: 15
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
            }
            height: 40
            background: Rectangle{
                anchors.fill: parent
                color: parent.hovered ? "#444444":"transparent"
            }
        }
    }

    function getButtonStatus(){
        if(collectButton.hovered | mailListButton.hovered | chatButton.hovered | headButton.hovered | moreButton.hovered)
            return true
        else
            return false
    }

    MouseArea{
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        property point clickPos: "0,0"
        cursorShape: getButtonStatus() ? Qt.PointingHandCursor:Qt.ArrowCursor
        onPressed: { //接收鼠标按下事件
            clickPos  = Qt.point(mouse.x,mouse.y)
        }
        onPositionChanged: { //鼠标按下后改变位置
            //鼠标偏移量
            var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)

            //如果mainwindow继承自QWidget,用setPos
            root.setX(root.x+delta.x)
            root.setY(root.y+delta.y)
        }

        onClicked: {
            if(mouseY >= chatButton.y+column.y && mouseY <= chatButton.y+column.y + chatButton.height){
                flag = 0
                emit: listBar.switchStachView(flag)
            }
            else if(mouseY >= mailListButton.y+column.y && mouseY <= mailListButton.y+column.y + mailListButton.height){
                flag = 1
                emit: listBar.switchStachView(flag)
            }
            else if(mouseY >= collectButton.y+column.y && mouseY <= collectButton.y+column.y + collectButton.height){
                flag = 2
                emit: listBar.switchStachView(flag)
            }
            else if(mouseY >= headButton.y+column.y && mouseY <= headButton.y+column.y + headButton.height){
                introduction.open()
            }
            else if(mouseY >= moreButton.y+column.y && mouseY <= moreButton.y+column.y + moreButton.height){
                moreMenu.x = sideBar.x + sideBar.width
                moreMenu.y = sideBar.y + sideBar.height - moreMenu.height - 20
                moreMenu.open()
            }

        }
    }
}
