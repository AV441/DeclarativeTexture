//
//  Avatar.swift
//  DeclarativeTextureDemo
//
//  Created by Андрей Ведищев on 19.12.2023.
//

import AsyncDisplayKit
import DeclarativeTexture

final class Avatar: AutoManageableNode, SizableComponent {
    
    enum AvatarType {
        
        case basic
        case withOnlineIndicator
    }
    
    struct Model {
        
        let avatar: String?
        let initials: String
    }
    
    var size: ComponentSize
    
    private let type: AvatarType
    private let model: Model
    
    var componentSize: CGSize {
        switch size {
        case .XS:
                .init(width: 24, height: 24)
        case .S:
                .init(width: 32, height: 32)
        case .M:
                .init(width: 38, height: 38)
        case .L:
                .init(width: 48, height: 48)
        case .XL:
                .init(width: 56, height: 56)
        case .XXL:
                .init(width: 96, height: 96)
        }
    }
    
    var cornerOffset: CGPoint {
        switch size {
        case .XS:
                .init(x: -3, y: 3)
        case .S:
                .init(x: -4, y: 4)
        case .M:
                .init(x: -6, y: 6)
        case .L:
                .init(x: -7, y: 7)
        case .XL:
                .init(x: -8, y: 8)
        case .XXL:
                .init(x: -8, y: 8)
        }
    }
    
    init(type: AvatarType,
         size: ComponentSize,
         model: Model) {
        self.type = type
        self.size = size
        self.model = model
        super.init()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        Layout {
            Image(named: model.avatar ?? "")
                .backgroundColor(.secondarySystemFill)
                .size(componentSize)
                .rounded
                .overlay {
                    if model.avatar == nil {
                        Text(string: model.initials, attributes: .headline)
                            .center()
                    }
                }
                .corner(offset: cornerOffset) {
                    if type == .withOnlineIndicator {
                        OnlineIndicator(size: size,
                                        primaryColor: .systemGreen,
                                        strokeColor: .systemBackground)
                    }
                }
        }
    }
}
