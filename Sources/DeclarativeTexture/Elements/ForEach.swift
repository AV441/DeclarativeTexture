//
//  ForEach.swift
//
//  Created by Андрей Ведищев on 27.12.2023.
//

import AsyncDisplayKit

public struct ForEach<Data, ID, Content>: LayoutElement where Data: RandomAccessCollection,
                                                              ID: Hashable,
                                                              ID == Data.Element.ID,
                                                              Content: LayoutElement,
                                                              Data.Element: Identifiable {

    public var data: Data
    public var content: (Data.Element) -> Content
    
    public init(_ data: Data, @LayoutBuilder _ content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.content = content
    }
    
    public init(_ data: Data, _ id: KeyPath<Data.Element, ID>, _ content: @escaping (Data.Element) -> Content) {
          self.data = data
          self.content = content
      }
    
    public func build() -> [ASLayoutElement] {
        data.flatMap {
            content($0).build()
        }
    }
}
