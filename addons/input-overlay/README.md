# Godot 4 - Input Overlay Addon

<img width=200 src="https://raw.githubusercontent.com/crystal-bit/input-overlay/main/icon512px.png" />

Simple overlay used to show input events during tutorials.

https://github.com/crystal-bit/input-overlay/assets/6860637/3231e21c-d04f-47ce-bf73-6032697b36ea

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
