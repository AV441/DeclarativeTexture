//
//  ModifiedElement.swift
//
//  Created by Андрей Ведищев on 23.12.2023.
//

import AsyncDisplayKit

public struct ModifiedElement: LayoutElement {
    
    private let element: LayoutElement
    private let modifier: ElementModifier
    
    public init(element: LayoutElement,
                modifier: ElementModifier) {
        self.element = element
        self.modifier = modifier
    }
    
    public func build() -> [ASLayoutElement] {
        element.build().map {
            modifier.modify($0)
        }
    }
}
