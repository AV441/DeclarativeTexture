//
//  Layouts.swift
//  DeclarativeTextureDemo
//
//  Created by Андрей Ведищев on 18.12.2023.
//

import UIKit

enum Layouts {
    
    static var chatLayout = UICollectionViewFlowLayout()
    
    static var contactsList: UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(80))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return .init(section: section)
    }
}
