//
//  Button.swift
//

import AsyncDisplayKit

public class Button: ASButtonNode {

    public init(target: Any? = nil,
                action: Selector,
                forControlEvents: ASControlNodeEvent = .touchUpInside) {
        super.init()
        addTarget(target, action: action, forControlEvents: forControlEvents)
    }
}
