//
//  Bubble.swift
//  DeclarativeTextureDemo
//
//  Created by Андрей Ведищев on 25.12.2023.
//

import AsyncDisplayKit
import DeclarativeTexture

final class Bubble: AutoManageableNode {
    
    private let direction: Direction
    private let color: UIColor
    
    init(direction: Direction, color: UIColor) {
        self.direction = direction
        self.color = color
        super.init()
        backgroundColor = color
    }
    
    override func layout() {
        super.layout()
        let maskLayer = CAShapeLayer()
        maskLayer.path = createVisiblePath().cgPath
        layer.mask = maskLayer
    }
    
    func createVisiblePath() -> UIBezierPath {
        switch direction {
        case .incoming:
                .init(incomingBubble: bounds)
        case .outgoing:
                .init(outgoingBubble: bounds)
        }
    }
}

private extension UIBezierPath {
    
    convenience init(incomingBubble rect: CGRect) {
        self.init()
        let width = rect.width
        let height = rect.height
        move(to: CGPoint(x: 25, y: height))
        addLine(to: CGPoint(x: width - 20, y: height))
        addCurve(to: CGPoint(x: width, y: height - 20),
                 controlPoint1: CGPoint(x: width - 8, y: height),
                 controlPoint2: CGPoint(x: width, y: height - 8))
        addLine(to: CGPoint(x: width, y: 20))
        addCurve(to: CGPoint(x: width - 20, y: 0),
                 controlPoint1: CGPoint(x: width, y: 8),
                 controlPoint2: CGPoint(x: width - 8, y: 0))
        addLine(to: CGPoint(x: 21, y: 0))
        addCurve(to: CGPoint(x: 4, y: 20),
                 controlPoint1: CGPoint(x: 12, y: 0),
                 controlPoint2: CGPoint(x: 4, y: 8))
        addLine(to: CGPoint(x: 4, y: height - 11))
        addCurve(to: CGPoint(x: 0, y: height),
                 controlPoint1: CGPoint(x: 4, y: height - 1),
                 controlPoint2: CGPoint(x: 0, y: height))
        addLine(to: CGPoint(x: -0.05, y: height - 0.01))
        addCurve(to: CGPoint(x: 11.0, y: height - 4.0),
                 controlPoint1: CGPoint(x: 4.0, y: height + 0.5),
                 controlPoint2: CGPoint(x: 8, y: height - 1))
        addCurve(to: CGPoint(x: 25, y: height),
                   controlPoint1: CGPoint(x: 16, y: height),
                   controlPoint2: CGPoint(x: 20, y: height))
    }
    
    convenience init(outgoingBubble rect: CGRect) {
        self.init()
        let width = rect.width
        let height = rect.height
        move(to: CGPoint(x: 25, y: height))
        addLine(to: CGPoint(x:  20, y: height))
        addCurve(to: CGPoint(x: 0, y: height - 20),
                 controlPoint1: CGPoint(x: 8, y: height),
                 controlPoint2: CGPoint(x: 0, y: height - 8))
        addLine(to: CGPoint(x: 0, y: 20))
        addCurve(to: CGPoint(x: 20, y: 0),
                 controlPoint1: CGPoint(x: 0, y: 8),
                 controlPoint2: CGPoint(x: 8, y: 0))
        addLine(to: CGPoint(x: width - 21, y: 0))
        addCurve(to: CGPoint(x: width - 4, y: 20),
                 controlPoint1: CGPoint(x: width - 12, y: 0),
                 controlPoint2: CGPoint(x: width - 4, y: 8))
        addLine(to: CGPoint(x: width - 4, y: height - 11))
        addCurve(to: CGPoint(x: width, y: height),
                 controlPoint1: CGPoint(x: width - 4, y: height - 1),
                 controlPoint2: CGPoint(x: width, y: height))
        addLine(to: CGPoint(x: width + 0.05, y: height - 0.01))
        addCurve(to: CGPoint(x: width - 11, y: height - 4),
                 controlPoint1: CGPoint(x: width - 4, y: height + 0.5),
                 controlPoint2: CGPoint(x: width - 8, y: height - 1))
        addCurve(to: CGPoint(x: width - 25, y: height),
                 controlPoint1: CGPoint(x: width - 16, y: height),
                 controlPoint2: CGPoint(x: width - 20, y: height))
    }
}
