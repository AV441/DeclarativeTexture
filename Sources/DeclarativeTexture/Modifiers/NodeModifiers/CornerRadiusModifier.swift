//
//  CornerRadiusModifier.swift
//

import AsyncDisplayKit

public struct RoundedModifier: ElementModifier {

    public func modify(_ element: ASLayoutElement) -> ASLayoutElement {
        guard let element = element as? ASDisplayNode else { return element }
        element.cornerRadius = element.style.width.value / 2
        return element
    }
}

public struct CornerRadiusModifier: ElementModifier {

    private var cornerRadius: CGFloat

    public init(cornerRadius: CGFloat) {
        self.cornerRadius = cornerRadius
    }

    public func modify(_ element: ASLayoutElement) -> ASLayoutElement {
        guard let element = element as? ASDisplayNode else { return element }
        element.cornerRadius = cornerRadius
        return element
    }
}
