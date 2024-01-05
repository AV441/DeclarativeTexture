//
//  Button.swift
//
//  Created by Андрей Ведищев on 26.12.2023.
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
