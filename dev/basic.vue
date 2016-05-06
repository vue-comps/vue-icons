<template lang="pug">
.container
  p fa-glass:
    icon(name="fa-glass",v-ref:fa)
  p fa-taxi:
    icon(name="fa-taxi")
  p fa-cab (alias):
    icon(name="fa-cab")
  p fa-taxi (flip="h"):
    icon(name="fa-taxi",flip="h",v-ref:horizontal)
  p fa-bullhorn:
    icon(name="fa-bullhorn")
  p fa-bullhorn (flip="v"):
    icon(name="fa-bullhorn",flip="v",v-ref:vertical)
  p fa-bullhorn (size=32):
    icon(name="fa-bullhorn",size=32,v-ref:size)
  p fa-bullhorn (scale=2):
    icon(name="fa-bullhorn",scale=2,v-ref:scale)
  p mdi-account-alert:
    icon(name="mdi-account-alert",v-ref:mdi)
  p mdi-account-alert (style="color:red"):
    icon(style="color:red" name="mdi-account-alert", v-ref:color)
  p material-build:
    icon(name="material-build",v-ref:material)
  p octicon-logo-github:
    icon(name="octicon-logo-github",v-ref:octicon)
  p iconic-wrench:
    icon(name="iconic-wrench",v-ref:iconic)
  p(style="height:40px;border: 1px solid black") iconic-wrench (hcenter)
    icon(name="iconic-wrench",hcenter,v-ref:hcenter)
  a(href="https://github.com/vue-comps/vue-icons/blob/master/dev/basic.vue") source
</template>

<script lang="coffee">
module.exports =
  components:
    "icon" : require "../icon.js"

</script>
