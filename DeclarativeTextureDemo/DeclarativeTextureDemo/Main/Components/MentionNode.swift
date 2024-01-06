//
//  MentionNode.swift
//

import AsyncDisplayKit
import DeclarativeTexture

final class MentionNode: AutoManageableNode {
    
    struct MentionNodeModel: Identifiable {
        
        let avatar: String
        let name: String
        let email: String
        var id: String { name }
    }
    
    let model: MentionNodeModel
    
    init(model: MentionNodeModel) {
        self.model = model
        super.init()
    }
    
    // swiftlint:disable closure_body_length
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        Layout {
            VStack(justifyContent: .spaceBetween) {
                HStack(spacing: 10) {
                    Avatar(type: .basic,
                           size: .s,
                           model: .init(avatar: model.avatar,
                                        initials: ""))
                    .alignSelf(.center)
                    VStack {
                        Text(string: model.name, attributes: .footnote)
                        HStack(spacing: 4) {
                            Image(named: "mail")
                                .tintColor(.secondaryLabel)
                                .alignSelf(.center)
                                .preferredSize(.init(width: 13, height: 13))
                            Text(string: model.email, attributes: .caption2)
                        }
                    }
                }
                .padding(.top, 3)
                Separator(color: .secondarySystemFill)
                    .padding(.left, 44)
            }
            .height(40)
            .padding(.horizontal, 24)
        }
    }
}
// swiftlint:enable closure_body_length
