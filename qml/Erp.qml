import QtQuick 2.0
import QtQuick.Controls 2.15
import "product"

Item {
    id: erp
    anchors.fill: parent
    property string f: "Courier New"
    property string ref: "P00025"
    property variant win;

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
            btn_text: "<b>F</b>actures"
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
            btn_text: "<b>S</b>ervices"
            btn_color: clicked == false ? "#ff4285f4" : "#ffffff"
            btn_text_color: clicked == false ? "#ffffff" : "#ff4285f4"
        }
    }

    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    Produits {
        id: produits
        y: header.height
        visible: header.produit
        width: erp.width
        height: erp.height - header.height
    }
    Clients {
        id: clients
        y: header.height
        visible: header.client
        width: erp.width
        height: erp.height - header.height
    }

}

