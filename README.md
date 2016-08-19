# vue-icons

webpack based - load only what you need - svg inline icons.

comes with (and prefixes):
- [Font Awesome](https://fortawesome.github.io/Font-Awesome/icons/) - `fa`
- [Google Material Design Icons](https://design.google.com/icons/) - `material`
- [Material Design Icons](https://materialdesignicons.com/) - `mdi`
- [Octicons](https://octicons.github.com/) - `octicon`
- [Open Iconic](https://useiconic.com/open#icons) - `iconic`
- [Glyphicons](http://getbootstrap.com/components/#glyphicons) - `glyphicon`

In `material` spaces in icon names are replaced by `_`, e.g. `material-done_all`.

### [Demo](https://vue-comps.github.io/vue-icons)

heavily inspired by [vue-awesome](https://github.com/Justineo/vue-awesome).

# Install

```sh
npm install --save-dev vue-icons callback-loader
```

## Usage

webpack.config:
```coffee
module:
  loaders: [
    # your loaders
  ]
  postLoaders: [
    { test: /vue-icons/, loader: "callback-loader"}
  ]
callbackLoader:
  require("vue-icons/icon-loader")(["fa-thumbs-up"]) # add all the icons you need
```

in your component:
```coffee
components:
  "icon": require("vue-icons")
```
```html
<icon name="fa-thumbs-up"></icon>
```
see [`dev/`](https://github.com/vue-comps/vue-icons/tree/master/dev) for examples.

This will load a font-compatible version of the component.
The `height` of the icon will be set to `font-size` and `margin-top` will be set so it will fit in the middle of `line-height`.

#### Props
Name | type | default | description
---:| --- | ---| ---
name | String | - | (required) name of the icon
flip-v | String | - | apply vertical flipping
flip-h | String | - | apply horizontal flipping
label | String | name | aria-label

### Plain icon

if you don't need the font-compatibility you can also use the plain icon component:
```coffee
components:
  "icon": require("vue-icons/icon")
```
This has three additional props:

Name | type | default | description
---:| --- | ---| ---
size | String | 16 | height of the icon in px
scale | String | 1 | size multiplier
hcenter | Boolean | false | sets `margin-top` so that the icon will be centered in the parent element


#### Spinners
comes without css, so no spinning included, you can do it manually like this:
```css
//css
.spin {
  animation: spin 1s 0s infinite linear;
}
@keyframes spin {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
```
```html
<icon name="fa-spinner" class="spin"></icon>
```

## Changelog

- 1.2.0
changed flip interface
fixed `glyphicons`
removed `display:inline-block` from default style.
Updated `octicons` - they changed their icon font.

# Development
Clone repository.
```sh
npm install
npm run dev
```
Browse to `http://localhost:8080/`.

## License
Copyright (c) 2016 Paul Pflugradt
Licensed under the MIT license.
