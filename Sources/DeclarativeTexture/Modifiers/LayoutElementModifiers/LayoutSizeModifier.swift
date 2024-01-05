//
//  LayoutSizeModifier.swift
//
//  Created by Андрей Ведищев on 05.01.2024.
//

import AsyncDisplayKit

public struct LayoutSizeModifier: ElementModifier {
    
    private let maxLayoutSize: ASLayoutSize?
    private let minLayoutSize: ASLayoutSize?
    private let preferredLayoutSize: ASLayoutSize?
    
    init(minLayoutSize: ASLayoutSize? = nil,
         maxLayoutSize: ASLayoutSize? = nil,
         preferredLayoutSize: ASLayoutSize? = nil) {
        self.minLayoutSize = minLayoutSize
        self.maxLayoutSize = maxLayoutSize
        self.preferredLayoutSize = preferredLayoutSize
    }
    
    public func modify(_ element: ASLayoutElement) -> ASLayoutElement {
        minLayoutSize.map {
            element.style.minLayoutSize = $0
        }
        maxLayoutSize.map {
            element.style.maxLayoutSize = $0
        }
        preferredLayoutSize.map {
            element.style.preferredLayoutSize = $0
        }
        return element
    }
}
