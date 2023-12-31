//
//  OptionalLayout.swift
//

import AsyncDisplayKit

public struct OptionalLayout<Content: LayoutElement>: LayoutElement {

    private let content: Content?

    init(content: () -> Content?) {
        self.content = content()
    }

    public func build() -> [ASLayoutElement] {
        content?.build() ?? []
    }
}
