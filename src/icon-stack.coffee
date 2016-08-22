# out: ../icon-stack.js
i = require "./icon"
iconStack =
  template: """
  <svg version="1.1",
    :role="label ? 'img' : 'presentation'",
    :aria-label="label",
    :width="outerWidth",
    :height="outerHeight",
    :style="computedStyle",
    :view-box.camel="box",
    >
    <path
      :d="icon.d",
      :transform="flipped",
      fill="currentColor">
    </path>
  </svg>
  """
  mixins: i.mixins
  data: i.data
  ready: i.ready
  compiled: i.compiled
  props: {}
  computed:
    isStack: -> true
    mergeStyle: ->
      return {
        position: "absolute"
        left: 0
      }
    outerWidth: -> @$parent.outerWidth
    outerHeight: -> @$parent.outerHeight

for prop in ["name","offsetX","offsetY","flipH","flipV","label","style","size","scale"]
  iconStack.props[prop] = i.props[prop]
for c in ["processedName","icon","box","aspect","flipped","innerHeight","innerWidth","widthRatio","heightRatio"]
  iconStack.computed[c] = i.computed[c]

module.exports = iconStack
