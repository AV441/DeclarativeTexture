//
//  VStack.swift
//

import AsyncDisplayKit

public struct VStack: LayoutElement {

    private let spacing: CGFloat
    private let justifyContent: ASStackLayoutJustifyContent
    private let alignItems: ASStackLayoutAlignItems
    private let flexWrap: ASStackLayoutFlexWrap
    private let alignContent: ASStackLayoutAlignContent
    private let lineSpacing: CGFloat
    private let children: LayoutElement

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
        [ASStackLayoutSpec(direction: .vertical,
                           spacing: spacing,
                           justifyContent: justifyContent,
                           alignItems: alignItems,
                           flexWrap: flexWrap,
                           alignContent: alignContent,
                           lineSpacing: lineSpacing,
                           children: children.build())]
    }
}
