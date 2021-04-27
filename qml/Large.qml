import QtQuick 2.12
import QtGraphicalEffects 1.12

Rectangle {
    id: root
    width: 100
    height: 60
    radius: 8
    layer.enabled: true
    property string text: "ERP/CRM"
    property string description: "description"
    property string first: "red"
    property string second: "red"
    property real size: 18
    property string img: "../img/invoice.png"
    property string f: "Courier New"
    property bool clicked: false

    layer.effect: DropShadow {
        anchors.fill: root
        horizontalOffset: 0 //3
        verticalOffset: 6 //20
        radius: 8.0
        spread: 0
        samples: 17
        color: "#80000000"
        source: root
    }

    gradient: Gradient {
        GradientStop { position: 0.0; color: root.first }
        GradientStop { position: 1.0; color: root.second }
    }
    Image {
        source: root.img
        anchors.verticalCenter: parent.verticalCenter
        x: root.width * 0.08
    }

    Text {
        id: t
        color: "white"
        text: root.text
        x: root.width * 0.3
        anchors.verticalCenter: parent.verticalCenter
        font {family: f; pointSize: root.size; bold: true}
    }
    Text {
        color: "#ffffffff"
        text: root.description
        x: root.width * 0.3
        y: t.y + 30
        font {family: f; pointSize: root.size / 2}
    }
    Rectangle {
        id: effect
        anchors.fill: parent
        color: "#3000ff00"
        visible: false
    }
    MouseArea {
        anchors.fill: effect
        hoverEnabled: true
        onClicked: {
            root.clicked = true
        }
        onEntered: effect.visible = true
        onExited: effect.visible = false
    }


}

