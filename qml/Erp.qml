import QtQuick 2.0
import QtQuick.Controls 2.15
import "product"

Item {
    id: erp
    anchors.fill: parent
    property string f: "Courier New"
    Rectangle {
        anchors.fill: parent
        color: "#f4fcedda"
    }

    Item {
        id: header
        width: parent.width
        height: parent.height * 0.08
        property bool produit: {
            if(btn_produit.clicked){
                btn_client.clicked = false
                btn_facture.clicked = false
                btn_export.clicked = false
                btn_service.clicked = false
                return true
            }return false
        }
        property bool client: {
            if(btn_client.clicked){
                btn_produit.clicked = false
                btn_facture.clicked = false
                btn_export.clicked = false
                btn_service.clicked = false
                return true
            }return false
        }
        property bool facture: {
            if(btn_facture.clicked){
                btn_produit.clicked = false
                btn_client.clicked = false
                btn_export.clicked = false
                btn_service.clicked = false
                return true
            }return false
        }
        property bool exportation: {
            if(btn_export.clicked){
                btn_produit.clicked = false
                btn_facture.clicked = false
                btn_client.clicked = false
                btn_service.clicked = false
                return true
            }return false
        }
        property bool service: {
            if(btn_service.clicked){
                btn_produit.clicked = false
                btn_facture.clicked = false
                btn_export.clicked = false
                btn_client.clicked = false
                return true
            }return false
        }

        Rectangle{
            anchors.fill: parent
            color: "#ff4285f4"
        }

        Btn {
            id: btn_produit
            x: parent.width * 0.02
            height: header.height
            property string name: "produit"
            property bool external: false
            btn_text: "<b>BD</b> <b>P</b>roduits"
            btn_color: clicked == false ? "#ff4285f4" : "#ffffff"
            btn_text_color: clicked == false ? "#ffffff" : "#ff4285f4"

        }
        Btn {
            id: btn_client
            x: btn_produit.x + btn_produit.width + 20
            height: header.height
            property string name: "client"
            btn_text: "<b>BD</b> <b>C</b>lients"
            btn_color: clicked == false ? "#ff4285f4" : "#ffffff"
            btn_text_color: clicked == false ? "#ffffff" : "#ff4285f4"
        }
        Btn {
            id: btn_facture
            x: btn_client.x + btn_client.width + 20
            height: header.height
            property string name: "facture"
            btn_text: "<b>F</b>actures/<b>P</b>roformas"
            btn_color: clicked == false ? "#ff4285f4" : "#ffffff"
            btn_text_color: clicked == false ? "#ffffff" : "#ff4285f4"
        }
        Btn {
            id: btn_export
            x: btn_facture.x + btn_facture.width + 20
            height: header.height
            property string name: "export"
            btn_text: "<b>E</b>xport"
            btn_color: clicked == false ? "#ff4285f4" : "#ffffff"
            btn_text_color: clicked == false ? "#ffffff" : "#ff4285f4"
        }
        Btn {
            id: btn_service
            x: btn_export.x + btn_export.width + 20
            height: header.height
            property string name: "service"
            btn_text: "<b>N</b>os <b>S</b>ervices"
            btn_color: clicked == false ? "#ff4285f4" : "#ffffff"
            btn_text_color: clicked == false ? "#ffffff" : "#ff4285f4"
        }

    }

    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    Item {
        id: body
        y: header.height
        width: erp.width
        height: erp.height - header.height
        visible: header.produit

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
                font { family: f;}
                color: "#ff4285f4"
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
            y: product.y - height * 1.5
            x: erp.width * 0.73
            placeholderText: "Réf. Ex: P00077"
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

        Product {
            id: product
            anchors.horizontalCenter: body.horizontalCenter
            y: 80
            // +++++++++++++++++++++++++++++++++++++++++
            color_rect: "lightgray"
            // +++++++++++++++++++++++++++++++++++++++++
        }
        ScrollView {
            y: product.y + product. height + 7
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
                    model: 20

                    Pdt {
                        ref: "P0000"+index
                        visible: {
                            var str = search.text
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
        }


    }
}

