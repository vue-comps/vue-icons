<template lang="jade">
.container
  p fa-glass (style="font-size:20px"):
    icon(name="fa-glass" style="font-size:20px")
  div(style="height:40px;font-size:20px;line-height:40px;border:solid 1px black") fa-glass (style="font-size:20px;line-height:40px"):
    icon(name="fa-glass")
  a(href="https://github.com/vue-comps/vue-icons/blob/master/dev/font-compatible.vue") source
</template>

<script lang="coffee">
module.exports =
  components:
    "icon" : require "../icon-font-compatible.js"

</script>
