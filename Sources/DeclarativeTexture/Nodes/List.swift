//
//  List.swift
//

import AsyncDisplayKit

public class List: ASScrollNode {

    public enum Direction {
        
        case vertical
        case horizontal
    }

    private let direction: Direction
    private let spacing: CGFloat
    private var content: [ASDisplayNode] {
        didSet {
            setNeedsLayout()
        }
    }

    public init(_ direction: Direction = .vertical,
                spacing: CGFloat = 0,
                _ content: [ASDisplayNode]) {
        self.direction = direction
        self.spacing = spacing
        self.content = content
        super.init()
        automaticallyManagesSubnodes = true
        automaticallyManagesContentSize = true
        automaticallyRelayoutOnSafeAreaChanges = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        switch direction {
        case .vertical:
            scrollableDirections = [.up, .down]
        case .horizontal:
            scrollableDirections = [.left, .right]
        }
    }

    public func set(_ content: [ASDisplayNode]) {
        self.content = content
    }

    public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        Layout {
            if direction == .vertical {
                VStack(spacing: spacing) {
                    ForEach(content) {
                        $0
                    }
                }
            } else {
                HStack(spacing: spacing) {
                    ForEach(content) {
                        $0
                    }
                }
            }
        }
    }
}
