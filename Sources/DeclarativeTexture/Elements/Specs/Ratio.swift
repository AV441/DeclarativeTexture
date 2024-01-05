//
//  Ratio.swift
//
//  Created by Андрей Ведищев on 04.01.2024.
//

import AsyncDisplayKit

public struct Ratio: LayoutElement {
    
    private let ratio: CGFloat
    private let content: LayoutElement
    
    public init(ratio: CGFloat,
                content: () -> LayoutElement) {
        self.ratio = ratio
        self.content = content()
    }
    
    public func build() -> [ASLayoutElement] {
        content.build().map {
            ASRatioLayoutSpec(ratio: ratio, child: $0)
        }
    }
}
