// out: ..
<template lang="pug">
span(v-bind:style="computedStyle")
  svg(version="1.1",
    :role="label ? 'img' : 'presentation'",
    :aria-label="label",
    :width="width",
    :height="height",
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
  compiled: ->
    @label ?= @name
  ready: ->
    @parent = @$el.parentElement

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
    paddingTop: ->
      if @hcenter and @parent?
        return (@parent.clientHeight-@height)/2
      return null
    mergeStyle: ->
      return {
        paddingTop: @paddingTop + "px"
        lineHeight: @height + "px"
      }

</script>
