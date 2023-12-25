//
//  Text.swift
//
//
//  Created by Андрей Ведищев on 19.12.2023.
//

import AsyncDisplayKit

public final class Text: ASTextNode {
    
    public init(string: String,
                attributes: [NSAttributedString.Key: Any]? = nil) {
        super.init()
        self.attributedText = .init(string: string, attributes: attributes)
        self.truncationMode = .byTruncatingTail
    }
}

public extension Text {
    
    func maximumNumberOfLines(_ maximumNumberOfLines: UInt) -> Self {
        self.apply { $0.maximumNumberOfLines = maximumNumberOfLines }
    }
    
    func truncationMode(_ truncationMode: NSLineBreakMode) -> Self {
        self.apply { $0.truncationMode = truncationMode }
    }
}
