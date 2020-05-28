import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.13

Rectangle {
    id: listBar
    width: 250
    height: parent.height
    color: "#e5e5e5"
    anchors.left: sideBar.right

    property var previousIndex:[-1,-1,0]

    Row{
        anchors.fill: parent
        anchors.top: parent.top
        anchors.topMargin: 25
        anchors.left: parent.left
        anchors.leftMargin: 10
        spacing: 10

        Rectangle{
            id: searchBar
            width: 200
            height: 25
            radius: 5
            color: "#d2d2d2"

            Image {
                id: searchImage
                width: 20
                height: 20
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/images/search.png"
            }

            TextField{
                id: inputBar
                anchors.left: searchImage.right
                anchors.verticalCenter: parent.verticalCenter
                width: 160
                selectByMouse:true
                selectedTextColor: "white"
                selectionColor: "#5772ff"
                placeholderText: "搜索"
                placeholderTextColor: "gray"
                autoScroll: true
                clip: true

                font{
                    family: "NSimSun"
                    pixelSize: 13
                }
                background: Rectangle{
                    anchors.fill: parent
                    color: "transparent"
                    border.color: "transparent"
                }

                onPressed: {
                    searchBar.color = "white"
                    delButton.visible = true
                }
            }

            Button{
                id: delButton
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                width: 15
                height: 15
                visible: false
                background: Rectangle{
                    anchors.fill: parent
                    color: "transparent"

                    Image {
                        width: 20
                        height: 15
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        source: delButton.hovered ? "qrc:/images/del.png":"qrc:/images/del1.png"
                    }
                }
            }
        }

        Rectangle{
            id: addButton
            width: 25
            height: 25
            radius: 5
            color: "#d2d2d2"

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                width: 15
                height: 15
                source: "qrc:/images/add.png"
            }
        }
    }

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>聊天
    Component{
        id: chatListDelegate
        ItemDelegate{
            id: delegate
            width: parent.width
            height: 60
            background: Rectangle{
                color:(delegate.ListView.view.currentIndex !== index && delegate.hovered) ? "#dbdbdf":"transparent"
            }

            MouseArea{
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onClicked: {
                    if (mouse.button === Qt.LeftButton) {
                        previousIndex[0] = index
                        delegate.ListView.view.currentIndex = index
                        switchStachView(0)
                    }
                    else if(mouse.button === Qt.RightButton){
                        menu.x = mouseX
                        menu.y = mouseY
                        menu.open()
                    }
                }
            }

            Menu{
                id: menu
                width: 100
                height: 90
                background: Rectangle{
                    anchors.fill:parent
                    color: "white"
                }
                MenuItem{text:"置顶";height: 25}
                MenuItem{text:"消息免打扰";height: 25}
                MenuSeparator {}
                MenuItem{text:"删除聊天";height: 25}
            }

            RowLayout{
                anchors.fill: parent
                anchors.left: parent.left
                anchors.leftMargin: 10
                spacing: 10

                Rectangle{
                    radius: 3
                    width: 40
                    height: 40
                    Image {
                        anchors.fill: parent
                        smooth:true
                        source: url
                    }
                }

                Label{
                    Layout.topMargin: -17
                    text: name
                    font.family: "微软雅黑"
                    font.pointSize: 10
                }

                Item{
                    Layout.fillWidth: true
                }

                Label{
                    Layout.topMargin: -17
                    Layout.rightMargin: 10
                    text: time
                    font.family: "NSimSun"
                    font.pointSize: 10
                }
            }
        }
    }

    Component{
        id: backGroundColor
        Rectangle{
            width: parent.width
            height: 40
            color: "#c3c3c6"
        }
    }

    ListModel{
        id: chatListModel
        ListElement{url:"qrc:/images/book/dawa.jpg";name:"大娃";time:"09:35";flag:false}
        ListElement{url:"qrc:/images/book/erwa.jpg";name:"二娃";time:"09:36";flag:false}
        ListElement{url:"qrc:/images/book/sanwa.jpg";name:"三娃";time:"09:37";flag:false}
        ListElement{url:"qrc:/images/book/siwa.jpg";name:"四娃";time:"09:38";flag:false}
    }

    Component{
        id: chatListView

        ListView{
            model: chatListModel
            delegate: chatListDelegate
            highlight: backGroundColor
            highlightFollowsCurrentItem :true
            currentIndex: previousIndex[0]
            ScrollBar.vertical: ScrollBar {
                width: 10
                height: parent.height
                anchors.right:parent.right
                // 滚动
                position: parent.visibleArea.yPosition
                active: true
            }
        }
    }
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<聊天
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>通讯录
    Component{
        id: bookListDelegate

        ItemDelegate{
            id: delegate
            width: parent.width
            height: 80
            background: Rectangle{
                height: 55
                anchors.bottom: parent.bottom
                color:(delegate.ListView.view.currentIndex !== index && delegate.hovered) ? "#dbdbdf":"transparent"
            }

            MouseArea{
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onClicked: {
                    if (mouse.button === Qt.LeftButton) {
                        previousIndex[1] = index
                        delegate.ListView.view.currentIndex = index
                        switchStachView(1)
                    }
                    else if(mouse.button === Qt.RightButton){
                        if(title !== "新的朋友" && title !== "公众号"){
                            menu.x = mouseX
                            menu.y = mouseY
                            if(title === "群聊")
                                menu.open()
                            else
                                menu1.open()
                        }
                    }
                }
            }

            Menu{
                id: menu
                width: 100
                height: 90
                background: Rectangle{
                    anchors.fill:parent
                    color: "white"
                }
                MenuItem{text:"发消息";height: 25}
                MenuItem{text:"修改群名称";height: 25}
                MenuSeparator {}
                MenuItem{text:"删除并退出群组";height: 25}
            }

            Menu{
                id: menu1
                width: 100
                height: 120
                background: Rectangle{
                    anchors.fill:parent
                    color: "white"
                }
                MenuItem{text:"发消息";height: 25}
                MenuItem{text:"标为星标朋友";height:25}
                MenuItem{text:"发送名片";height: 25}
                MenuSeparator {}
                MenuItem{text:"删除朋友";height: 25}
            }

            //分割线
            Rectangle{
                anchors.bottom: parent.bottom
                width: delegate.width
                height: 1
                color: "#dbdbdf"
            }

            ColumnLayout{
                spacing: 10
                Layout.topMargin: 30
                Label{
                    Layout.topMargin: 10
                    Layout.leftMargin: 10
                    text: title
                    font.family: "SimSun"
                    font.pointSize: 8
                    visible: flag
                    color: "gray"
                }
                RowLayout{
                    spacing: 10
                    Layout.topMargin: 5
                    Layout.leftMargin: 10
                    Rectangle{
                        radius: 3
                        width: 35
                        height: 35
                        Image {
                            anchors.fill: parent
                            smooth:true
                            source: url
                        }
                    }

                    Label{
                        text: name
                        font.family: "STHeiti"
                        font.pointSize: 12
                    }
                }
            }
        }
    }

    ListModel{
        id: bookListModel
        ListElement{url:"qrc:/images/add_friend.png";title:"新的朋友";name:"新的朋友";flag:true}
        ListElement{url:"qrc:/images/subscribe.png";title:"公众号";name:"公众号";flag:true}
        ListElement{url:"qrc:/images/book/huluxiongdi.png";title:"群聊";name:"葫芦一家亲";flag:true}
    }

    Component{
        id: backGroundColor1
        Column{
            Rectangle{
                width: parent.width
                height: 25
                color: "transparent"
            }
            Rectangle{
                width: parent.width
                height: 55
                color: "#c3c3c6"
            }
        }
    }

    Component{
        id: bookListView

        ListView{
            model: bookListModel
            delegate: bookListDelegate
            highlight: backGroundColor1
            highlightFollowsCurrentItem :true
            currentIndex: previousIndex[1]
            ScrollBar.vertical: ScrollBar {
                width: 10
                height: parent.height
                anchors.right:parent.right
                // 滚动
                position: parent.visibleArea.yPosition
                active: true
            }
        }
    }
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<通讯录
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<收藏

    Component{
        id: collectListDelegate
        ItemDelegate{
            id: delegate
            width: parent.width
            height: 40
            background: Rectangle{                
                color:(!noteButton.hovered && delegate.ListView.view.currentIndex !== index && delegate.hovered) ? "#dbdbdf":"transparent"
            }

            MouseArea{
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onClicked: {
                    if (mouse.button === Qt.LeftButton) {
                        previousIndex[2] = index
                        delegate.ListView.view.currentIndex = index
                        switchStachView(2)
                    }
                }
            }

            Button{
                 id: noteButton
                 anchors.top: parent.top
                 anchors.topMargin: -65
                 width: 150
                 height: 35
                 anchors.left: parent.left
                 anchors.leftMargin: 50
                 display: AbstractButton.TextBesideIcon
                 icon.source:"qrc:/images/edit.png"
                 text: "新建笔记"
                 font.family: "STHeiti"
                 font.pointSize: 12
                 visible: index === 0 ? true:false
                 background: Rectangle{
                     anchors.fill: parent
                     color: noteButton.hovered ? "#cdcece":"white"
                     radius: 5
                 }
             }

            Row{
                anchors.fill: parent
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top: parent.top
                anchors.topMargin: 10
                spacing: 10

                Rectangle{
                    radius: 3
                    width: 25
                    height: 25
                    color: "transparent"
                    Image {
                        anchors.fill: parent
                        smooth:true
                        source: url
                    }
                }

                Label{
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    text: name
                    font.family: "STHeiti"
                    font.pointSize: 12
                }
            }
        }
    }

    ListModel{
        id: collectListModel
        ListElement{url:"qrc:/images/all_collect.png";name:"全部收藏"}
        ListElement{url:"qrc:/images/link.png";name:"链接"}
        ListElement{url:"qrc:/images/photo.png";name:"相册"}
        ListElement{url:"qrc:/images/notebook.png";name:"笔记"}
        ListElement{url:"qrc:/images/file.png";name:"文件"}
        ListElement{url:"qrc:/images/music.png";name:"音乐"}
    }

    Component{
        id: backGroundColor2
        Rectangle{
            width: parent.width
            height: 40
            color: "#c3c3c6"
        }
    }

    Component{
        id: collectListView

        ListView{
            anchors.top: parent.top
            anchors.topMargin: 80
            model: collectListModel
            delegate: collectListDelegate
            highlight: backGroundColor2
            highlightFollowsCurrentItem :true
            currentIndex: previousIndex[2]
        }
    }


