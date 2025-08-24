//@pragma UserQApplication

import QtQuick
import Quickshell
import "./Modules/Bar/"

ShellRoot {
    id: root

    Loader {
        active: true
        sourceComponent: Bar{}
    }
}
