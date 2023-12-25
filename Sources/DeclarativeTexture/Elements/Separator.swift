//
//  Separator.swift
//
//  Created by Андрей Ведищев on 18.12.2023.
//

import AsyncDisplayKit

public struct Separator: LayoutElement {
    
    private let element = ASDisplayNode()
    
    public init(color: UIColor,
                height: CGFloat = 1) {
        element.style.height = .init(unit: .points, value: height)
        element.backgroundColor = color
    }
    
    public func build() -> [ASLayoutElement] {
        [element]
    }
}