//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>收藏

    function getListModelName(count){
        if(previousIndex[count] === -1){
            return " "
        }
        else if(count === 0){
            return chatListModel.get(previousIndex[count]).name
        }
        else if(count === 1){
            return bookListModel.get(previousIndex[count]).name
        }
        else if(count === 2){
            return collectListModel.get(previousIndex[count]).name
        }
    }

    signal switchStachView(int count)
    onSwitchStachView: {
        if(count === 0){
            searchBar.width = 200
            inputBar.width = 160
            inputBar.placeholderText = "搜索"
            addButton.visible = true
            listStackView.clear()
            listStackView.push(chatListView)
        }
        else if(count === 1){
            searchBar.width = 200
            inputBar.width = 160
            inputBar.placeholderText = "搜索"
            addButton.visible = true
            listStackView.clear()            
            listStackView.push(bookListView)
        }
        else if(count === 2){
            searchBar.width = 230
            inputBar.width = 190
            inputBar.placeholderText = "搜索收藏内容"
            addButton.visible = false
            listStackView.clear()
            listStackView.push(collectListView)
        }

        emit: contentBar.switchStachView(count,getListModelName(count))
    }

    StackView{
        id: listStackView
        anchors.top: parent.top
        anchors.topMargin: 60
        width: parent.width
        height: parent.height - 60
        initialItem: chatListView
    }
}
