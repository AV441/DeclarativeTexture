//
//  InputView.swift
//

import AsyncDisplayKit
import DeclarativeTexture

final class InputNode: AutoManageableNode {
    
    private lazy var inputBack: ASDisplayNode = {
        let node = ASDisplayNode()
        node.cornerRadius = 20
        node.backgroundColor = .secondarySystemBackground
        return node
    }()
    private lazy var inputNode: ASEditableTextNode = {
        let node = ASEditableTextNode()
        node.attributedPlaceholderText = .init(string: "Message", attributes: .placeholder)
        node.backgroundColor = .secondarySystemBackground
        node.textView.font = UIFont.Regular.body1
        node.textView.textColor = .label
        node.textView.tintColor = .label
        node.style.maxHeight = .init(unit: .points, value: 120)
        node.delegate = self
        return node
    }()
    private lazy var sendButtonNode: Button = {
        let node = Button(action: #selector(send))
        node.setImage(.init(named: "send"), for: .normal)
        node.backgroundColor = .secondarySystemBackground
        node.tintColor = .tertiaryLabel
        return node
    }()
    
    private var inputHeight: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        Layout {
            HStack(spacing: 10) {
                inputNode
                    .height(inputHeight)
                    .padding(.init(top: 8, left: 16, bottom: 8, right: 16))
                    .background(inputBack)
                    .flexShrink(1)
                    .flexGrow(1)
                sendButtonNode
                    .preferredSize(.init(width: 40, height: 40))
                    .rounded
                    .alignSelf(.end)
            }
        }
    }
}

private extension InputNode {
    
    @objc func send() {}
}

extension InputNode: ASEditableTextNodeDelegate {
    
    func editableTextNodeDidUpdateText(_ editableTextNode: ASEditableTextNode) {
        inputHeight = editableTextNode.textView.contentSize.height
    }
}
