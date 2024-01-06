//
//  Edges.swift
//

import UIKit

// MARK: - Edges
public struct Edges: OptionSet {
    
    public static let top = Edges(rawValue: 1)
    public static let left = Edges(rawValue: 1 << 2)
    public static let right = Edges(rawValue: 1 << 3)
    public static let bottom = Edges(rawValue: 1 << 4)

    public static var all: Self {
        [.top, .bottom, .right, left]
    }

    public static var horizontal: Self {
        [.left, .right]
    }

    public static var vertical: Self {
        [.top, .bottom]
    }

    public var rawValue: Int8
    
    public init(rawValue: Int8) {
        self.rawValue = rawValue
    }
}

// MARK: - UIEdgeInsets + Edges
public extension UIEdgeInsets {

    init(_ edges: Edges, _ padding: CGFloat) {
        self.init()

        if edges.contains(.top) {
            self.top = padding
        }

        if edges.contains(.left) {
            self.left = padding
        }

        if edges.contains(.bottom) {
            self.bottom = padding
        }

        if edges.contains(.right) {
            self.right = padding
        }
    }

    init(_ padding: CGFloat) {
        self.init(top: padding,
                  left: padding,
                  bottom: padding,
                  right: padding)
    }
}
