//
//  Relative.swift
//
//  Created by Андрей Ведищев on 04.01.2024.
//

import AsyncDisplayKit

public struct Relative: LayoutElement {
    
    private let horizontalPosition: ASRelativeLayoutSpecPosition
    private let verticalPosition: ASRelativeLayoutSpecPosition
    private let sizingOption: ASRelativeLayoutSpecSizingOption
    private let content: LayoutElement
    
    public init(horizontalPosition: ASRelativeLayoutSpecPosition = .start,
                verticalPosition: ASRelativeLayoutSpecPosition = .start,
                sizingOption: ASRelativeLayoutSpecSizingOption = .minimumSize,
                content: () -> LayoutElement) {
        self.horizontalPosition = horizontalPosition
        self.verticalPosition = verticalPosition
        self.sizingOption = sizingOption
        self.content = content()
    }
    
    public func build() -> [ASLayoutElement] {
        content.build().map {
            ASRelativeLayoutSpec(horizontalPosition: horizontalPosition,
                                 verticalPosition: verticalPosition,
                                 sizingOption: sizingOption,
                                 child: $0)
        }
    }
}
