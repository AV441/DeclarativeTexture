//
//  LayoutElement+Modifiers.swift
//

import AsyncDisplayKit

// swiftlint:disable line_length
public extension LayoutElement {

    func center(_ centeringOptions: ASCenterLayoutSpecCenteringOptions = .XY) -> Center {
        .init(centeringOptions: centeringOptions, content: { self })
    }

    func padding(_ padding: CGFloat) -> Inset {
        .init(insets: .init(padding)) { self }
    }

    func padding(_ edgeInsets: UIEdgeInsets) -> Inset {
        .init(insets: edgeInsets) { self }
    }

    func padding(_ edges: Edges, _ padding: CGFloat) -> Inset {
        .init(insets: .init(edges, padding)) { self }
    }

    func background(_ element: LayoutElement) -> Background {
        .init(content: { self }, background: { element })
    }

    func background(@LayoutBuilder _ element: () -> LayoutElement) -> Background {
        .init(content: { self }, background: element)
    }

    func overlay(_ element: LayoutElement) -> Overlay {
        .init(content: { self }, overlay: { element })
    }

    func overlay(@LayoutBuilder _ element: () -> LayoutElement) -> Overlay {
        .init(content: { self }, overlay: element)
    }

    func corner(location: ASCornerLayoutLocation = .topRight,
                offset: CGPoint = .zero,
                @LayoutBuilder _ element: () -> LayoutElement) -> Corner {
        .init(content: self, cornerContent: element(), location: location, offset: offset)
    }
}

// MARK: - LayoutElement + Any element modifiers
/** The following modifiers apply to ALL layout elements. */
public extension LayoutElement {

    /**
     The width property specifies the width of the content area of an ASLayoutElement. The minWidth and maxWidth properties override width. Defaults to ASDimensionAuto.
     */
    func width(_ width: CGFloat) -> ModifiedElement {
        set(SizeModifier(width: .init(unit: .points, value: width)))
    }

    func width(fraction: CGFloat) -> ModifiedElement {
        set(SizeModifier(width: .init(unit: .fraction, value: fraction)))
    }

    /**
     The height property specifies the height of the content area of an ASLayoutElement. The minHeight and maxHeight properties override height. Defaults to ASDimensionAuto.
     */
    func height(_ height: CGFloat) -> ModifiedElement {
        set(SizeModifier(height: .init(unit: .points, value: height)))
    }

    func height(fraction: CGFloat) -> ModifiedElement {
        set(SizeModifier(height: .init(unit: .fraction, value: fraction)))
    }

    /**
     Provides a suggested size for a layout element. If the optional minSize or maxSize are provided, and the preferredSize exceeds these, the minSize or maxSize will be enforced. If this optional value is not provided, the layout element’s size will default to it’s intrinsic content size provided calculateSizeThatFits:

     This method is optional, but one of either preferredSize or preferredLayoutSize is required for nodes that either have no intrinsic content size or should be laid out at a different size than its intrinsic content size. For example, this property could be set on an ASImageNode to display at a size different from the underlying image size.
     */
    func preferredSize(_ preferredSize: CGSize) -> ModifiedElement {
        set(SizeModifier(preferredSize: preferredSize))
    }

    /**
     An optional property that provides a minimum size bound for a layout element. If provided, this restriction will always be enforced. If a parent layout element’s minimum size is smaller than its child’s minimum size, the child’s minimum size will be enforced and its size will extend out of the layout spec’s.

     For example, if you set a preferred relative width of 50% and a minimum width of 200 points on an element in a full screen container, this would result in a width of 160 points on an iPhone screen. However, since 160 pts is lower than the minimum width of 200 pts, the minimum width would be used.
     */
    func minSize(_ minSize: CGSize) -> ModifiedElement {
        set(MinSizeModifier(minSize: minSize))
    }

    /**
     The minWidth property is used to set the minimum width of a given element. It prevents the used value of the width property from becoming smaller than the value specified for minWidth. The value of minWidth overrides both maxWidth and width. Defaults to ASDimensionAuto.
     */
    func minWidth(_ minWidth: CGFloat) -> ModifiedElement {
        set(MinSizeModifier(minWidth: .init(unit: .points, value: minWidth)))
    }

    func minWidth(fraction minWidth: CGFloat) -> ModifiedElement {
        set(MinSizeModifier(minWidth: .init(unit: .fraction, value: minWidth)))
    }

    /**
     The minHeight property is used to set the minimum height of a given element. It prevents the used value of the height property from becoming smaller than the value specified for minHeight. The value of minHeight overrides both maxHeight and height. Defaults to ASDimensionAuto.
     */
    func minHeight(_ minHeight: CGFloat) -> ModifiedElement {
        set(MinSizeModifier(minHeight: .init(unit: .points, value: minHeight)))
    }

    func minHeight(fraction minHeight: CGFloat) -> ModifiedElement {
        set(MinSizeModifier(minHeight: .init(unit: .fraction, value: minHeight)))
    }

    /**
     An optional property that provides a maximum size bound for a layout element. If provided, this restriction will always be enforced. If a child layout element’s maximum size is smaller than its parent, the child’s maximum size will be enforced and its size will extend out of the layout spec’s.

     For example, if you set a preferred relative width of 50% and a maximum width of 120 points on an element in a full screen container, this would result in a width of 160 points on an iPhone screen. However, since 160 pts is higher than the maximum width of 120 pts, the maximum width would be used.
     */
    func maxSize(_ maxSize: CGSize) -> ModifiedElement {
        set(MaxSizeModifier(maxSize: maxSize))
    }

