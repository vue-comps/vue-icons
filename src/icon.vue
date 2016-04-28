// out: ..
<template lang="jade">
svg(version="1.1",
  :role="label ? 'img' : 'presentation'",
  :aria-label="label",
  :width="width",
  :height="height",
  :view-box.camel="box",
  display="inline-block",
  :style="{marginTop:marginTop}"
  )
  path(:d="icon.d",:transform="flipped",fill="currentColor")
</template>

<script lang="coffee" >
getIcons()
module.exports =

  mixins: [
    require "vue-mixins/getVue"
  ]

  props:
    name:
      type: String
      required: true
    scale:
      type: Number
      default: 1
      coerce: (val) ->
        val = Number(val)
        return if isNaN(val) then 1 else val
      validator: (val) -> Number(val) > 0
    flip: String
    label: String
    hcenter:
      type: Boolean
      default: false

  data: ->
    parent: null

  attached: ->
    @parent = @$el.parentElement

  computed:
    icon: ->
      tmp = @name.split("-")
      set = tmp.shift()
      getIcon(set,@getVue().util.camelize(tmp.join("-")))
    box: ->
      if @flip == "h"
        s = "0 -#{@icon.h}"
      else if @flip == "v"
        s = "-#{@icon.w} 0"
      else
        s = "0 0"
      return s+" #{@icon.w} #{@icon.h}"
    width: ->
      @icon.w / @icon.h * 16 * @scale
    height: -> 16 * @scale
    flipped: ->
      if @flip == "h"
        return "scale(1,-1)"
      else if @flip == "v"
        return "scale(-1,1)"
      else
        return null
    marginTop: ->
      if @hcenter and @parent?
        return (@parent.clientHeight-@height)/2+'px'
      return null


</script>
