//
//  FlexGlowModifier.swift
//

import AsyncDisplayKit

public struct FlexGlowModifier: ElementModifier {

    private let flexGrow: CGFloat

    init(flexGrow: CGFloat) {
        self.flexGrow = flexGrow
    }

    public func modify(_ element: ASLayoutElement) -> ASLayoutElement {
        element.style.flexGrow = flexGrow
        return element
    }
}
