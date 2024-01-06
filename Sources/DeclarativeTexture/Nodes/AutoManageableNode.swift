//
//  AutoManageableNode.swift
//

import AsyncDisplayKit

open class AutoManageableNode: ASDisplayNode {

    public override init() {
        super.init()
        automaticallyManagesSubnodes = true
        automaticallyRelayoutOnSafeAreaChanges = true
        automaticallyRelayoutOnLayoutMarginsChanges = true
    }
}
