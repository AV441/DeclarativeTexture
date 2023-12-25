//
//  AlignSelfModifier.swift
//
//
//  Created by Андрей Ведищев on 18.12.2023.
//

import AsyncDisplayKit

public struct AlignSelfModifier: ElementModifier {
    
    private let alignSelf: ASStackLayoutAlignSelf
    
    public init(alignSelf: ASStackLayoutAlignSelf) {
        self.alignSelf = alignSelf
    }
    
    public func modify(_ element: ASLayoutElement) -> ASLayoutElement {
        element.style.alignSelf = alignSelf
        return element
    }
}
