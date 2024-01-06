//
//  MessageCell.swift
//

import AsyncDisplayKit
import DeclarativeTexture

final class ChatCell: AutoManageableCell {
    
    private let model: ChatCellModel
    private let isIncomingMessage: Bool
    
    private lazy var timeNode: Text = configureTimeNode()
    private lazy var nameNode: Text? = configureNameNode()
    private lazy var replyNode: Reply? = configureReplyNode()
    private lazy var messageNode: Text = configureMessageNode()
    private lazy var avatarNode: Avatar? = configureAvatarNode()
    private lazy var editingStatusNode: Text? = configureEditingStatusNode()
    private lazy var sendingStatusNode: Image? = configureSendingStatusNode()
    
    init(_ model: ChatCellModel) {
        self.model = model
        self.isIncomingMessage = model.direction == .incoming
        super.init()
    }
    
    // swiftlint:disable closure_body_length
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        Layout {
            HStack {
                if !isIncomingMessage {
                    Spacer()
                        .flexBasis(0.15)
                }
                if let avatarNode {
                    avatarNode
                        .alignSelf(.end)
                        .spacingAfter(4)
                }
                VStack(spacing: 2) {
                    if let replyNode {
                        replyNode
                            .spacingAfter(6)
                    }
                    if let nameNode {
                        nameNode
                    }
                    messageNode
                    HStack(spacing: 4, alignItems: .center) {
                        if let sendingStatusNode {
                            sendingStatusNode
                                .preferredSize(.init(width: 19, height: 19))
                        }
                        if let editingStatusNode {
                            editingStatusNode
                        }
                        timeNode
                    }
                    .alignSelf(.end)
                }
                .padding(.init(top: 10, left: 12, bottom: 8, right: 8))
                .background {
                    Bubble(direction: model.direction,
                           color: isIncomingMessage ? .quaternarySystemFill : .systemBlue.withAlphaComponent(0.2))
                }
                .flexShrink(1)
                if isIncomingMessage {
                    Spacer()
                        .flexBasis(0.15)
                }
            }
            .width(fraction: 1)
            .padding([.left, .right], 16)
        }
    }
}
// swiftlint:enable closure_body_length

private extension ChatCell {
    
    func configureAvatarNode() -> Avatar? {
        guard !model.name.isEmpty else { return nil }
        return Avatar(type: .basic, size: .s, model: model.avatar)
    }
    
    func configureReplyNode() -> Reply? {
        guard let model = model.reply else { return nil }
        return Reply(model: model)
    }
    
    func configureNameNode() -> Text? {
        guard !model.name.isEmpty else { return nil }
        return Text(string: model.name, attributes: .name)
    }
    
    func configureMessageNode() -> Text {
        Text(string: model.message, attributes: .title)
    }
    
    func configureTimeNode() -> Text {
        Text(string: model.time, attributes: .info)
    }
    
    func configureEditingStatusNode() -> Text? {
        guard model.isEdited else { return nil }
        return Text(string: "Edited", attributes: .info)
    }
    
    func configureSendingStatusNode() -> Image? {
        guard !isIncomingMessage else { return nil }
        return Image(named: "status")
    }
}

#Preview {
    UINavigationController(rootViewController: ChatViewController())
}
