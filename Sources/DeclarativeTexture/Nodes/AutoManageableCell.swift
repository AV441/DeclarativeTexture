//
//  AutoManageableCell.swift
//

import AsyncDisplayKit

open class AutoManageableCell: ASCellNode {

    public override init() {
        super.init()
        automaticallyManagesSubnodes = true
        automaticallyRelayoutOnSafeAreaChanges = true
        automaticallyRelayoutOnLayoutMarginsChanges = true
    }
}
