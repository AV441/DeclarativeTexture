//
//  LayerBackedModifier.swift
//
//  Created by Андрей Ведищев on 23.12.2023.
//

import AsyncDisplayKit

public struct LayerBackedModifier: ElementModifier {
    
    public func modify(_ element: ASLayoutElement) -> ASLayoutElement {
        guard let element = element as? ASDisplayNode else { return element }
        element.isLayerBacked = true
        return element
    }
}
