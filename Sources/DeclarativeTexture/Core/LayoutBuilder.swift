//
//  LayoutBuilder.swift
//

import AsyncDisplayKit

/// Билдер для создания лэйаута
@resultBuilder
public struct LayoutBuilder {

    public static func buildBlock(_ components: LayoutElement?...) -> ComplexLayout {
        .init(components)
    }

    public static func buildBlock<Component: LayoutElement>(_ component: Component) -> Component {
        component
    }

    public static func buildEither<Component: LayoutElement>(first component: Component) -> Component {
        component
    }

    public static func buildEither<Component: LayoutElement>(second component: Component) -> Component {
        component
    }

    public static func buildOptional<Component: LayoutElement>(_ component: Component?) -> OptionalLayout<Component> {
        .init(content: { component })
    }

    public static func buildArray(_ components: [LayoutElement]) -> ComplexLayout {
        .init(components)
    }
}
