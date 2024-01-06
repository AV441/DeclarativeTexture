//
//  MaxSizeModifier.swift
//

import AsyncDisplayKit

public struct MaxSizeModifier: ElementModifier {

    private let maxSize: CGSize?
    private let maxWidth: ASDimension?
    private let maxHeight: ASDimension?

    init(maxSize: CGSize? = nil,
         maxWidth: ASDimension? = nil,
         maxHeight: ASDimension? = nil) {
        self.maxSize = maxSize
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
    }

    public func modify(_ element: ASLayoutElement) -> ASLayoutElement {
        maxSize.map {
            element.style.maxSize = $0
        }
        maxWidth.map {
            element.style.maxWidth = $0
        }
        maxHeight.map {
            element.style.maxHeight = $0
        }
        return element
    }
}
