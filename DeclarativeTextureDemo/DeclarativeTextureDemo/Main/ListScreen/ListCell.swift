//
//  Cell.swift
//  DeclarativeTextureDemo
//
//  Created by Андрей Ведищев on 17.12.2023.
//

import AVFoundation
import AsyncDisplayKit
import DeclarativeTexture

final class ListCell: AutoManageableCell {

    private let model: ListCellModel
    
    init(_ model: ListCellModel) {
        self.model = model
        super.init()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        Layout {
            VStack(justifyContent: .spaceBetween) {
                HStack(spacing: 10) {
                    Avatar(type: model.isOnline ? .withOnlineIndicator : .basic,
                           size: .XL,
                           model: model.avatar)
                    .alignSelf(.center)
                    VStack {
                        Text(string: model.name, attributes: .title)
                            .maximumNumberOfLines(1)
                            .layerBacked
                        if !model.position.isEmpty {
                            Text(string: model.position, attributes: .subtitle)
                                .maximumNumberOfLines(1)
                                .layerBacked
                        }
                        HStack(spacing: 4) {
                            Image(named: "mail")
                                .tintColor(.secondaryLabel)
                                .layerBacked
                                .size(.init(width: 17, height: 17))
                                .alignSelf(.center)
                            Text(string: model.email, attributes: .subtitle)
                                .maximumNumberOfLines(1)
                                .layerBacked
                                .flexShrink(1)
                        }
                    }
                    .flexShrink(1)
                }
                Separator(color: .secondarySystemFill)
                    .padding(.left, 66)
            }
            .padding(.init(top: 8, left: 24, bottom: 0, right: 24))
        }
    }
}

#Preview {
    ListViewController()
}
