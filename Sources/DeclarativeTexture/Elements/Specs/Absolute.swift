//
//  Absolute.swift
//
//  Created by Андрей Ведищев on 04.01.2024.
//

import AsyncDisplayKit

public struct Absolute: LayoutElement {
    
    private let sizing: ASAbsoluteLayoutSpecSizing
    private let children: LayoutElement
    
    public init(sizing: ASAbsoluteLayoutSpecSizing,
                @LayoutBuilder content: () -> LayoutElement) {
        self.sizing = sizing
        self.children = content()
    }
    
    public func build() -> [ASLayoutElement] {
        [ASAbsoluteLayoutSpec(sizing: .default, children: children.build())]
    }
}
