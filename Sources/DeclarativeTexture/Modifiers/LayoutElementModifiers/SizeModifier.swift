//
//  SizeModifier.swift
//

import AsyncDisplayKit

public struct SizeModifier: ElementModifier {

    private let width: ASDimension?
    private let height: ASDimension?
    private let preferredSize: CGSize?

    init(width: ASDimension? = nil,
         height: ASDimension? = nil,
         preferredSize: CGSize? = nil) {
        self.width = width
        self.height = height
        self.preferredSize = preferredSize
    }

    public func modify(_ element: ASLayoutElement) -> ASLayoutElement {
        width.map {
            element.style.width = $0
        }
        height.map {
            element.style.height = $0
        }
        preferredSize.map {
            element.style.preferredSize = $0
        }
        return element
    }
}