    /**
     The maxWidth property is used to set the maximum width of a given element. It prevents the used value of the width property from becoming larger than the value specified for maxWidth. The value of maxWidth overrides width, but minWidth overrides maxWidth. Defaults to ASDimensionAuto.
     */
    func maxWidth(_ maxWidth: CGFloat) -> ModifiedElement {
        set(MaxSizeModifier(maxWidth: .init(unit: .points, value: maxWidth)))
    }

    func maxWidth(fraction maxWidth: CGFloat) -> ModifiedElement {
        set(MaxSizeModifier(maxWidth: .init(unit: .fraction, value: maxWidth)))
    }

    /**
     The maxHeight property is used to set the maximum height of a given element. It prevents the used value of the height property from becoming larger than the value specified for maxHeight. The value of maxHeight overrides height, but minHeight overrides maxHeight. Defaults to ASDimensionAuto
     */
    func maxHeight(_ maxHeight: CGFloat) -> ModifiedElement {
        set(MaxSizeModifier(maxHeight: .init(unit: .points, value: maxHeight)))
    }

    func maxHeight(fraction maxHeight: CGFloat) -> ModifiedElement {
        set(MaxSizeModifier(maxHeight: .init(unit: .fraction, value: maxHeight)))
    }

    /**
     An optional property that provides a minimum RELATIVE size bound for a layout element. If provided, this restriction will always be enforced. If a parent layout element’s minimum relative size is smaller than its child’s minimum relative size, the child’s minimum relative size will be enforced and its size will extend out of the layout spec’s.
     */
    func minLayoutSize(_ minLayoutSize: ASLayoutSize) -> ModifiedElement {
        set(LayoutSizeModifier(minLayoutSize: minLayoutSize))
    }

    /**
     An optional property that provides a maximum RELATIVE size bound for a layout element. If provided, this restriction will always be enforced. If a parent layout element’s maximum relative size is smaller than its child’s maximum relative size, the child’s maximum relative size will be enforced and its size will extend out of the layout spec’s.
     */
    func maxLayoutSize(_ maxLayoutSize: ASLayoutSize) -> ModifiedElement {
        set(LayoutSizeModifier(maxLayoutSize: maxLayoutSize))
    }

    /**
     Provides a suggested RELATIVE size for a layout element. An ASLayoutSize uses percentages rather than points to specify layout. E.g. width should be 50% of the parent’s width. If the optional minLayoutSize or maxLayoutSize are provided, and the preferredLayoutSize exceeds these, the minLayoutSize or maxLayoutSize will be enforced. If this optional value is not provided, the layout element’s size will default to its intrinsic content size provided calculateSizeThatFits.
     */
    func preferredLayoutSize(_ preferredLayoutSize: ASLayoutSize) -> ModifiedElement {
        set(LayoutSizeModifier(preferredLayoutSize: preferredLayoutSize))
    }
}

// MARK: - LayoutElement + Stack modifiers
/** The following modifiers will only take effect if set on the child of an STACK layout spec. */
public extension LayoutElement {

    /**
     Orientation of the object along cross axis, overriding alignItems.
     */
    func alignSelf(_ alignSelf: ASStackLayoutAlignSelf) -> ModifiedElement {
        set(AlignSelfModifier(alignSelf: alignSelf))
    }

    /**
     If the sum of children's stack dimensions is less than the minimum size, should this object grow?
     */
    func flexGrow(_ flexGlow: CGFloat) -> ModifiedElement {
        set(FlexGlowModifier(flexGrow: flexGlow))
    }

    /**
     If the sum of children's stack dimensions is greater than the maximum size, should this object shrink?
     */
    func flexShrink(_ flexShrink: CGFloat) -> ModifiedElement {
        set(FlexShrinkModifier(flexShrink: flexShrink))
    }

    /**
     Specifies the initial size for this object, in the stack dimension (horizontal or vertical), before the flexGrow / flexShrink properties are applied and the remaining space is distributed.
     */
    func flexBasis(_ fraction: CGFloat) -> ModifiedElement {
        set(FlexBasisModifier(flexBasis: .init(unit: .fraction, value: fraction)))
    }

    /**
     Additional space to place after this object in the stacking direction.
     */
    func spacingAfter(_ spacing: CGFloat) -> ModifiedElement {
        set(SpacingModifier(after: spacing))
    }

    /**
     Additional space to place before this object in the stacking direction.
     */
    func spacingBefore(_ spacing: CGFloat) -> ModifiedElement {
        set(SpacingModifier(before: spacing))
    }

    /**
     Used for baseline alignment. The distance from the top of the object to its baseline.
     */
    func ascender(_ ascender: CGFloat) -> ModifiedElement {
        set(BaselineAlignmentModifier(ascender: ascender))
    }

    /**
     Used for baseline alignment. The distance from the baseline of the object to its bottom.
     */
    func descender(_ descender: CGFloat) -> ModifiedElement {
        set(BaselineAlignmentModifier(descender: descender))
    }
}

public extension LayoutElement {

    var layerBacked: ModifiedElement {
        .init(element: self, modifier: LayerBackedModifier())
    }

    var rounded: ModifiedElement {
        .init(element: self, modifier: RoundedModifier())
    }

    func tintColor(_ tintColor: UIColor) -> ModifiedElement {
        set(TintColorModifier(tintColor))
    }

    func backgroundColor(_ backgroundColor: UIColor) -> ModifiedElement {
        set(BackgroundColorModifier(backgroundColor))
    }

    func cornerRadius(_ cornerRadius: CGFloat) -> ModifiedElement {
        set(CornerRadiusModifier(cornerRadius: cornerRadius))
    }
}
// swiftlint:enable line_length
