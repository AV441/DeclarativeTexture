//
//  HorizontalListNode.swift
//  DeclarativeTextureDemo
//
//  Created by Андрей Ведищев on 30.12.2023.
//

import AsyncDisplayKit
import DeclarativeTexture

final class HorizontalListNode: AutoManageableNode {
    
    private lazy var node = View(backgroundColor: .random)
        
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        Layout {
            node
                .preferredSize(.init(width: 250, height: 150))
                .cornerRadius(20)
                .padding([.top, .bottom], 24)
                .padding([.left, .right], 24)
        }
    }
}
