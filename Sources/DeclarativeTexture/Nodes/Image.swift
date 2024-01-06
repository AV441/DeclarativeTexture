//
//  Image.swift
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
    
    // swiftlint:disable swiftgen_images
    public init(named name: String) {
        super.init()
        if !name.isEmpty, let image = UIImage(named: name) {
            self.image = image
        } else {
            self.image = nil
        }
    }
    // swiftlint:enable swiftgen_images
    
    public init(contentsOfFile path: String) {
        super.init()
        if !path.isEmpty, let image = UIImage(contentsOfFile: path) {
            self.image = image
        } else {
            self.image = nil
        }
    }
}
