//
//  DetailsViewController.swift
//

import AsyncDisplayKit
import DeclarativeTexture

final class ChatViewController: ASDKViewController<ChatRenderer> {
    
    override init() {
        super.init(node: ChatRenderer())
        navigationItem.title = "Chat"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    UINavigationController(rootViewController: ChatViewController())
}
