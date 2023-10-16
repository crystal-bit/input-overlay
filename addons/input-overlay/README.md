# Godot 4 - Input Overlay Addon

<img width=200 src="https://raw.githubusercontent.com/crystal-bit/input-overlay/main/icon512px.png" />

Simple overlay used to show input events during tutorials.

![animated preview](https://github.com/crystal-bit/input-overlay/assets/6860637/1e7d4863-1a41-47ba-9ebf-51dd90a38ed8)

Overlay for:
- SHIFT
- Q
- W
- E
- A
- S
- D
- F
- Mouse LMB
- Mouse RMB
- Mouse MMB
- Scroll

## Configuration

You can configure the overlay screen position and scale by editing the file `input-overlay-config.tres`. For now it is only possible to anchor the overlay in the bottom right corner
(Support more anchor points, see https://github.com/crystal-bit/input-overlay/issues/5)

To change the appearance of the overlay you can edit the theme `overlay-theme.theme`. This theme contains settings for:
- Panel
- Internal margins
- Font size

After changing any of these files it is necessary to reload the addon for the changes to be applied

### License

MIT
