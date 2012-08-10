import QtQuick 1.1
import com.nokia.symbian 1.1

Page {
    Image{
        anchors.fill: parent
        source: "background.jpg"
    }

    ToolBar {
        id: toolBar
        SelectionListItem {
            width: 101
            height: 60
            anchors {
                left: parent.left
                leftMargin: 0
                top: parent.top
                topMargin: 0
                bottom: parent.bottom
                bottomMargin: 0
            }

//            title: selectionDialog.model.get(selectionDialog.selectedIndex).name

            onClicked: selectionDialog.open()

             SelectionDialog {
                 id: selectionDialog
                 titleText: "Select Language"
                 selectedIndex: 0
                 model: ListModel {
                     ListElement {
                         name: "Russia"
                         imageSource : "Ru.png"
                     }
                     ListElement {
                         name: "English"
                         imageSource: "En.png"
                     }
                 }

                 delegate: Component {
                    Rectangle {
                        anchors.top: parent.top
                        anchors.topMargin: index * row.height
                        anchors.left: parent.left
                        anchors.right: parent.right

                        Row{
                            id: row
                            spacing: 3

                            anchors.left: parent.left
                            anchors.right: parent.right

                            Image{
                             source: imageSource
                            }

                            Text {
                             id: text
                             color: "white"
                             text: name
                            }
                        }

                        MouseArea{
                         anchors.fill: row
                         onClicked: { selectionDialog.selectedIndex = index; selectionDialog.accept();}
                        }
                    }
                 }
             }

             Image {
                 width: 32
                 height: 32
                 anchors {
                     left: parent.left
                     leftMargin: 24
                     verticalCenter: parent.verticalCenter
                 }
                 source: selectionDialog.model.get(selectionDialog.selectedIndex).imageSource

             }
        }

        ToolButton {
            width: 50
            height: 50
            anchors {
                verticalCenterOffset: 0
                right: parent.right
                rightMargin: 5
                verticalCenter: parent.verticalCenter
            }

            Image {
                anchors {
                    right: parent.right
                    rightMargin: 7
                    left: parent.left
                    leftMargin: 7
                    bottom: parent.bottom
                    bottomMargin: 7
                    top: parent.top
                    topMargin: 7
                }
                source: "settings.png"
            }
        }
    }

//    Column{
//        anchors{
//            top: toolBar.bottom
//            topMargin: 3
//        }

//        ListItem {
//              Column {
//                  ListItemText {
//                      role: "Title"
//                      text: "О городе"
//                  }
//                  ListItemText {
//                      role: "SubTitle"
//                      text: "Информация о городе"
//                  }
//              }
//         }

//        ListItem {
//              Column {
//                  ListItemText {
//                      role: "Title"
//                      text: "Достопримечательности"
//                  }
//                  ListItemText {
//                      role: "SubTitle"
//                      text: "Достопримечательности"
//                  }
//              }
//         }
//        ListItem {
//              Column {
//                  ListItemText {
//                      role: "Title"
//                      text: "Поиск"
//                  }
//                  ListItemText {
//                      role: "SubTitle"
//                      text: ""
//                  }
//              }
//         }
//        ListItem {
//              Column {
//                  ListItemText {
//                      role: "Title"
//                      text: "Карта"
//                  }
//                  ListItemText {
//                      role: "SubTitle"
//                      text: ""
//                  }
//              }
//         }
//    }

    Column {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 90

        spacing: 50

        Button {
            anchors.left: parent.left
            anchors.right: parent.right
            height: 80
            text: "О городе"
            onClicked: {
            }
        }

        Button {
            anchors.left: parent.left
            anchors.right: parent.right
            height: 80
           text: "Достопримечательности"
        }

        Button {
            anchors.left: parent.left
            anchors.right: parent.right
            height: 80
            text: "Поиск"
        }

        Button {
            anchors.left: parent.left
            anchors.right: parent.right
            height: 80
            text: "Карта"
        }

        Button {
            anchors.left: parent.left
            anchors.right: parent.right
            height: 80
            text: "Настройка"
        }
    }
}
