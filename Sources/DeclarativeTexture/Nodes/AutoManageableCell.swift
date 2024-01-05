//
//  AutoManageableCell.swift
//
//  Created by Андрей Ведищев on 25.12.2023.
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
