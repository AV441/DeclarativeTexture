//
//  DetailsViewController.swift
//  DeclarativeTextureDemo
//
//  Created by Андрей Ведищев on 20.12.2023.
//

import AsyncDisplayKit
import DeclarativeTexture

final class ChatViewController: ASDKViewController<ASCollectionNode> {
    
    typealias DataSource = [ChatCellModel]
    
    private lazy var dataSource: DataSource = mockDataSource()
    
    override init() {
        super.init(node: .init(collectionViewLayout: Layouts.chatLayout))
        navigationItem.title = "Chat"
        node.backgroundColor = .systemBackground
        node.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChatViewController: ASCollectionDataSource {
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let model = dataSource[indexPath.item]
        return { ChatCell(model) }
    }
}

private extension ChatViewController {
  
    func mockDataSource() -> DataSource {
        var dataSource = DataSource()
        (0...30).forEach { i in
            dataSource.append(.init(
                reply: (i % 2 != 0) ? .init(name: "Test User",
                                            message: "Some message to reply on that contains readable content.") : nil,
                avatar: .init(avatar: (i % 2 != 0) ? nil : "avatar", initials: "TU"),
                name: (i % 2 == 0) ? "Test User" : "",
                message: (i % 2 != 0) ? "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout." :
                    "Some message to reply on that contains readable content.",
                time: "14:10 ",
                isEdited: (i % 3 == 0) ? true : false,
                direction: (i % 2 == 0) ? .incoming : .outgoing))
        }
        return dataSource
    }
}

#Preview {
    ChatViewController()
}
