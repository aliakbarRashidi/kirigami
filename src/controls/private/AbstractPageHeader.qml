/*
 *   Copyright 2018 Marco Martin <mart@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 2 or
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

import QtQuick 2.5
import QtQuick.Controls 2.0 as Controls
import QtQuick.Layouts 1.2
import org.kde.kirigami 2.4

AbstractApplicationHeader {
    anchors.fill: parent
    property Item container
    property bool current

    minimumHeight: pageRow.globalToolBar.minimumHeight
    maximumHeight: pageRow.globalToolBar.maximumHeight
    preferredHeight: pageRow.globalToolBar.preferredHeight
    implicitHeight: page.y

    leftPadding: Qt.application.layoutDirection == Qt.LeftToRight
            ? Math.max(0, pageRow.contentItem.contentX - mapToItem(pageRow.contentItem.contentItem, 0, 0).x + pageRow.globalToolBar.leftReservedSpace)
            : Math.max(0, mapToItem(pageRow.contentItem.contentItem, width, 0).x - (pageRow.contentItem.contentX + pageRow.width) + pageRow.globalToolBar.leftReservedSpace)

    rightPadding: Qt.application.layoutDirection == Qt.LeftToRight
            ? Math.min(pageRow.globalToolBar.rightReservedSpace, Math.max(0, mapToItem(pageRow.contentItem.contentItem, width, 0).x - (pageRow.contentItem.contentX + pageRow.width) + pageRow.globalToolBar.rightReservedSpace))
            : Math.max(0, pageRow.contentItem.contentX - mapToItem(pageRow.contentItem.contentItem, 0, 0).x + pageRow.globalToolBar.rightReservedSpace)
}
