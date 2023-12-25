//
//  MessageCell.swift
//  DeclarativeTextureDemo
//
//  Created by Андрей Ведищев on 20.12.2023.
//

import AsyncDisplayKit
import DeclarativeTexture

final class ChatCell: AutoManageableCell {
    
    private let model: ChatCellModel
    private let isIncoming: Bool
    
    init(_ model: ChatCellModel) {
        self.model = model
        self.isIncoming = model.direction == .incoming
        super.init()
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        Layout {
            HStack {
                if !isIncoming {
                    Spacer()
                        .flexBasis(fraction: 0.15)
                }
                if !model.name.isEmpty {
                    Avatar(type: .basic,
                           size: .S,
                           model: model.avatar)
                    .alignSelf(.end)
                    .spacingAfter(4)
                }
                VStack(spacing: 2) {
                    if let reply = model.reply {
                        HStack(spacing: 12) {
                            View(backgroundColor: .systemTeal)
                                .width(1)
                            VStack(spacing: 2) {
                                Text(string: reply.name, attributes: .reply)
                                Text(string: reply.message, attributes: .subtitle)
                            }
                            .flexShrink(1)
                        }
                        .spacingAfter(6)
                    }
                    if !model.name.isEmpty {
                        Text(string: model.name, attributes: .name)
                    }
                    Text(string: model.message, attributes: .title)
                    HStack(spacing: 4, alignItems: .center) {
                        if !isIncoming {
                            Image(named: "status")
                                .size(.init(width: 19, height: 19))
                        }
                        if model.isEdited {
                            Text(string: "Edited", attributes: .info)
                        }
                        Text(string: model.time, attributes: .info)
                    }
                    .alignSelf(.end)
                }
                .padding(UIEdgeInsets(top: 10, left: 12, bottom: 8, right: 8))
                .background {
                    Bubble(direction: model.direction,
                           color: isIncoming ? .quaternarySystemFill : .systemBlue.withAlphaComponent(0.2))
                }
                .flexShrink(1)
                if isIncoming {
                    Spacer()
                        .flexBasis(fraction: 0.15)
                }
            }
            .width(fraction: 1)
            .padding([.left, .right], 16)
        }
    }
}

#Preview {
    ChatViewController()
}
