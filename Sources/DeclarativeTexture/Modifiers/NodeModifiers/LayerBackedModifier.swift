//
//  LayerBackedModifier.swift
//

import AsyncDisplayKit

public struct LayerBackedModifier: ElementModifier {

    public func modify(_ element: ASLayoutElement) -> ASLayoutElement {
        guard let element = element as? ASDisplayNode else { return element }
        element.isLayerBacked = true
        return element
    }
}
