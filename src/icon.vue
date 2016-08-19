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
    @label ?= @name
  ready: ->
    @parent = @$el.parentElement

  computed:
    icon: ->
      tmp = @name.split("-")
      set = tmp.shift()
      getIcon(set,@Vue.util.camelize(tmp.join("-")))
    box: ->
      if @flipV
        s = "-#{@icon.w} "
      else
        s = "0 "
      if @flipH
        s += "-#{@icon.h} "
      else
        s += "0 "
      return s+"#{@icon.w} #{@icon.h}"
    width: -> @icon.w / @icon.h * @height
    height: -> parseFloat(@size)*parseFloat(@scale)
    flipped: ->
      return null unless @flipH or @flipV
      return "scale(#{-@flipV*2+1},#{-@flipH*2+1})"
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
