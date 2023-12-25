//
//  LayoutElement.swift
//
//  Created by Андрей Ведищев on 17.12.2023.
//

import AsyncDisplayKit

/// Протокол описывающий поведение базового элемента лэйаута
public protocol LayoutElement {
    
    /// <#Description#>
    /// - Returns: <#description#>
    func build() -> [ASLayoutElement]
}

// MARK: - LayoutElement + Modifier
public extension LayoutElement {
    
    func set(_ modifier: ElementModifier) -> ModifiedElement {
        ModifiedElement(element: self, modifier: modifier)
    }
}

// MARK: - LayoutElement + Apply
public extension LayoutElement {
    
    @discardableResult
    func apply(_ block: @escaping (Self) -> Void) -> Self {
        block(self)
        return self
    }
}
