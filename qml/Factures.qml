import QtQuick 2.0
import QtQuick.Controls 2.15
import "facture"

Item {
    id: body
//    property string code: "facture"

    Rectangle {
        width: 40
        height: 40
        color: "#ff4285f4"
        radius: height / 2
        x: facture.x
        y: height / 2
        Text {
            text: "+"
            anchors.centerIn: parent
            font.pointSize: 20
            color: "white"
        }
        Text {
            id: rect
            text: " Facture"
            anchors.verticalCenter: parent.verticalCenter
            x: parent.width * 1.5
            font { family: f;}
            color: "#ff4285f4"
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                var component = Qt.createComponent("facture/New.qml");
                win = component.createObject(body);
//                win.ref = erp.ref;
                win.code = "facture";
//                    if(component.status == Component.Error){
//                        print("Error loading component : ", component.errorString())
//                    }
                win.ref = "F000" + bridge.produit_last_id("SELECT id FROM Facture")
                win.show()
            }
        }
    }
    // +++++++++++++++++++++++++++++
    Rectangle {
        width: 40
        height: 40
        color: "#ff4285f4"
        radius: height / 2
        x: facture.x + rect.width * 3
        y: height / 2
        Text {
            text: "+"
            anchors.centerIn: parent
            font.pointSize: 20
            color: "white"
        }
        Text {
            text: "Proforma"
            anchors.verticalCenter: parent.verticalCenter
            x: parent.width * 1.5
            font { family: f;}
            color: "#ff4285f4"
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                var component = Qt.createComponent("facture/New.qml");
                win = component.createObject(body);
                win.code = "proforma"
//                win.ref = erp.ref;
//                    if(component.status == Component.Error){
//                        print("Error loading component : ", component.errorString())
//                    }
                win.ref = "PF000" + bridge.produit_last_id("SELECT id FROM Facture")
                win.show()
            }
        }
    }

    Text {
        text: "Recherche par"
        y: search.y + search.height / 3
        x: search.x - search.width * 2.4/4
        color: "#80000000"
        font { family: f}
    }
    TextField {
        id: search
        width: erp.width * 0.12
        height: erp.height * 0.04
        y: facture.y - height * 1.5
        x: erp.width * 0.73
        placeholderText: "Réf. Ex: F00077"
        color: "black"
        horizontalAlignment: TextField.Center
        font { family: f; pointSize: 10}
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
        id: facture
        anchors.horizontalCenter: body.horizontalCenter
        y: 80
        // +++++++++++++++++++++++++++++++++++++++++
        color_rect: "lightgray"
        // +++++++++++++++++++++++++++++++++++++++++
    }

    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    ScrollView {
        y: facture.y + facture.height + 7
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn
        anchors.horizontalCenter: parent.horizontalCenter
        contentWidth: col.width
        contentHeight: col.height
        height: parent.height * 0.8
        width: parent.width * 0.7
        clip: true


        Column {
            id: col
            spacing: 10

            Repeater{
                id: model_f
                model: bridge.select_facture()
                Fct {
                    ref: modelData[1]
                    client: modelData[2]
                    emission: modelData[4]
                    delay: modelData[5]
                    paiment: modelData[6]
                    type: modelData[3]
                    discount: parseFloat(modelData[7])
                    visible: {
                        var str = search.text.toUpperCase()
                        if(str === ""){
                            return true
                        } else if(ref.includes(str)){
                            return true
                     }else return false
                    }
                    width: body.width * 0.7
                    height: body.height * 0.07
                }
            }
        }
        Timer {
            id: timer_f
            running: body.visible

            repeat: true
            interval: 1000
            onTriggered: {
                model_f.model = bridge.select_facture()
            }

        }
    }

}
