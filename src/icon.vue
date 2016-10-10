// out: ..
<template lang="pug">
span(v-bind:style="computedStyle")
  svg(version="1.1",
    :role="label ? 'img' : 'presentation'",
    :aria-label="label",
    :width="outerWidth",
    :height="outerHeight",
    :viewBox="box"
    )
    path(
      :d="icon.d",
      :transform="flipped",
      fill="currentColor")
  slot
</template>

<script lang="coffee" >
getIcons = ->
getIcons()
if process.env.NODE_ENV != 'production' and not getIcon?
  console.error "icon-loader wasn't called - please see vue-icons documentation on how to setup webpack"
  getIcon = (name1,name2)->
    console.error "vue-icons isn't setup properly - failed to get #{name1}-#{name2}"
module.exports =

  mixins: [
    require "vue-mixins/vue"
    require "vue-mixins/style"
    require "vue-mixins/onWindowResize"
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
    scale:
      type: Number
      default: 1
    offsetX:
      type: Number
      default: 0
    offsetY:
      type: Number
      default: 0
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
    children: []
  mounted: ->
    for child in @$children
      if child.isStack
        @children.push child
    @$nextTick ->
      @parent = @$el.parentElement
      @onWindowResize =>
        if @hcenter
          @parent = @$el.parentElement

  computed:
    processedName: ->
      tmp = @name.split("-")
      set = tmp.shift()
      return [set,tmp.join("-")]
    icon: ->
      getIcon(@processedName[0],@Vue.util.camelize(@processedName[1]))
    box: ->
      return null unless @heightRatio
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
      for child in @children
        cw = child.innerWidth*(1+Math.abs(child.offsetX)/50)
        w = cw if cw > w
      return w
    widthRatio: -> @outerWidth/@innerWidth
    innerHeight: -> @size*@scale
    outerHeight: ->
      if @hcenter and @parent?
        return @parent.clientHeight
      h = @innerHeight
      for child in @children
        ch = child.innerHeight*(1+Math.abs(child.offsetY)/50)
        h = ch if ch > h
      return h
    heightRatio: -> @outerHeight/@innerHeight
    flipped: ->
      return null unless @flipH or @flipV
      return "scale(#{-@flipV*2+1},#{-@flipH*2+1})"
    mergeStyle: ->
      style = {
        display: "inline-block"
        height: @outerHeight + "px"
      }
      if @children?.length > 0
        style.position = "relative"
      #style.paddingTop = @marginTop + "px" if @marginTop
      return style

</script>
