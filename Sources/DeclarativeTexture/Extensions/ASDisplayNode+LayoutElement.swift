//
//  ASDisplayNode+LayoutElement.swift
//
//  Created by Андрей Ведищев on 17.12.2023.
//

import AsyncDisplayKit

extension ASDisplayNode: LayoutElement {
    
    public func build() -> [ASLayoutElement] {
        [self]
    }
}
