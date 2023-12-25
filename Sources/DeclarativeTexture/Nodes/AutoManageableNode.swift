//
//  AutoManageableNode.swift
//
//  Created by Андрей Ведищев on 24.12.2023.
//

import AsyncDisplayKit

open class AutoManageableNode: ASDisplayNode {
    
    public override init() {
        super.init()
        automaticallyManagesSubnodes = true
    }
}
