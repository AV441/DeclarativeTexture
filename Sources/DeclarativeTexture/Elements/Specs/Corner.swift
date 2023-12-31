//
//  Corner.swift
//

import AsyncDisplayKit

public struct Corner: LayoutElement {

    private let content: LayoutElement
    private let cornerContent: LayoutElement
    private let location: ASCornerLayoutLocation
    private let offset: CGPoint

    public init(content: LayoutElement,
                cornerContent: LayoutElement,
                location: ASCornerLayoutLocation,
                offset: CGPoint = .zero) {
        self.content = content
        self.cornerContent = cornerContent
        self.location = location
        self.offset = offset
    }

    public func build() -> [ASLayoutElement] {
        let spec = ASCornerLayoutSpec(child: content.build().first ?? ASLayoutSpec(),
                                      corner: cornerContent.build().first ?? ASLayoutSpec(),
                                      location: location)
        spec.offset = offset
        return [spec]
    }
}
