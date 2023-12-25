//
//  Spacer.swift
//
//  Created by Андрей Ведищев on 18.12.2023.
//

import AsyncDisplayKit

public struct Spacer: LayoutElement {
    
    private let element = ASLayoutSpec()
    
    public init(minLength: CGFloat = 0,
                flexGrow: CGFloat = 1) {
        element.style.spacingBefore = minLength
        element.style.flexGrow = flexGrow
    }
    
    public func build() -> [ASLayoutElement] {
        [element]
    }
}
