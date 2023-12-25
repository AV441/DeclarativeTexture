//
//  OnlineIndicator.swift
//  DeclarativeTextureDemo
//
//  Created by Андрей Ведищев on 25.12.2023.
//

import AsyncDisplayKit
import DeclarativeTexture

final class OnlineIndicator: AutoManageableNode, SizableComponent {
    
    var size: ComponentSize
    
    private let primaryColor: UIColor
    private let strokeColor: UIColor
    
    init(size: ComponentSize,
         primaryColor: UIColor,
         strokeColor: UIColor) {
        self.size = size
        self.primaryColor = primaryColor
        self.strokeColor = strokeColor
        super.init()
    }
    
    var innerSize: CGSize {
        switch size {
        case .XS:
                .init(width: 6, height: 6)
        case .S:
                .init(width: 8, height: 8)
        case .M:
                .init(width: 8, height: 8)
        case .L:
                .init(width: 8, height: 8)
        case .XL:
                .init(width: 10, height: 10)
        case .XXL:
                .init(width: 10, height: 10)
        }
    }
    
    var outerSize: CGSize {
        switch size {
        case .XS:
                .init(width: 10, height: 10)
        case .S:
                .init(width: 12, height: 12)
        case .M:
                .init(width: 12, height: 12)
        case .L:
                .init(width: 12, height: 12)
        case .XL:
                .init(width: 14, height: 14)
        case .XXL:
                .init(width: 14, height: 14)
        }
    }
    
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        Layout {
            View(backgroundColor: strokeColor)
                .size(outerSize)
                .rounded
                .overlay {
                    View(backgroundColor: primaryColor)
                        .size(innerSize)
                        .rounded
                        .center()
                }
        }
    }
}
