<template lang="pug">
.container
  p fa-glass (style="font-size:20px"):
    icon(name="fa-glass" style="font-size:20px" ref="size")
  p dont use icon within textflow - same as hcenter with normal icon
  div(style="font-size:20px;line-height:40px;border:solid 1px black;position:relative") fa-glass (style="font-size:20px;line-height:40px"):
    icon(name="fa-glass" ref="lineHeight")
  a(href="https://github.com/vue-comps/vue-icons/blob/master/dev/font-compatible.vue") source
</template>

<script lang="coffee">
module.exports =
  components:
    "icon" : require "../icon-font-compatible.js"

</script>
