//
//  FlexBasisModifier.swift
//

import AsyncDisplayKit

public struct FlexBasisModifier: ElementModifier {

    private let flexBasis: ASDimension

    init(flexBasis: ASDimension) {
        self.flexBasis = flexBasis
    }

    public func modify(_ element: ASLayoutElement) -> ASLayoutElement {
        element.style.flexBasis = flexBasis
        return element
    }
}
