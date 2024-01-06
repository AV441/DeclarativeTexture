//
//  MinSizeModifier.swift
//

import AsyncDisplayKit

public struct MinSizeModifier: ElementModifier {

    private let minSize: CGSize?
    private let minWidth: ASDimension?
    private let minHeight: ASDimension?

    init(minSize: CGSize? = nil,
         minWidth: ASDimension? = nil,
         minHeight: ASDimension? = nil) {
        self.minSize = minSize
        self.minWidth = minWidth
        self.minHeight = minHeight
    }

    public func modify(_ element: ASLayoutElement) -> ASLayoutElement {
        minSize.map {
            element.style.minSize = $0
        }
        minWidth.map {
            element.style.minWidth = $0
        }
        minHeight.map {
            element.style.minHeight = $0
        }
        return element
    }
}
