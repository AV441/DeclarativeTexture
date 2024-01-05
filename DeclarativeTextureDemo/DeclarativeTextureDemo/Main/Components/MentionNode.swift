//
//  MentionNode.swift
//  DeclarativeTextureDemo
//
//  Created by Андрей Ведищев on 27.12.2023.
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
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        Layout {
            VStack(justifyContent: .spaceBetween) {
                HStack(spacing: 10) {
                    Avatar(type: .basic,
                           size: .S,
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
