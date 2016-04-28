# out: ../icon-font-compatible.js
i = require "./icon"
i.data = ->
  style: null
i.attached = ->
  @style = window.getComputedStyle(@$el)
i.computed.height = ->
  if @style?
    return @style.getPropertyValue("font-size").replace("px","")
  return null
i.computed.width = ->
  if @height?
    @icon.w / @icon.h * @height
  return null
i.computed.marginTop = ->
  if @style?
    height = parseInt @style.getPropertyValue("line-height").replace("px","")
    return (height-@height)/2+'px'
  return null
i.props =
  name: i.props.name
  flip: i.props.flip
  label: i.props.label
module.exports = i
