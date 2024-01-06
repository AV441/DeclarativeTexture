//
//  Avatar.swift
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
        case .xs:
                .init(width: 24, height: 24)
        case .s:
                .init(width: 32, height: 32)
        case .m:
                .init(width: 38, height: 38)
        case .l:
                .init(width: 48, height: 48)
        case .xl:
                .init(width: 56, height: 56)
        case .xxl:
                .init(width: 96, height: 96)
        }
    }
    
    var cornerOffset: CGPoint {
        switch size {
        case .xs:
                .init(x: -3, y: 3)
        case .s:
                .init(x: -4, y: 4)
        case .m:
                .init(x: -6, y: 6)
        case .l:
                .init(x: -7, y: 7)
        case .xl:
                .init(x: -8, y: 8)
        case .xxl:
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
                .preferredSize(componentSize)
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
