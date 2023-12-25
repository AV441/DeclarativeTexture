//
//  LayoutElement+Modifiers.swift
//
//  Created by Андрей Ведищев on 18.12.2023.
//

import AsyncDisplayKit

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
    
    func alignSelf(_ alignSelf: ASStackLayoutAlignSelf) -> ModifiedElement {
        set(AlignSelfModifier(alignSelf: alignSelf))
    }
    
    func flexGrow(_ flexGlow: CGFloat) -> ModifiedElement {
        set(FlexGlowModifier(flexGrow: flexGlow))
    }
    
    func flexShrink(_ flexShrink: CGFloat) -> ModifiedElement {
        set(FlexShrinkModifier(flexShrink: flexShrink))
    }
    
    func flexBasis(fraction: CGFloat) -> ModifiedElement {
        set(FlexBasisModifier(flexBasis: .init(unit: .fraction, value: fraction)))
    }
    
    func size(_ size: CGSize) -> ModifiedElement {
        set(SizeModifier(size: size))
    }
    
    func cornerRadius(_ cornerRadius: CGFloat) -> ModifiedElement {
        set(CornerRadiusModifier(cornerRadius: cornerRadius))
    }
    
    func width(_ width: CGFloat) -> ModifiedElement {
        set(SizeModifier(width: .init(unit: .points, value: width), height: nil))
    }
    
    func width(fraction: CGFloat) -> ModifiedElement {
        set(SizeModifier(width: .init(unit: .fraction, value: fraction), height: nil))
    }
    
    func height(_ height: CGFloat) -> ModifiedElement {
        set(SizeModifier(width: nil, height: .init(unit: .points, value: height)))
    }
    
    func height(fraction: CGFloat) -> ModifiedElement {
        set(SizeModifier(width: nil, height: .init(unit: .fraction, value: fraction)))
    }
    
    func spacingAfter(_ spacing: CGFloat) -> ModifiedElement {
        set(SpacingModifier(after: spacing, before: nil))
    }
    
    func spacingBefore(_ spacing: CGFloat) -> ModifiedElement {
        set(SpacingModifier(after: nil, before: spacing))
    }
}
