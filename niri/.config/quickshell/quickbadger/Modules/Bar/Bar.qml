import QtQuick
import Quickshell
import Quickshell.Hyprland

PanelWindow {
    id:panel

    //Attach panel to top edge, left edge, and right edge.
    //Effetctively, fill the screen.
    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 40
    margins {
        top: 2
        left: 2
        right: 2
    }

    Rectangle {
        id: bar
        anchors.fill: parent
        color: "#1a1a1a"
        radius: 15
        border.color: "#333333"
        border.width: 3

        Row {
            id: workspacesRow
            spacing: 8

            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
                leftMargin: 16
            }

            Repeater {
                model: Hyprland.workspaces

                Rectangle {
                    width: 32
                    height: 24
                    radius: 4
                    color: modelData.active ? "#4a9eff" : "#333333"
                    border.color: "#555555"
                    border.width: 1

                    MouseArea {
                        anchors.fill: parent
                        onClicked: Hyprland.dispatch("workspaces " + modelData.id)
                    }
                }
            }
        }
    }
}
