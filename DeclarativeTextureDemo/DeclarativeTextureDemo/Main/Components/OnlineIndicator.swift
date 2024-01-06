//
//  OnlineIndicator.swift
//

import AsyncDisplayKit
import DeclarativeTexture

final class OnlineIndicator: AutoManageableNode, SizableComponent {
    
    var size: ComponentSize
    
    var innerSize: CGSize {
        switch size {
        case .xs:
                .init(width: 6, height: 6)
        case .s:
                .init(width: 8, height: 8)
        case .m:
                .init(width: 8, height: 8)
        case .l:
                .init(width: 8, height: 8)
        case .xl:
                .init(width: 10, height: 10)
        case .xxl:
                .init(width: 10, height: 10)
        }
    }
    
    var outerSize: CGSize {
        switch size {
        case .xs:
                .init(width: 10, height: 10)
        case .s:
                .init(width: 12, height: 12)
        case .m:
                .init(width: 12, height: 12)
        case .l:
                .init(width: 12, height: 12)
        case .xl:
                .init(width: 14, height: 14)
        case .xxl:
                .init(width: 14, height: 14)
        }
    }
    
    private let primaryColor: UIColor
    private let strokeColor: UIColor
    private lazy var backgroundNode = View(backgroundColor: strokeColor)
    private lazy var overlayNode = View(backgroundColor: primaryColor)
    
    init(size: ComponentSize,
         primaryColor: UIColor,
         strokeColor: UIColor) {
        self.size = size
        self.primaryColor = primaryColor
        self.strokeColor = strokeColor
        super.init()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        Layout {
            backgroundNode
                .preferredSize(outerSize)
                .rounded
                .overlay {
                    overlayNode
                        .preferredSize(innerSize)
                        .rounded
                        .center()
                }
        }
    }
}
