//
//  FlexShrinkModifier.swift
//

import AsyncDisplayKit

public struct FlexShrinkModifier: ElementModifier {

    private let flexShrink: CGFloat

    init(flexShrink: CGFloat) {
        self.flexShrink = flexShrink
    }

    public func modify(_ element: ASLayoutElement) -> ASLayoutElement {
        element.style.flexShrink = flexShrink
        return element
    }
}
