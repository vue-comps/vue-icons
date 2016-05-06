#
# out: ../icon-font-compatible.js
i = require "./icon"
ifc =
  template: i.template
  mixins: i.mixins
  data: ->
    style: null
  ready: ->
    @style = window.getComputedStyle(@$el)
  props:
    name: i.props.name
    flip: i.props.flip
    label: i.props.label
  computed:
    icon: i.computed.icon
    box: i.computed.box
    flipped: i.computed.flipped
    height: ->
      if @style
        return parseFloat @style.getPropertyValue("font-size").replace("px","")
      return null
    width: -> @icon.w / @icon.h * @height
    marginTop: ->
      if @style
        height = parseInt @style.getPropertyValue("line-height").replace("px","")
        return (height-@height)/2+'px'
      return null

module.exports = ifc
