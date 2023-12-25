//
//  ViewController.swift
//  DeclarativeTextureDemo
//
//  Created by Андрей Ведищев on 17.12.2023.
//

import AsyncDisplayKit

final class ListViewController: ASDKViewController<ASCollectionNode> {
    
    typealias DataSource = [ListCellModel]
    
    private lazy var dataSource: DataSource = mockDataSource()

    override init() {
        super.init(node: .init(collectionViewLayout: Layouts.contactsList))
        navigationItem.title = "Contacts"
        navigationItem.backButtonTitle = ""
        node.backgroundColor = .systemBackground
        node.dataSource = self
        node.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListViewController: ASCollectionDataSource, ASCollectionDelegate {
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let model = dataSource[indexPath.item]
        return { ListCell(model) }
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, didSelectItemAt indexPath: IndexPath) {
        show(ChatViewController(), sender: nil)
    }
}

private extension ListViewController {
        
    func mockDataSource() -> DataSource {
        var dataSource = DataSource()
        (0...30).forEach { i in
            dataSource.append(.init(avatar: .init(avatar: (i % 2 == 0) ? "avatar" : nil, initials: "TU"),
                                    name: "Test User",
                                    email: "test_user@example.com",
                                    position: "User position",
                                    isOnline: (i % 3 == 0) ? true : false))
        }
        return dataSource
    }
}

#Preview {
    ListViewController()
}
