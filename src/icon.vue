// out: ..
<template lang="pug">
span
  svg(version="1.1",
    :role="label ? 'img' : 'presentation'",
    :aria-label="label",
    :width="width",
    :height="height",
    :view-box.camel="box",
    display="inline-block"
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
    require "vue-mixins/setCss"
  ]

  props:
    name:
      type: String
      required: true
    size:
      type: String
      default: "16"
    scale:
      type: String
      default: "1"
    flip: String
    label: String
    hcenter:
      type: Boolean
      default: false

  data: ->
    parent: null

  ready: ->
    @parent = @$el.parentElement
    @marginTop
  computed:
    icon: ->
      tmp = @name.split("-")
      set = tmp.shift()
      getIcon(set,@Vue.util.camelize(tmp.join("-")))
    box: ->
      if @flip == "h"
        s = "0 -#{@icon.h}"
      else if @flip == "v"
        s = "-#{@icon.w} 0"
      else
        s = "0 0"
      return s+" #{@icon.w} #{@icon.h}"
    width: -> @icon.w / @icon.h * @height
    height: -> parseFloat(@size)*parseFloat(@scale)
    flipped: ->
      if @flip == "h"
        return "scale(1,-1)"
      else if @flip == "v"
        return "scale(-1,1)"
      else
        return null
    marginTop: ->
      if @hcenter and @parent?
        @setCss @$el, "line-height", @parent.clientHeight+"px"
      else
        @setCss @$el, "line-height"
      return null

</script>
