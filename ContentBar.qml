import QtQuick 2.0
import QtQuick.Controls 2.5

Rectangle {
    id: contentBar
    anchors.right: parent.right
    height: parent.height
    width: parent.width - sideBar.width - listBar.width
    color: "#f7f7f9"

    property var isFullScreen : false
    property var isTop : false
    property var display
    //关闭、最大最下化、置顶按钮
    Row{
        id: title
        anchors.right: parent.right
        Button{
            id: topButton
            width: 35
            height: 25
            icon.source:"qrc:/images/top.png"
            background: Rectangle{
                color: topButton.hovered ? "#dbdbdb":"transparent"
            }

            Rectangle {
                visible: isTop ? true:false
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                color: "#dbdbdb"
                width: 15
                height: 15
                radius: 2
            }

            ToolTip{
                visible: topButton.hovered
                delay: 500
                text:qsTr("置顶")
                background: Rectangle{
                    border.color: "#7f7f7f"
                    radius: 3
                }
            }
        }

        Button{
            id: minButton
            width:35
            height: 25
            icon.source:"qrc:/images/min.png"
            background: Rectangle{
                color: minButton.hovered ? "#dbdbdb":"transparent"
            }

            ToolTip{
                visible: minButton.hovered
                delay: 500
                text:qsTr("最小化")
                background: Rectangle{
                    border.color: "#7f7f7f"
                    radius: 3
                }
            }
        }
        Button{
            id: maxButton
            width:35
            height: 25
            icon.source: isFullScreen ? "qrc:/images/max1.png":"qrc:/images/max.png"
            background: Rectangle{
                color: maxButton.hovered ? "#dbdbdb":"transparent"
            }

            ToolTip{
                visible: maxButton.hovered
                delay: 500
                text:qsTr("最大化")
                background: Rectangle{
                    border.color: "#7f7f7f"
                    radius: 3
                }
            }
        }
        Button{
            id: closeButton
            width:35
            height: 25
            icon.source:"qrc:/images/close.png"
            background: Rectangle{
                color: closeButton.hovered ? "#ff4c4c":"transparent"
            }

            ToolTip{
                visible: closeButton.hovered
                delay: 500
                text:qsTr("关闭")
                background: Rectangle{
                    border.color: "#7f7f7f"
                    radius: 3
                }
            }
        }
    }

    Button{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: 100
        height: 100
        icon.source:"qrc:/images/wechat.png"
        icon.color: "transparent"
        icon.width: 100
        icon.height: 100
        background: Rectangle{
            anchors.fill: parent
            color: "transparent"
        }
    }

/////////////////////////////////////////////////////////////////
    Component{
        id: chatView

        Rectangle{
            color: "#f7f7f9"
            Label{
                anchors.left: parent.left
                anchors.leftMargin: 25
                text: display
                font.family: "SimSun"
                font.pointSize: 17
                color: "black"

                MouseArea{
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        if(!popup.opened)
                            popup.open()
                    }
                }
            }

            Button{
                id: moreButton
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.top: parent.top
                anchors.topMargin: 10
                background: Rectangle{
                    anchors.fill: parent
                    color: "transparent"
                    Image {
                        anchors.fill: parent
                        source: moreButton.hovered ? "qrc:/images/more1_hover.png":"qrc:/images/more1.png"
                    }
                }

                MouseArea{
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        if(!popup.opened)
                            popup.open()
                    }
                }
            }

            Rectangle{
                anchors.top: parent.top
                anchors.topMargin: 40
                width: parent.width
                height: 1
                color: "#dbdbdf"
            }

            Rectangle{
                anchors.bottom: parent.bottom
                width: parent.width
                height: 140

                Button{
                    anchors.left: parent.left
                    anchors.leftMargin: 25
                    width: 35
                    height: 35
                    icon.source: "qrc:/images/face.png"
                    icon.color: hovered ? "black":"#515151"
                    background: Rectangle{
                        anchors.fill: parent
                        color: "transparent"
                    }

                    ToolTip{
                        visible: parent.hovered
                        delay: 500
                        text:qsTr("表情")
                        background: Rectangle{
                            border.color: "#7f7f7f"
                            radius: 3
                        }
                    }

                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                    }
                }

                Button{
                    anchors.left: parent.left
                    anchors.leftMargin: 60
                    width: 35
                    height: 35
                    icon.source: "qrc:/images/send_file.png"
                    icon.color: hovered ? "black":"#515151"
                    background: Rectangle{
                        anchors.fill: parent
                        color: "transparent"
                    }

                    ToolTip{
                        visible: parent.hovered
                        delay: 500
                        text:qsTr("发送文件")
                        background: Rectangle{
                            border.color: "#7f7f7f"
                            radius: 3
                        }
                    }

                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                    }
                }

                Button{
                    anchors.left: parent.left
                    anchors.leftMargin: 95
                    width: 35
                    height: 35
                    icon.source: "qrc:/images/clip.png"
                    icon.color: hovered ? "black":"#515151"
                    background: Rectangle{
                        anchors.fill: parent
                        color: "transparent"
                    }

                    ToolTip{
                        visible: parent.hovered
                        delay: 500
                        text:qsTr("截图(Alt + A)")
                        background: Rectangle{
                            border.color: "#7f7f7f"
                            radius: 3
                        }
                    }

                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                    }
                }

                Button{
                    anchors.left: parent.left
                    anchors.leftMargin: 125
                    width: 36
                    height: 36
                    icon.source: "qrc:/images/send_message.png"
                    icon.color: hovered ? "black":"#515151"
                    background: Rectangle{
                        anchors.fill: parent
                        color: "transparent"
                    }

                    ToolTip{
                        visible: parent.hovered
                        delay: 500
                        text:qsTr("聊天记录")
                        background: Rectangle{
                            border.color: "#7f7f7f"
                            radius: 3
                        }
                    }

                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                    }
                }

                Button{
                    anchors.right: parent.right
                    anchors.rightMargin: 55
                    width: 34
                    height: 34
                    icon.source: "qrc:/images/phone.png"
                    icon.color: hovered ? "black":"#515151"
                    background: Rectangle{
                        anchors.fill: parent
                        color: "transparent"
                    }

                    ToolTip{
                        visible: parent.hovered
                        delay: 500
                        text:qsTr("语音聊天")
                        background: Rectangle{
                            border.color: "#7f7f7f"
                            radius: 3
                        }
                    }

                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                    }
                }

                Button{
                    anchors.right: parent.right
                    anchors.rightMargin: 25
                    width: 36
                    height: 36
                    icon.source: "qrc:/images/video.png"
                    icon.color: hovered ? "black":"#515151"
                    background: Rectangle{
                        anchors.fill: parent
                        color: "transparent"
                    }

                    ToolTip{
                        visible: parent.hovered
                        delay: 500
                        text:qsTr("视频聊天")
                        background: Rectangle{
                            border.color: "#7f7f7f"
                            radius: 3
                        }
                    }

                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                    }
                }

                TextEdit{
                    id:textEdit
                    anchors.top: parent.top
                    anchors.topMargin: 35
                    anchors.right: parent.right
                    anchors.rightMargin: 25
                    width: parent.width - 25 - 30
                    height: 70
                    focus: true
                    //text: "<b>Hello</b> <i>World!</i>"
                    font.family: "SimSun"
                    font.pointSize: 12
                    color: "black"
                    selectByMouse:true
                    selectedTextColor: "white"
                    selectionColor: "#5772ff"
                    clip: true
                    wrapMode: TextEdit.WrapAnywhere
                }

                Button{
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    anchors.right: parent.right
                    anchors.rightMargin: 25
                    width: 70
                    height: 25
                    text: "发送(S)"
                    background: Rectangle{
                        anchors.fill: parent
                        color: parent.hovered ? "#2aa515":"#f7f7f9"
                    }

                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                    }
                }
            }         
        }
    }
