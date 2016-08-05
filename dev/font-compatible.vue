<template lang="pug">
.container
  p fa-glass (style="font-size:20px"):
    icon(name="fa-glass" style="font-size:20px" v-ref:size)
  div(style="font-size:20px;line-height:40px;border:solid 1px black;position:relative") fa-glass (style="font-size:20px;line-height:40px"):
    icon(name="fa-glass" v-ref:line-height)
  a(href="https://github.com/vue-comps/vue-icons/blob/master/dev/font-compatible.vue") source
</template>

<script lang="coffee">
module.exports =
  components:
    "icon" : require "../icon-font-compatible.js"

</script>
