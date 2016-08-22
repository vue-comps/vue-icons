// out: ..
<template lang="pug">
span(v-bind:style="computedStyle")
  svg(version="1.1",
    :role="label ? 'img' : 'presentation'",
    :aria-label="label",
    :width="outerWidth",
    :height="outerHeight",
    :view-box.camel="box",
    )
    path(
      :d="icon.d",
      :transform="flipped",
      fill="currentColor")
  slot
</template>

<script lang="coffee" >
getIcons()
module.exports =

  mixins: [
    require "vue-mixins/vue"
    require "vue-mixins/style"
  ]

  props:
    style:
      default: -> []
    name:
      type: String
      required: true
    size:
      type: Number
      default: 16
      coerce: Number
    scale:
      type: Number
      default: 1
      coerce: Number
    offsetX:
      type: Number
      default: 0
      coerce: Number
    offsetY:
      type: Number
      default: 0
      coerce: Number
    flipH:
      type: Boolean
      default: false
    flipV:
      type: Boolean
      default: false
    label: String
    hcenter:
      type: Boolean
      default: false

  data: ->
    parent: null
  compiled: ->
    @label ?= @processedName[1]
  ready: ->
    @parent = @$el.parentElement

  computed:
    processedName: ->
      tmp = @name.split("-")
      set = tmp.shift()
      return [set,tmp.join("-")]
    icon: ->
      getIcon(@processedName[0],@Vue.util.camelize(@processedName[1]))
    box: ->
      w = @icon.w
      h = @icon.h
      wOffset = -w*((@widthRatio-1)/2+@offsetX/100)
      hOffset = -h*((@heightRatio-1)/2-@offsetY/100)
      if @flipV
        s = "-#{w+wOffset} "
      else
        s = "#{wOffset} "
      if @flipH
        s += "-#{h+hOffset} "
      else
        s += "#{hOffset} "
      return s+"#{w*@widthRatio} #{h*@heightRatio}"
    aspect: -> @icon.w / @icon.h
    innerWidth: -> @aspect * @innerHeight
    outerWidth: ->
      w = @innerWidth
      for child in @$children
        if child.isStack
          cw = child.innerWidth*(1+Math.abs(child.offsetX)/50)
          w = cw if cw > w
      return w
    widthRatio: -> @outerWidth/@innerWidth
    innerHeight: -> @size*@scale
    outerHeight: ->
      if @hcenter and @parent?
        return @parent.clientHeight
      h = @innerHeight
      for child in @$children
        if child.isStack
          ch = child.innerHeight*(1+Math.abs(child.offsetY)/50)
          h = ch if ch > h
      return h
    heightRatio: -> @outerHeight/@innerHeight
    flipped: ->
      return null unless @flipH or @flipV
      return "scale(#{-@flipV*2+1},#{-@flipH*2+1})"
    mergeStyle: ->
      return {
        position: "relative"
      }

</script>
