# vue-icons

webpack based - load only what you need - svg inline icons.

comes with:
- [Font Awesome](https://fortawesome.github.io/Font-Awesome/icons/)
- [Google Material Design Icons](https://design.google.com/icons/)
- [Material Design Icons](https://materialdesignicons.com/)
- [Octicons](https://octicons.github.com/)

[Glyphicons](http://getbootstrap.com/components/#glyphicons) are currently broken [svgfont2js#1](https://github.com/riobard/svgfont2js/issues/1).

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
| Name | type | default | description |
| ---:| --- | ---| --- |
| name | String | - | (required) name of the icon|
| flip | String | - | `v` for vertical and `h` for horizontal flipping |
| label | String | - | aria-label |

### Plain icon

if you don't need the font-compatibility you can also use the plain icon component:
```coffee
components:
  "icon": require("vue-icons/icon")
```
This has two additional props:

| Name | type | default | description |
| ---:| --- | ---| --- |
| scale | Number | 1 | scale multiplier, 1 means height of 16px |
| hcenter | Boolean | false | sets `margin-top` so that the icon will be centered in the parent element |

#### Prefixes
- [Font Awesome](https://fortawesome.github.io/Font-Awesome/icons/) - `fa`
- [Google Material Design Icons](https://design.google.com/icons/) - `material`
- [Material Design Icons](https://materialdesignicons.com/) - `mdi`
- [Octicons](https://octicons.github.com/) - `octicon`

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
