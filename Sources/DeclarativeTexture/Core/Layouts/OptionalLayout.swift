//
//  OptionalLayout.swift
//
//  Created by Андрей Ведищев on 17.12.2023.
//

import AsyncDisplayKit

public struct OptionalLayout<Content: LayoutElement>: LayoutElement {
    
    private let content: Content?
    
    init(content: () -> Content?) {
        self.content = content()
    }
    
    public func build() -> [ASLayoutElement] {
        content?.build() ?? []
    }
}
