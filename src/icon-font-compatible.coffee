# out: ../icon-font-compatible.js
i = require "./icon"
ifc =
  mixins: i.mixins
  props:
    name: i.props.name
    flip: i.props.flip
    label: i.props.label
  computed:
    icon: i.computed.icon
    box: i.computed.box
    flipped: i.computed.flipped
    height: ->
      @style = window.getComputedStyle(@$el) unless @style
      return @style.getPropertyValue("font-size").replace("px","")
    width: ->
      if @height?
        @icon.w / @icon.h * @height
      return null
    marginTop: ->
      @style = window.getComputedStyle(@$el) unless @style
      height = parseInt @style.getPropertyValue("line-height").replace("px","")
      return (height-@height)/2+'px'

module.exports = ifc
