//
//  Separator.swift
//

import AsyncDisplayKit

public class Separator: ASDisplayNode {

    public init(color: UIColor,
                height: CGFloat = 1) {
        super.init()
        self.style.height = .init(unit: .points, value: height)
        self.backgroundColor = color
    }
}
