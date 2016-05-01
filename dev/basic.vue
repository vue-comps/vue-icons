<template lang="jade">
.container
  p fa-glass:
    icon(name="fa-glass")
  p fa-taxi:
    icon(name="fa-taxi")
  p fa-cab (alias):
    icon(name="fa-cab")
  p fa-taxi (flip="h"):
    icon(name="fa-taxi",flip="h")
  p fa-bullhorn:
    icon(name="fa-bullhorn")
  p fa-bullhorn (flip="v"):
    icon(name="fa-bullhorn",flip="v")
  p fa-bullhorn (size=32):
    icon(name="fa-bullhorn",size=32)
  p mdi-account-alert:
    icon(name="mdi-account-alert")
  p mdi-account-alert (style="color:red"):
    icon(style="color:red" name="mdi-account-alert")
  p material-build:
    icon(name="material-build")
  p octicon-logo-github:
    icon(name="octicon-logo-github")
  p iconic-wrench:
    icon(name="iconic-wrench")
  a(href="https://github.com/vue-comps/vue-icons/blob/master/dev/basic.vue") source
</template>

<script lang="coffee">
module.exports =
  components:
    "icon" : require "../icon.js"

</script>
