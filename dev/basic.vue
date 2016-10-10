<template lang="pug">
.container(style="font-size:12pt")
  p fa-glass:
    icon(name="fa-glass",ref="fa")
  p fa-taxi:
    icon(name="fa-taxi")
  p fa-cab (alias):
    icon(name="fa-cab")
  p fa-taxi (flip-h):
    icon(name="fa-taxi",flip-h,ref="horizontal")
  p fa-bullhorn:
    icon(name="fa-bullhorn")
  p fa-bullhorn (flip-v):
    icon(name="fa-bullhorn",flip-v,ref="vertical")
  p fa-bullhorn (size=32):
    icon(name="fa-bullhorn",:size=32,ref="size")
  p fa-bullhorn (scale=2):
    icon(name="fa-bullhorn",:scale=2,ref="scale")
  p mdi-account-alert:
    icon(name="mdi-account-alert",ref="mdi")
  p mdi-account-alert (style="color:red"):
    icon(style="color: red;" name="mdi-account-alert", ref="color")
  p material-build:
    icon(name="material-build",ref="material")
  p material-build(flip-h and flip-v):
    icon(name="material-build", flip-h flip-v ref="flipboth")
  p octicon-logo-github:
    icon(name="octicon-logo-github",ref="octicon")
  p octicon-heart:
    icon(name="octicon-heart")
  p glyphicon-heart:
    icon(name="glyphicon-heart",ref="glyphicon")
  p im-IcoMoon:
    icon(name="im-IcoMoon",ref="im")
  p ra-download:
    icon(name="ra-download",ref="ra")
  p ra-and-download:
    icon(name="ra-and-download")
  p iconic-wrench:
    icon(name="iconic-wrench",ref="iconic")
    | (vertical-align:sub):
    icon(name="iconic-wrench" style="vertical-align:sub")
  p(style="height:40px;border: 1px solid black") iconic-wrench (height:40px without hcenter):
    icon(name="iconic-wrench")
  p(style="height:40px;border: 1px solid black; position:relative") iconic-wrench (height:40px with hcenter), don't use hcenter with text
    icon(name="iconic-wrench",hcenter,ref="hcenter")
  p(style="line-height:40px;border: 1px solid black; position:relative") iconic-wrench (line-height:40px)
    icon(name="iconic-wrench")
  p glyphicon-heart(offset-x=-20, offset-y=20):
    icon(name="glyphicon-heart",ref="offset",:offset-x=-20, :offset-y=20)
  a(href="https://github.com/vue-comps/vue-icons/blob/master/dev/basic.vue") source
</template>

<script lang="coffee">
module.exports =
  components:
    "icon" : require "../icon.js"

</script>
