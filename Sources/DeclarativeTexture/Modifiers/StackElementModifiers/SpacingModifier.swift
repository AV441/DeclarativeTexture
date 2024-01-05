//
//  SpacingModifier.swift
//
//  Created by Андрей Ведищев on 19.12.2023.
//

import AsyncDisplayKit

public struct SpacingModifier: ElementModifier {
    
    private let after: CGFloat?
    private let before: CGFloat?
    
    init(after: CGFloat? = nil,
         before: CGFloat? = nil) {
        self.after = after
        self.before = before
    }
    
    public func modify(_ element: ASLayoutElement) -> ASLayoutElement {
        after.map {
            element.style.spacingAfter = $0
        }
        before.map {
            element.style.spacingBefore = $0
        }
        return element
    }
}
