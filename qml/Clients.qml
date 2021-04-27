import QtQuick 2.0
import QtQuick.Controls 2.15
import "client"

Item {
    id: body
    property string last_ref: "C000023"

    Rectangle {
        width: 40
        height: 40
        color: "#ff4285f4"
        radius: height / 2
        x: client.x
        y: height / 2
        Text {
            text: "+"
            anchors.centerIn: parent
            font.pointSize: 20
            color: "white"
        }
        Text {
            text: "Enregistrer un nouveau client"
            anchors.verticalCenter: parent.verticalCenter
            x: parent.width * 1.5
            font { family: f; pointSize: 15; bold: true}
            color: "#ff4285f4"
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                var component = Qt.createComponent("client/New.qml");
                win = component.createObject(body);
//                win.ref = body.last_ref;
//                    if(component.status == Component.Error){
//                        print("Error loading component : ", component.errorString())
//                    }
                win.ref = "C000" + bridge.produit_last_id("SELECT id FROM Client")
                win.show()
            }
        }
    }
    Text {
        text: "Recherche par"
        y: search.y + search.height / 3
        x: erp.width * 0.7
        color: "#80000000"
        font { family: f; pointSize: 15}
    }
    TextField {
        id: search
        width: erp.width * 0.12
        height: erp.height * 0.04
        y: client.y - height * 1.5
        x: erp.width * 0.79
        placeholderText: "Réf. Ex: C00077"
        color: "black"
        horizontalAlignment: TextField.Center
        font { family: f; pointSize: 12; bold: true}
        background: Rectangle {
            anchors.fill: parent
            color: "transparent"
//                border.color: "lightgray"
        }
        Rectangle{
            y: parent.height * 0.8
            width: parent.width
            height: 1; color: "lightgray"
        }
    }

    HeaderList {
        id: client
        anchors.horizontalCenter: body.horizontalCenter
        y: 80
        // +++++++++++++++++++++++++++++++++++++++++
        color_rect: "lightgray"
        // +++++++++++++++++++++++++++++++++++++++++
    }
    ScrollView {
        y: client.y + client.height + 7
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn
        anchors.horizontalCenter: parent.horizontalCenter
        contentWidth: col.width
        contentHeight: col.height
        height: parent.height * 0.8
        width: parent.width * 0.9
        clip: true


        Column {
            id: col
            spacing: 10

            Repeater{
                id: model_c
                model: bridge.select_client()

                Clt {
                    ref: modelData[1]
                    name: modelData[2]
                    type: modelData[3]
                    box: modelData[4]
                    town: modelData[5]
                    tel: modelData[6]
                    mail: modelData[7]
                    site: modelData[8]
                    rmq: modelData[9]
                    visible: {
                        var str = search.text.toUpperCase()
                        if(str === ""){
                            return true
                        } else if(ref.includes(str)){
                            return true
                     }else return false
                    }

                    width: body.width * 0.9
                    height: body.height * 0.07
                }
            }
        }
        Timer {
            id: timer_c
            running: body.visible

            repeat: true
            interval: 1000
            onTriggered: {
                model_c.model = bridge.select_client()
            }

        }
    }
}
