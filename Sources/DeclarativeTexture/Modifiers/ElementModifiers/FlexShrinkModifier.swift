//
//  FlexShrinkModifier.swift
//
//  Created by Андрей Ведищев on 19.12.2023.
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
