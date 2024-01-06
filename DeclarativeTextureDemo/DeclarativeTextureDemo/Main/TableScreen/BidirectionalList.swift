//
//  BidirectionalList.swift
//

import AsyncDisplayKit
import DeclarativeTexture

final class BidirectionalViewController: ASDKViewController<AutoManageableNode> {
    
    private lazy var horizontalContent = [HorizontalListNode(), HorizontalListNode()] {
        didSet {
            horizontalList.set(horizontalContent)
            if oldValue.isEmpty {
                verticalContent.insert(horizontalList, at: 0)
            } else if horizontalContent.isEmpty {
                verticalContent.removeFirst()
            }
        }
    }
    private lazy var verticalContent = [horizontalList, VerticalListNode()] {
        didSet {
            verticalList.set(verticalContent)
        }
    }
    private lazy var horizontalList = List(.horizontal,
                                           spacing: -38,
                                           horizontalContent)
    private lazy var verticalList = List(spacing: 10,
                                         verticalContent)
    
    private lazy var plusVButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: .init(systemName: "rectangle.stack.fill.badge.plus"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(addVerticalItem))
        button.tintColor = .label
        return button
    }()
    private lazy var plusHButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: .init(systemName: "rectangle.fill.badge.plus"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(addHorizontalItem))
        button.tintColor = .label
        return button
    }()
    private lazy var minusVButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: .init(systemName: "rectangle.stack.fill.badge.minus"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(removeVerticalItem))
        button.tintColor = .label
        return button
    }()
    private lazy var minusHButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: .init(systemName: "rectangle.fill.badge.minus"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(removeHorizontalItem))
        button.tintColor = .label
        return button
    }()
    
    override init() {
        super.init(node: AutoManageableNode())
        navigationItem.title = "Colors"
        navigationItem.rightBarButtonItems = [plusHButton, minusHButton]
        navigationItem.leftBarButtonItems = [minusVButton, plusVButton]
        node.layoutSpecBlock = { [weak self] (_, constrainedSize) -> ASLayoutSpec in
            self?.layoutSpecThatFits(constrainedSize) ?? ASLayoutSpec()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        Layout {
            verticalList
                .padding(node.safeAreaInsets)
        }
    }
}

extension BidirectionalViewController {
    
    @objc func addVerticalItem() {
        verticalContent.append(VerticalListNode())
    }
    
    @objc func addHorizontalItem() {
        horizontalContent.append(HorizontalListNode())
    }
    
    @objc func removeVerticalItem() {
        guard verticalContent.count != 1 else { return }
        verticalContent.removeLast()
    }
    
    @objc func removeHorizontalItem() {
        guard !horizontalContent.isEmpty else { return }
        horizontalContent.removeLast()
    }
}

#Preview {
    ASDKNavigationController(rootViewController: BidirectionalViewController())
}
