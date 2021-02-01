import QtQuick 2.0
import QtQuick.Controls 2.15

ApplicationWindow {
    id: root
    width: 100
    height: 100

    Rectangle {
        anchors.fill: parent
        color: "red"
    }

    property string f: "Courier New"
    property color color_rect : "white"
    property string ref: "P00001"
    property string desc: "Notion de base en ENR"
    property real price: 150000
    property real tva: 19.25
    property string rmq: "Payement en liquide"
}
