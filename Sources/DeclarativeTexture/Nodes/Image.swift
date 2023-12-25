//
//  Image.swift
//
//  Created by Андрей Ведищев on 19.12.2023.
//

import AsyncDisplayKit

public final class Image: ASImageNode {
    
    public override init() {
        super.init()
    }
    
    public init(_ block: @escaping (Image) -> Void) {
        super.init()
        block(self)
    }
    
    public init(systemName: String) {
        super.init()
        if !systemName.isEmpty, let image = UIImage(systemName: systemName) {
            self.image = image
        } else {
            self.image = nil
        }
    }
    
    public init(named name: String) {
        super.init()
        if !name.isEmpty, let image = UIImage(named: name) {
            self.image = image
        } else {
            self.image = nil
        }
    }
    
    public init(contentsOfFile path: String) {
        super.init()
        if !path.isEmpty, let image = UIImage(contentsOfFile: path) {
            self.image = image
        } else {
            self.image = nil
        }
    }
}
