//
//  ForEach.swift
//

import AsyncDisplayKit

public struct ForEach<Data, Content>: LayoutElement where Data: Collection, Content: LayoutElement {
    
    public var data: Data
    public var content: (Data.Element) -> Content
    
    public init(_ data: Data, @LayoutBuilder _ content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.content = content
    }
    
    public func build() -> [ASLayoutElement] {
        data.flatMap {
            content($0).build()
        }
    }
}
