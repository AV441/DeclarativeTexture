//
//  HStack.swift
//
//  Created by Андрей Ведищев on 17.12.2023.
//

import AsyncDisplayKit

public struct HStack: LayoutElement {
    
    let spacing: CGFloat
    let justifyContent: ASStackLayoutJustifyContent
    let alignItems: ASStackLayoutAlignItems
    let flexWrap: ASStackLayoutFlexWrap
    let alignContent: ASStackLayoutAlignContent
    let lineSpacing: CGFloat
    let children: LayoutElement
    
    public init(spacing: CGFloat = 0,
                justifyContent: ASStackLayoutJustifyContent = .start,
                alignItems: ASStackLayoutAlignItems = .stretch,
                flexWrap: ASStackLayoutFlexWrap = .noWrap,
                alignContent: ASStackLayoutAlignContent = .start,
                lineSpacing: CGFloat = 0,
                @LayoutBuilder children: () -> LayoutElement) {
        self.spacing = spacing
        self.justifyContent = justifyContent
        self.alignItems = alignItems
        self.flexWrap = flexWrap
        self.alignContent = alignContent
        self.lineSpacing = lineSpacing
        self.children = children()
    }
    
    public func build() -> [ASLayoutElement] {
        [ASStackLayoutSpec(direction: .horizontal,
                           spacing: spacing,
                           justifyContent: justifyContent,
                           alignItems: alignItems,
                           flexWrap: flexWrap,
                           alignContent: alignContent,
                           lineSpacing: lineSpacing,
                           children: children.build())]
    }
}
