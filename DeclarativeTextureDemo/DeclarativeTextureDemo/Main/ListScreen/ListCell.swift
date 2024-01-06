//
//  Cell.swift
//

import AsyncDisplayKit
import AVFoundation
import DeclarativeTexture

final class ListCell: AutoManageableCell {

    private let model: ListCellModel
    
    private lazy var avatar = Avatar(type: model.isOnline ? .withOnlineIndicator : .basic,
                                     size: .xl,
                                     model: model.avatar)
    private lazy var nameNode = Text(string: model.name, attributes: .title)
        .maximumNumberOfLines(1)
        .layerBacked
    private lazy var positionNode = Text(string: model.position, attributes: .subtitle)
        .maximumNumberOfLines(1)
        .layerBacked
    private lazy var emailNode = Text(string: model.email, attributes: .subtitle)
        .maximumNumberOfLines(1)
        .layerBacked
    private lazy var emailIcon = Image(named: "mail")
        .tintColor(.secondaryLabel)
        .layerBacked
    private lazy var separator = Separator(color: .secondarySystemFill)
    
    init(_ model: ListCellModel) {
        self.model = model
        super.init()
    }
    
    // swiftlint:disable closure_body_length
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        Layout {
            VStack(justifyContent: .spaceBetween) {
                HStack(spacing: 10) {
                    avatar
                        .alignSelf(.center)
                    VStack {
                        nameNode
                        if !model.position.isEmpty {
                            positionNode
                        }
                        HStack(spacing: 4) {
                            emailIcon
                                .preferredSize(.init(width: 17, height: 17))
                                .alignSelf(.center)
                            emailNode
                                .flexShrink(1)
                        }
                    }
                    .flexShrink(1)
                }
                separator
                    .padding(.left, 66)
            }
            .padding(.init(top: 8, left: 24, bottom: 0, right: 24))
        }
    }
}
// swiftlint:enable closure_body_length

#Preview {
    UINavigationController(rootViewController: ListViewController())
}
