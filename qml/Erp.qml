import QtQuick 2.0

Item {
    id: erp
    anchors.fill: parent
    Rectangle {
        anchors.fill: parent
        color: "#54fcedda"
    }

    Item {
        id: header
        width: parent.width
        height: parent.height * 0.08
        property bool produit: {
            if(btn_produit.clicked==true){
                btn_client.clicked = false
                btn_facture.clicked = false
                btn_export.clicked = false
                btn_service.clicked = false
            }return false
        }
        property bool client: {
            if(btn_client.clicked==true){
                btn_produit.clicked = false
                btn_facture.clicked = false
                btn_export.clicked = false
                btn_service.clicked = false
            }return false
        }
        property bool facture: false
        property bool exportation: false
        property bool service: false

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
            btn_color: "#ff4285f4"
            btn_text_color: "#ffffff"
        }
        Btn {
            id: btn_export
            x: btn_facture.x + btn_facture.width + 20
            height: header.height
            property string name: "export"
            btn_text: "<b>E</b>xport"
            btn_color: "#ff4285f4"
            btn_text_color: "#ffffff"
        }
        Btn {
            id: btn_service
            x: btn_export.x + btn_export.width + 20
            height: header.height
            property string name: "service"
            btn_text: "<b>N</b>os <b>S</b>ervices"
            btn_color: "#ff4285f4"
            btn_text_color: "#ffffff"
        }
        function getcolor(name) {
            if(btn_produit.clicked){
                if(btn_produit.name === "produit"){
                    btn_produit.btn_color = "#ffffff"
                    btn_produit.btn_text_color = "#ff4285f4"
//                    return ["#ffffff", "#ff4285f4"]
                }
            }
        }
    }

    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    Item {
        id: body
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
