# Description:

Provides declarative SwiftUI code style(DSL) for Texture(AsyncDisplayKit)

# How to use:

Highly recommended to use AutoManageableNode or AutoManageableCell to layout your custom views. All you need to specify is `layoutSpecThatFits` method.
Start from adding `Layout` wrapper, that takes `@LayoutBuilder` block and returns `ASLayoutSpec`.
Inside Layout block you can use all of basic Texture LayoutSpec subclasses alongside with modifiers.

LayoutSpecs:
- ASOverlayLayoutSpec
- ASInsetLayoutSpec
- ASCornerLayoutSpec
- ASCenterLayoutSpec
- ASBackgroundLayoutSpec
- ASStackLayoutSpec

Modifiers:
- alignSelf
- flexGrow
- flexShrink
- flexBasis
- size
- width
- height
- spacing(after/before)
- cornerRadius
- backgroundColor
- tintColor
  
# Examples:

```
 override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        Layout {
            avatarImage
                .size(componentSize)
                .rounded
                .corner(offset: cornerOffset) {
                    View(backgroundColor: .white)
                        .size(outerSize)
                        .rounded
                        .overlay {
                            View(backgroundColor: .systemGreen)
                                .size(innerSize)
                                .rounded
                                .center()
                        }
                }
        }
    }
```
Resulting component:

![Avatar](https://github.com/AV441/DeclarativeTexture/assets/103361928/8db506c9-5372-42c9-a293-8667d7c267c6)

```
 override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        Layout {
            HStack(spacing: 10) {
                Avatar(type: .basic,
                       size: .XL,
                       model: model.avatar)
                .alignSelf(.center)
                VStack {
                    Text(string: model.name, attributes: .title)
                    Text(string: model.phoneNumber, attributes: .subtitle)
                    HStack(spacing: 4) {
                        Image(named: "mail")
                            .tintColor(.secondaryLabel)
                            .size(.init(width: 17, height: 17))
                            .alignSelf(.center)
                        Text(string: model.email, attributes: .subtitle)
                            .flexShrink(1)
                    }
                }
                .flexShrink(1)
            }
            .padding(24)
        }
    }
```
Resulting component:

![Left](https://github.com/AV441/DeclarativeTexture/assets/103361928/de61e280-8d17-4fc9-a18b-f2c7efe5d22a)


