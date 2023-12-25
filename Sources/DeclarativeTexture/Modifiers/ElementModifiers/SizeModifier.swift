//
//  SizeModifier.swift
//
//  Created by Андрей Ведищев on 18.12.2023.
//

import AsyncDisplayKit

public struct SizeModifier: ElementModifier {
    
    private let width: ASDimension?
    private let height: ASDimension?
    
    public init(size: CGSize) {
        self.width = .init(unit: .points, value: size.width)
        self.height = .init(unit: .points, value: size.height)
    }
    
    public init(width: ASDimension?, height: ASDimension?) {
        self.width = width
        self.height = height
    }
    
    public func modify(_ element: ASLayoutElement) -> ASLayoutElement {
        width.map { element.style.width = $0 }
        height.map { element.style.height = $0 }
        return element
    }
}
