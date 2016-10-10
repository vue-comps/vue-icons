# out: ../icon-stack.js
i = require "./icon"
iconStack =
  render: ->
    `with(this){//`
    return _h 'svg',
          style:(computedStyle)
          attrs:
            "version":"1.1"
            "role": if label then 'img' else 'presentation'
            "aria-label":label
            "width":outerWidth
            "height":outerHeight
            "viewBox":box
          ,[_h 'path',
            attrs:
              "d":icon.d
              "transform":flipped
              "fill":"currentColor"
          ]
    `}`

  mixins: i.mixins
  data: i.data
  mounted: i.mounted
  props: {}
  computed:
    isStack: -> true
    mergeStyle: ->
      return {
        left: "0"
        position: "absolute"
      }
    outerWidth: -> @$parent.outerWidth
    outerHeight: -> @$parent.outerHeight

for prop in ["name","offsetX","offsetY","flipH","flipV","label","style","size","scale"]
  iconStack.props[prop] = i.props[prop]
for c in ["processedName","icon","box","aspect","flipped","innerHeight","innerWidth","widthRatio","heightRatio"]
  iconStack.computed[c] = i.computed[c]

module.exports = iconStack
