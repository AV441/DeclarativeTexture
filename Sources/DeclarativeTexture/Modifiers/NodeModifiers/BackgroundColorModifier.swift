//
//  BackgroundColorModifier.swift
//

import AsyncDisplayKit

public struct BackgroundColorModifier: ElementModifier {

    private let backgroundColor: UIColor

    public init(_ backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
    }

    public func modify(_ element: ASLayoutElement) -> ASLayoutElement {
        guard let element = element as? ASDisplayNode else { return element }
        element.backgroundColor = backgroundColor
        return element
    }
}
