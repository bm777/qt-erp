import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Window 2.6
import "../"


Window {
    id: root
    width: Screen.width         //800
    height: Screen.height       //800
    visible: true

    Component.onCompleted: {
            x = Screen.width / 2 - width / 2
            y = Screen.height / 2 - height / 2

        }

    Rectangle {
        anchors.fill: parent
        color: "#f4fcedda"
        Text {
            id: inside
            text: qsTr(ref)
        }
    }

    property string f: "Courier New"
    property color color_rect : "white"
    property string ref: "P00001"
    property string client: "C00001"
    property string emission: "08/02/2021"
    property string delay: "08/02/2021"
    property string paiment: "Cash"
    property string type: "facture"
    property real discount: 5
    property int facture_id: bridge.select_facture_id(input_ref.gettext)


    Item {
        id: header
        width: parent.width
        height: parent.height * 0.07

        Rectangle {
            anchors.fill: parent
            color: "#ffd9d9d9"
            Text {
                text: "Modification de " + root.ref
                color: "#999999"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font {family: f; pointSize: 20}
            }
        }
    }



    Item {
        id: content
        width: parent.width
        height: parent.height - header.height
        y: header.height

        FieldInput {
            id: input_ref
            label: "Référence"
//            placeholder: "P00077"
            lock: true
            value: root.ref
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: parent.height * 0.08
        }
        FieldInput {
            id: input_client
            label: "Client"
            lock: true
            value: root.client
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: input_ref.y + input_ref.height + 5
        }
        FieldInput {
            id: input_emission
            label: "Date d'émission"
            value: root.emission
            lock: true
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: input_client.y + input_client.height + 5
        }
        FieldInput {
            id: input_delay
            label: "Délai"
            value: root.delay
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: input_emission.y + input_emission.height + 5
        }
        FieldInput {
            id: input_paiment
            label: "Moyen de paie"
            value: root.paiment
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: input_delay.y + input_delay.height + 5
        }
        FieldInput {
            id: input_discount
            label: "Remise G."
            value: root.discount
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: input_paiment.y + input_paiment.height + 5
        }
        Combo {
            id: comb
            x: container.x + container.width + 20
            y: container.y
            model: {
                var l = bridge.select_produit()
                var tmp = []
                for(var i=0; i<l.length; i++){
                    tmp.push(l[i][2])
                }
                return tmp
            }
        }
        Spin {
            id: spin
            x: comb.x + comb.width + 20
            y: comb.y
        }


        BtnF {
            x: spin.x
            y: container.y + height * 1
            btn_text: "Ajouter"
            size: 15
            btn_color: "#ff4285f4"
            btn_text_color: "#ffffff"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    print(comb.currentText)
                    var produit_id = bridge.select_produit_id(comb.currentText)
                    bridge.insert_pf(produit_id, facture_id, spin.val)
                }
            }
        }


        Rectangle {
            id: container
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.4
//            color: "red"
            y: input_discount.y + input_discount.height + 5
            Column {
                id: col
                spacing: 10
                Repeater {
                    id: model_lot
                    model: bridge.select_pf(facture_id)

                    Lot {
                        id_id: modelData[0]
                        produit_id: modelData[2]
                        facture_id: facture_id
                        name: {
                            return bridge.produit_name(modelData[1])
                        }

                        qte: modelData[3]
                        x: 10
                    }
                }
            }
            Timer {
                id: timer_
                running: root.visible

                repeat: true
                interval: 1000
                onTriggered: {
                    model_lot.model = bridge.select_pf(facture_id)

                }
            }
        }
        //// +++++++++++ timer for product on a facture ++++++++++++++++++++



        Row {
            id: row
            spacing: 100
            y: root.height - 50 * 3 // input_discount.y + input_discount.height + 20    /// 50 size of BtnF
            anchors.horizontalCenter: parent.horizontalCenter

            BtnF {
                btn_text: "Annuler"
                size: 15
                btn_color: "lightgray"
                btn_text_color: "#ff4285f4"
                onClickedChanged: root.close()
            }
            BtnF {id: save
                btn_text: "Enregistrer"
                size: 15
                btn_color: "#ff4285f4"
                btn_text_color: "#ffffff"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        bridge.update_facture(input_ref.gettext,input_client.gettext,root.type,input_emission.gettext,input_delay.gettext,input_paiment.gettext,input_discount.gettext)
                        root.close()
                    }
                }
            }
        }
    Rectangle {id: rect
        y: root.height * 0.85
        x: root.width * 0.65
        width: pdf.width * 1.1 + text_pdf.width * 1.1
        height: pdf.height
        color: "transparent"
        border.color: "orange"
        border.width: 1
        Text {
            x: 10
            id: text_pdf
            text: "Imprimer"
            color: "orange"
            font {family: f; bold: true; pointSize: 15}
            anchors.verticalCenter: parent.verticalCenter
        }
        Image {
            id: pdf
            x: parent.width - pdf.width
            source: "../../img/pdf.png"
            width: 48
            height: width
            anchors.verticalCenter: parent.verticalCenter
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                rect.border.width = rect.border.width + 1
                print()
            }
            onExited: {
                rect.border.width = rect.border.width - 1
            }
            onClicked: {
                var data = model_lot.model
                bridge.export(input_client.gettext, input_ref.gettext, data)
            }
        }
    }
    }
}
