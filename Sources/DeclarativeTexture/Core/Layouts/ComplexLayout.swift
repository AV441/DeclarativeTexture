//
//  MultiLayout.swift
//
//  Created by Андрей Ведищев on 17.12.2023.
//

import AsyncDisplayKit

public struct ComplexLayout: LayoutElement {
    
    let elements: [LayoutElement?]
    
    public init(_ elements: [LayoutElement?]) {
        self.elements = elements
    }
    
    public func build() -> [ASLayoutElement] {
        elements
            .compactMap { $0 }
            .flatMap { $0.build() }
    }
}
