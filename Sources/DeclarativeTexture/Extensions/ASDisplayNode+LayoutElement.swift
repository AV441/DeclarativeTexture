//
//  ASDisplayNode+LayoutElement.swift
//

import AsyncDisplayKit

extension ASDisplayNode: LayoutElement {

    public func build() -> [ASLayoutElement] {
        [self]
    }
}
