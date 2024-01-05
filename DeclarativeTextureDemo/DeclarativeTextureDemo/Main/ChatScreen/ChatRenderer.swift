//
//  ChatRenderer.swift
//  DeclarativeTextureDemo
//
//  Created by Андрей Ведищев on 02.01.2024.
//

import AsyncDisplayKit
import DeclarativeTexture

final class ChatRenderer: AutoManageableNode {
    
    private lazy var chatNode = ChatNode()
    private lazy var inputNode = InputNode()
    private lazy var separatorNode = Separator(color: .tertiarySystemBackground, height: 1)
    
    private var isKeyboardVisible = false
    private var keyboardHeight: CGFloat = 0
    private var keyboardManager: KeyboardManager?
    
    override init() {
        super.init()
        keyboardManager = KeyboardManager(delegate: self)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        Layout {
            VStack {
                chatNode
                    .flexGrow(1)
                VStack {
                    separatorNode
                    inputNode
                        .padding([.horizontal], 16)
                        .padding([.vertical], 12)
                }
            }
            .padding(.top, safeAreaInsets.top)
            .padding(.left, safeAreaInsets.left)
            .padding(.right, safeAreaInsets.right)
            .padding(.bottom, isKeyboardVisible ? keyboardHeight : safeAreaInsets.bottom)
        }
    }
    
    override func animateLayoutTransition(_ context: ASContextTransitioning) {
        UIView.animate(withDuration: defaultLayoutTransitionDuration) {
            self.chatNode.frame = context.finalFrame(for: self.chatNode)
            self.separatorNode.frame = context.finalFrame(for: self.separatorNode)
            self.inputNode.frame = context.finalFrame(for: self.inputNode)
        } completion: { finished in
            context.completeTransition(finished)
        }
    }
    
    func set(isKeyboardVisible: Bool,
             _ keyboardHeight: CGFloat = 0,
             _ duration: Double = 0) {
        self.defaultLayoutTransitionDuration = duration
        self.isKeyboardVisible = isKeyboardVisible
        self.keyboardHeight = keyboardHeight
        transitionLayout(withAnimation: true, shouldMeasureAsync: false)
    }
    
    @objc func didTap() {
        view.endEditing(true)
    }
}

extension ChatRenderer: KeyboardManagerDelegate {
    
    func keyboardWillShow(_ keyboard: CGRect) {
        set(isKeyboardVisible: true, keyboard.height)
    }
    
    func keyboardWillHide(_ keyboard: CGRect) {
        set(isKeyboardVisible: false)
    }
}
