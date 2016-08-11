# out: ../icon-font-compatible.js
i = require "./icon"
ifc =
  template: i.template
  mixins: i.mixins
  data: ->
    elstyle: null
  ready: ->
    @elstyle = window.getComputedStyle(@$el)
  props:
    name: i.props.name
    flip: i.props.flip
    label: i.props.label
    style: i.props.style
  computed:
    icon: i.computed.icon
    box: i.computed.box
    flipped: i.computed.flipped
    mergeStyle: i.computed.mergeStyle
    height: ->
      if @elstyle
        return parseFloat @elstyle.getPropertyValue("font-size").replace("px","")
      return null
    width: -> @icon.w / @icon.h * @height
    paddingTop: ->
      if @elstyle
        lh = @elstyle.getPropertyValue("line-height")
        if lh != "normal"
          lh = parseFloat lh.replace("px","")
          return (lh-@height)/2
      return null

module.exports = ifc