////////////////////////////////////////////////////////////////////
    
    Component{
        id: bookView
        Rectangle{
            color: "#f7f7f9"
            Label{
                anchors.left: parent.left
                anchors.leftMargin: 25
                text: display
                font.family: "SimSun"
                font.pointSize: 17
                color: "black"
            }

            Rectangle{
                anchors.top: parent.top
                anchors.topMargin: 40
                width: parent.width
                height: 1
                color: "#dbdbdf"
            }
        }
    }

    Component{
        id: collectView
        Rectangle{
            color: "#f7f7f9"
            Label{
                anchors.left: parent.left
                anchors.leftMargin: 25
                text: display
                font.family: "SimSun"
                font.pointSize: 17
                color: "black"
            }

            Rectangle{
                anchors.top: parent.top
                anchors.topMargin: 40
                width: parent.width
                height: 1
                color: "#dbdbdf"
            }
        }
    }

    signal switchStachView(int count,var name)
    onSwitchStachView: {
        display = name
        if(name === " "){
            contentStackView.clear()
        }
        else if(count === 0){
            contentStackView.clear()
            contentStackView.push(chatView)
        }
        else if(count === 1){
            contentStackView.clear()
            contentStackView.push(bookView)
        }
        else if(count === 2){
            contentStackView.clear()
            contentStackView.push(collectView)
        }
    }

    StackView{
        id: contentStackView
        anchors.top: parent.top
        anchors.topMargin: 25
        width: parent.width
        height: parent.height - 25
        initialItem: null
    }


    function getButtonStatus(){
        if(closeButton.hovered | maxButton.hovered | minButton.hovered | topButton.hovered)
            return true
        else
            return false
    }

    MouseArea{
        //anchors.fill: parent
        anchors.top: parent.top
        width: parent.width
        height: 30
        acceptedButtons: Qt.LeftButton
        property point clickPos: "0,0"
        cursorShape: getButtonStatus() ? Qt.PointingHandCursor:Qt.ArrowCursor
        onPressed: { //接收鼠标按下事件
            if(isFullScreen){
                isFullScreen = !isFullScreen
                clicked(mouse)
            }

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
            if(mouseX >= closeButton.x+title.x && mouseX <= closeButton.x + closeButton.width+title.x){
                Qt.quit()
            }
            else if(mouseX >= maxButton.x+title.x && mouseX <= maxButton.x + maxButton.width+title.x){
                if(isFullScreen){
                    isFullScreen = !isFullScreen
                    root.showNormal()
                }
                else{
                    isFullScreen = !isFullScreen
                    root.showFullScreen()
                }
            }
            else if(mouseX >= minButton.x+title.x && mouseX <= minButton.x + minButton.width+title.x){
                root.showMinimized()
            }
            else if(mouseX >= topButton.x+title.x && mouseX <= topButton.x + topButton.width+title.x){
                if(isTop)
                    root.flags = Qt.Window | Qt.FramelessWindowHint | Qt.WindowMinMaxButtonsHint
                else
                    root.flags = Qt.Window | Qt.FramelessWindowHint | Qt.WindowMinMaxButtonsHint | Qt.WindowStaysOnTopHint
                isTop = !isTop
            }
        }
    }
}


