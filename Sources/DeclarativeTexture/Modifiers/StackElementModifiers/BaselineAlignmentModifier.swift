//
//  BaselineAlignmentModifier.swift
//
//  Created by Андрей Ведищев on 04.01.2024.
//

import AsyncDisplayKit

public struct BaselineAlignmentModifier: ElementModifier {
    
    private let ascender: CGFloat?
    private let descender: CGFloat?
    
    init(ascender: CGFloat? = nil,
         descender: CGFloat? = nil) {
        self.ascender = ascender
        self.descender = descender
    }
    
    public func modify(_ element: ASLayoutElement) -> ASLayoutElement {
        ascender.map {
            element.style.ascender = $0
        }
        descender.map {
            element.style.descender = $0
        }
        return element
    }
}
