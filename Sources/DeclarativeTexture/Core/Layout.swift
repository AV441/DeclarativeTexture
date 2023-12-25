//
//  Layout.swift
//
//  Created by Андрей Ведищев on 17.12.2023.
//

import AsyncDisplayKit

/// Класс наследник `ASWrapperLayoutSpec` инициализируется с билдером `LayoutBuilder` возвращающим `LayoutElement`
/// Позволяет вернуть `ASLayoutSpec` для собранного в билдере элемента `LayoutElement`
public final class Layout: ASWrapperLayoutSpec {
    
    public init(@LayoutBuilder _ content: () -> LayoutElement) {
        super.init(layoutElements: content().build())
    }
}
