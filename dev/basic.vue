<template lang="pug">
.container(style="font-size:12pt")
  p fa-glass:
    icon(name="fa-glass",v-ref:fa)
  p fa-taxi:
    icon(name="fa-taxi")
  p fa-cab (alias):
    icon(name="fa-cab")
  p fa-taxi (flip-h):
    icon(name="fa-taxi",flip-h,v-ref:horizontal)
  p fa-bullhorn:
    icon(name="fa-bullhorn")
  p fa-bullhorn (flip-v):
    icon(name="fa-bullhorn",flip-v,v-ref:vertical)
  p fa-bullhorn (size=32):
    icon(name="fa-bullhorn",size=32,v-ref:size)
  p fa-bullhorn (scale=2):
    icon(name="fa-bullhorn",scale=2,v-ref:scale)
  p mdi-account-alert:
    icon(name="mdi-account-alert",v-ref:mdi)
  p mdi-account-alert (style="color:red"):
    icon(style="color: red;" name="mdi-account-alert", v-ref:color)
  p material-build:
    icon(name="material-build",v-ref:material)
  p material-build(flip-h and flip-v):
    icon(name="material-build", flip-h flip-v v-ref:flipboth)
  p octicon-logo-github:
    icon(name="octicon-logo-github",v-ref:octicon)
  p octicon-heart:
    icon(name="octicon-heart")
  p glyphicon-heart:
    icon(name="glyphicon-heart",v-ref:glyphicon)
  p im-IcoMoon:
    icon(name="im-IcoMoon",v-ref:im)
  p ra-download:
    icon(name="ra-download",v-ref:ra)
  p ra-and-download:
    icon(name="ra-and-download")
  p iconic-wrench:
    icon(name="iconic-wrench",v-ref:iconic)
    | (vertical-align:sub):
    icon(name="iconic-wrench" style="vertical-align:sub")
  p(style="height:40px;border: 1px solid black") iconic-wrench (height:40px without hcenter):
    icon(name="iconic-wrench")
  p(style="height:40px;border: 1px solid black; position:relative") iconic-wrench (height:40px with hcenter), don't use hcenter with text
    icon(name="iconic-wrench",hcenter,v-ref:hcenter)
  p(style="line-height:40px;border: 1px solid black; position:relative") iconic-wrench (line-height:40px)
    icon(name="iconic-wrench")
  p glyphicon-heart(offset-x=-20, offset-y=20):
    icon(name="glyphicon-heart",v-ref:offset,offset-x=-20, offset-y=20)
  a(href="https://github.com/vue-comps/vue-icons/blob/master/dev/basic.vue") source
</template>

<script lang="coffee">
module.exports =
  components:
    "icon" : require "../icon.js"

</script>
