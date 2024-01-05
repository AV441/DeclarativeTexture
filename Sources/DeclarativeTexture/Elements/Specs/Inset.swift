//
//  Inset.swift
//
//  Created by Андрей Ведищев on 18.12.2023.
//

import AsyncDisplayKit

public struct Inset: LayoutElement {
    
    private let insets: UIEdgeInsets
    private let content: LayoutElement
    
    public init(insets: UIEdgeInsets,
                content: () -> LayoutElement) {
        self.insets = insets
        self.content = content()
    }
    
    public func build() -> [ASLayoutElement] {
        content.build().map { ASInsetLayoutSpec(insets: insets, child: $0) }
    }
}
