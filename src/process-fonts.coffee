fs = require "fs"
svgfont2js = require "svgfont2js"
SVGO = require "svgo"
svgo = new SVGO()
Promise = require "bluebird"
path = require "path"
svgpath = require("svgpath")

loadAliases = (less,re) ->
  m = {}
  match = undefined
  while null != (match = re.exec(less))
    alias = match[1]
    unicode_hex = match[2]
    m[unicode_hex] = [] unless m[unicode_hex]?
    m[unicode_hex].push(alias)
  return m

sets =
  fa:
    re: /@fa-var-([a-z0-9-]+)\s*:\s*"\\([0-9a-f]+)";/g
    style: "font-awesome/less/variables.less"
    svg: "font-awesome/fonts/fontawesome-webfont.svg"
  glyphicon:
    re: /glyphicon-([^\s]*)[^\n]*content: "\\([^"]*)"/g
    style: "bootstrap/less/glyphicons.less"
    svg: "bootstrap/fonts/glyphicons-halflings-regular.svg"
    translateY: 240
  mdi:
    svg: "mdi/fonts/materialdesignicons-webfont.svg"
  octicon:
    svg: "octicons/build/font/octicons.svg"

  material:
    svg: "material-design-icons/iconfont/MaterialIcons-Regular.svg"
  iconic:
    svg: "open-iconic/font/fonts/open-iconic.svg"
    style: "open-iconic/font/css/open-iconic.css"
    re: /\.oi\[data-glyph=([^\]]+)\]:before { content:'\\([^']+)'; }/g

processSet = (setname,set) ->
  console.log setname
  if set.re
    aliases = loadAliases(fs.readFileSync(require.resolve(set.style, "utf8")),set.re)
  glyphs = svgfont2js(fs.readFileSync(require.resolve(set.svg, "utf8")))
  re = /d="([\w\s-.]*)"/
  optimizers = []
  for glyph in glyphs
    optimizers.push new Promise (resolve) ->
      d = new svgpath(glyph.path)
      if set.translateY
        d = d.translate(0, set.translateY)
      d = d.rel().toString()
      svgo.optimize "<svg width='#{glyph.width}' height='#{glyph.height}'><path d='#{d}'/></svg>", (result) ->
        match = re.exec(result.data)
        if match?[1]
          glyph.path = match[1]
          resolve glyph
        else
          resolve null
  Promise.all(optimizers)
  .then (glyphs) ->
    data = {aliases:{},icons:{}}
    for glyph in glyphs
      if glyph?
        if set.re
          tmp = glyph['unicode_hex']
          if tmp.length == 2
            tmp = "00"+tmp
          else if tmp.length == 3
            tmp = "0"+tmp
          names = aliases[tmp]
        else
          names = [glyph.name]
        if names?
          name = names.shift()
          icon =
            d: glyph.path
            w: glyph.width
            h: glyph.height
          if names.length > 0
            for alias in names
              data.aliases[alias] = name
            icon.aliases = names
          data.icons[name] = icon
    return data
  .then JSON.stringify
  .then (string) ->
    fs.writeFileSync(path.resolve(__dirname+"/../icons/#{setname}.json"),string)
for setname, set of sets
  processSet(setname,set)
