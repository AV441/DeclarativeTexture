//
//  Reply.swift
//  DeclarativeTextureDemo
//
//  Created by Андрей Ведищев on 05.01.2024.
//

import AsyncDisplayKit
import DeclarativeTexture

final class Reply: AutoManageableNode {
    
    struct Model {
        
        let name: String
        let message: String
    }
    
    private let model: Model
    
    init(model: Model) {
        self.model = model
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        Layout {
            HStack(spacing: 12) {
                View(backgroundColor: .systemTeal)
                    .width(1)
                VStack(spacing: 2) {
                    Text(string: model.name, attributes: .reply)
                    Text(string: model.message, attributes: .subtitle)
                }
                .flexShrink(1)
            }
        }
    }
}
