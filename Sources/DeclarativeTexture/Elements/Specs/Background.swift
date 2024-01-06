//
//  Background.swift
//

import AsyncDisplayKit

public struct Background: LayoutElement {

    private let content: LayoutElement
    private let background: LayoutElement

    public init(content: () -> LayoutElement,
                background: () -> LayoutElement) {
        self.content = content()
        self.background = background()
    }

    public func build() -> [ASLayoutElement] {
        [ASBackgroundLayoutSpec(child: content.build().first ?? ASLayoutSpec(),
                                background: background.build().first ?? ASLayoutSpec())]
    }
}
