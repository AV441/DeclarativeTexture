//
//  TintColorModifier.swift
//

import AsyncDisplayKit

public struct TintColorModifier: ElementModifier {

    private let tintColor: UIColor

    public init(_ tintColor: UIColor) {
        self.tintColor = tintColor
    }

    public func modify(_ element: ASLayoutElement) -> ASLayoutElement {
        guard let element = element as? ASDisplayNode else { return element }
        element.tintColor = tintColor
        return element
    }
}
