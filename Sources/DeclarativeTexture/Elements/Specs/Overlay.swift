//
//  Overlay.swift
//
//  Created by Андрей Ведищев on 19.12.2023.
//

import AsyncDisplayKit

public struct Overlay: LayoutElement {
    
    private let content: LayoutElement
    private let overlay: LayoutElement
    
    public init(content: () -> LayoutElement,
                overlay: () -> LayoutElement) {
        self.content = content()
        self.overlay = overlay()
    }
    
    public func build() -> [ASLayoutElement] {
        [ASOverlayLayoutSpec(child: content.build().first ?? ASLayoutSpec(),
                             overlay: overlay.build().first ?? ASLayoutSpec())]
    }
}
