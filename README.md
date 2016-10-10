# vue-icons

webpack based - load only what you need - svg inline icons.

comes with (and prefixes):
- [Font Awesome](https://fortawesome.github.io/Font-Awesome/icons/) - `fa`
- [Google Material Design Icons](https://design.google.com/icons/) - `material` - spaces in icon names are replaced by `_`, e.g. `material-done_all`.
- [Material Design Icons](https://materialdesignicons.com/) - `mdi`
- [Octicons](https://octicons.github.com/) - `octicon`
- [Open Iconic](https://useiconic.com/open#icons) - `iconic`
- [Glyphicons](http://getbootstrap.com/components/#glyphicons) - `glyphicon`
- [IcoMoon-free](https://icomoon.io/#preview-free) - `im`
- [ratchicons](http://goratchet.com/components/#ratchicons) - `ra` - add `and` for android version `ra-download` -> `ra-and-download`


### [Demo](https://vue-comps.github.io/vue-icons)

heavily inspired by [vue-awesome](https://github.com/Justineo/vue-awesome).

# Install

```sh
npm install --save-dev vue-icons callback-loader
// vue@1.0
npm install --save-dev vue-icons@1 callback-loader
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
The `height` of the icon will be set to `font-size` and as `svg` render as inline item, it will fit in the middle of `line-height` and responds to `vertical-align` similar as normal glyphs.

#### Props
Name | type | default | description
---:| --- | ---| ---
name | String | - | (required) name of the icon
flip-v | String | - | apply vertical flipping
flip-h | String | - | apply horizontal flipping
offset-x | Number | 0 | move the icon left/right within its borders in percentage (relative to the center)
offset-y | Number | 0 | move the icon up/down within its borders in percentage (relative to the center)
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
size | Number | 16 | height of the icon in px
scale | Number | 1 | size multiplier
hcenter | Boolean | false | sets the height to equal the parentElement and moves the icon to the center



### Spinners
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

### Icon stack
You can stack icons by using the plain icon and the stack icon component:
```coffee
components:
  "icon": require("vue-icons/icon") # this won't work with the font-compatible version (require("vue-icons"))
  "icon-stack": require("vue-icons/icon-stack")
```
```html
<icon name="fa-camera">
  <icon-stack name="fa-ban" style="color:red" scale=2></icon-stack>
</icon>
```
`offset-x` and `offset-y` on `icon-stack` increase the size of the icon boundaries, so both will stay fully visible.
The normal `icon` will be positioned in the center of the, then larger, boundaries.
## Changelog
- 2.0.0  
added vue 2.0.0 compatibility  

- 1.4.2  
added error messages  

- 1.4.1  
added ratchicons  

- 1.4.0  
changed positioning again (icon-font-compatible with line-height)  

- 1.3.0  
added icon stack  
added icomoon - `im`  
changed `octicons` processing to take the direct svg icons instead of the font  

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
