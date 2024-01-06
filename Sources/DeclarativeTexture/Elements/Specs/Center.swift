//
//  Center.swift
//

import AsyncDisplayKit

public struct Center: LayoutElement {

    private let centeringOptions: ASCenterLayoutSpecCenteringOptions
    private let sizingOptions: ASCenterLayoutSpecSizingOptions
    private let content: LayoutElement

    public init(centeringOptions: ASCenterLayoutSpecCenteringOptions = .XY,
                sizingOptions: ASCenterLayoutSpecSizingOptions = .minimumXY,
                @LayoutBuilder content: () -> LayoutElement) {
        self.centeringOptions = centeringOptions
        self.sizingOptions = sizingOptions
        self.content = content()
    }

    public func build() -> [ASLayoutElement] {
        content.build().map {
            ASCenterLayoutSpec(centeringOptions: centeringOptions,
                               sizingOptions: sizingOptions,
                               child: $0)
        }
    }
}
