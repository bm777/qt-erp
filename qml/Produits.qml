import QtQuick 2.0
import QtQuick.Controls 2.15
import "product"

Item {
    id: body

    Rectangle {
        width: 40
        height: 40
        color: "#ff4285f4"
        radius: height / 2
        x: product.x
        y: height / 2
        Text {
            text: "+"
            anchors.centerIn: parent
            font.pointSize: 20
            color: "white"
        }
        Text {
            text: "Enregistrer un nouveau produit"
            anchors.verticalCenter: parent.verticalCenter
            x: parent.width * 1.5
            font { family: f; pointSize: 15; bold: true}
            color: "#ff4285f4"
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                var component = Qt.createComponent("product/New.qml");
                win = component.createObject(body);
                print(bridge.produit_last_id("SELECT id FROM Produit"))
                win.ref = "P000" + bridge.produit_last_id("SELECT id FROM Produit")

                win.show()
            }
        }
    }
    Text {id: label
        text: "Recherche par"
        y: 40 * 0.6
        x: search.x - search.width + 40
        color: "#80000000"
        font { family: f; pointSize: 15}
    }
    TextField {
        id: search
        width: erp.width * 0.12
        height: erp.height * 0.07
        y: 40 * 0.6 - label.height
        x: erp.width * 0.72
        placeholderText: "Réf. Ex: P00077"
        color: "black"
        horizontalAlignment: TextField.Center
        font { family: f; pointSize: 12; bold: true}
        background: Rectangle {
            anchors.fill: parent
            color: "transparent"
//                border.color: "lightgray"
        }
        Rectangle {
            y: parent.height * 0.65
            width: parent.width
            height: 1; color: "lightgray"
        }
    }

    HeaderList {
        id: product
        anchors.horizontalCenter: body.horizontalCenter
        y: 80
        // +++++++++++++++++++++++++++++++++++++++++
        color_rect: "lightgray"
        // +++++++++++++++++++++++++++++++++++++++++
    }
    ScrollView {
        y: product.y + product.height + 7
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
                id: model_p
                model: bridge.select_produit()

                Pdt {
                    ref: modelData[1]
                    desc: modelData[2]
                    price: modelData[3]
                    tva: modelData[4]
                    rmq: modelData[5]
                    visible: {
                        var str = search.text.toUpperCase()
                        if (str === ""){
                            return true
                        } else if(ref.includes(str)){
                            return true
                     } else return false
                    }

                    width: body.width * 0.7
                    height: body.height * 0.07
                }
            }
        }
        Timer {
            id: timer_p
            running: body.visible

            repeat: true
            interval: 1000
            onTriggered: {
                model_p.model = bridge.select_produit()
            }

        }
    }
}
