//
//  VerticalListNode.swift
//

import AsyncDisplayKit
import DeclarativeTexture

final class VerticalListNode: AutoManageableNode {
    
    private lazy var node = View(backgroundColor: .random)
        
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        Layout {
            node
                .preferredSize(.init(width: 300, height: 40))
                .cornerRadius(10)
                .padding([.left, .right], 24)
        }
    }
}
