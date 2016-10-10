# out: ../icon-font-compatible.js
i = require "./icon"
ifc =
  render: i.render
  mixins: i.mixins
  data: ->
    elstyle: null
  mounted: ->
    @$nextTick ->
      @elstyle = window.getComputedStyle(@$el)
      @onWindowResize =>
        @elstyle = window.getComputedStyle(@$el)
  props: {}
  computed:
    outerWidth: i.computed.innerWidth
    innerHeight: ->
      if @elstyle
        return parseFloat @elstyle.getPropertyValue("font-size").replace("px","")
      return null
    outerHeight: ->
      if @elstyle
        lh = @elstyle.getPropertyValue("line-height")
        if lh != "normal"
          return parseFloat lh.replace("px","")
        else
          return @innerHeight
      return null
    widthRatio: -> 1
    mergeStyle: -> {height: @outerHeight + "px"}

for prop in ["name","offsetX","offsetY","flipH","flipV","label","style"]
  ifc.props[prop] = i.props[prop]
for c in ["processedName","icon","box","aspect","flipped","heightRatio"]
  ifc.computed[c] = i.computed[c]

module.exports = ifc
