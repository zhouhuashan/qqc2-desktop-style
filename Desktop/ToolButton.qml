/*
 *   Copyright 2016 Marco Martin <mart@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 2, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU Library General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.6
import QtQuick.Templates 2.0 as T
//QQC1 is needed for StyleItem to fully work
import QtQuick.Controls 1.0 as QQC1
import QtQuick.Controls.Private 1.0

T.ToolButton {
    id: control

    implicitWidth: background.implicitWidth
    implicitHeight: background.implicitHeight

    hoverEnabled: true //Qt.styleHints.useHoverEffects TODO: how to make this work in 5.7?

    flat: true
    contentItem: Item {}
    background: StyleItem {
        id: styleitem
        elementType: control.flat ? "toolbutton" : "button"
        sunken: control.pressed || (control.checkable && control.checked)
        raised: !(control.pressed || (control.checkable && control.checked))
        hover: control.hovered
        text: control.text
        hasFocus: false
        activeControl: control.isDefault ? "default" : "f"
    }
}