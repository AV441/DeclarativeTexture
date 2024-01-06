//
//  ElementModifier.swift
//

import AsyncDisplayKit

/// Протокол определяющий поведение модификатора элемента
public protocol ElementModifier {

    /// Модифицировать переданный элемент
    /// - Parameter element: Элемент к которому применяется модификатор `ASLayoutElement`
    /// - Returns: Возвращает модифицированый элемент `ASLayoutElement`
    func modify(_ element: ASLayoutElement) -> ASLayoutElement
}
