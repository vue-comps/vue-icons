<template lang="pug">
.container(style="font-size:12pt")
  p fa-ban(scale=2,style="color:red") on fa-camera:
    icon(name="fa-camera")
      icon-stack(name="fa-ban",style="color:red",:scale=2)
  p fa-beer on fa-thumbs-up (with offset-x / offset-y and scale):
    icon(name="fa-thumbs-up",:offset-x=-30)
      icon-stack(name="fa-beer",:offset-x=30,:scale=1.2,:offset-y=-20)
  a(href="https://github.com/vue-comps/vue-icons/blob/master/dev/basic.vue") source
</template>

<script lang="coffee">
module.exports =
  components:
    "icon" : require "../icon.js"
    "icon-stack" : require "../icon-stack.js"

</script>
