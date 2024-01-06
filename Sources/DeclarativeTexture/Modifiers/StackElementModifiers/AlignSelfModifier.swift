//
//  AlignSelfModifier.swift
//

import AsyncDisplayKit

public struct AlignSelfModifier: ElementModifier {

    private let alignSelf: ASStackLayoutAlignSelf

    init(alignSelf: ASStackLayoutAlignSelf) {
        self.alignSelf = alignSelf
    }

    public func modify(_ element: ASLayoutElement) -> ASLayoutElement {
        element.style.alignSelf = alignSelf
        return element
    }
}
