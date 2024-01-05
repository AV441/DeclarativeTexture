//
//  ChatCollectionView.swift
//  DeclarativeTextureDemo
//
//  Created by Андрей Ведищев on 03.01.2024.
//

import AsyncDisplayKit
import DeclarativeTexture

final class ChatNode: ASCollectionNode {
    
    typealias DataSource = [ChatCellModel]
    
    private lazy var content: DataSource = mockDataSource()
    
    init() {
        super.init(frame: .zero, collectionViewLayout: Layouts.chatLayout, layoutFacilitator: nil)
        backgroundColor = .systemBackground
        contentInset.top = 14
        inverted = true
        delegate = self
        dataSource = self
    }
}

extension ChatNode: ASCollectionDataSource, ASCollectionDelegate {
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        content.count
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let model = content[indexPath.item]
        return { ChatCell(model) }
    }
}

private extension ChatNode {
    
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
