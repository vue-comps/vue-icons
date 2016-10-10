# out: ../icon-loader.js

camelize = (str) -> str.replace /-(\w)/g, (_, c) -> if c then c.toUpperCase() else ''

convertToText = (obj) ->
  string = []
  if obj == undefined
    return String(obj)
  else if (Array.isArray and Array.isArray(obj)) or
      Object.prototype.toString.call(obj) == '[object Array]'
    for prop in obj
      string.push(convertToText(obj[prop]))
    return "[" + string.join(",") + "]"
  else if typeof(obj) == "function"
    string.push(obj.toString())

  else if typeof(obj) == "object" and obj?
    for key,val of obj
      string.push(key + ": " + convertToText(val))
    return "{" + string.join(",") + "}"
  else
    string.push(JSON.stringify(obj))
  return string.join(",")

module.exports = (icons) ->
  return getIcons: ->
    allIcons =
      fa: require("./icons/fa.json")
      glyphicon: require("./icons/glyphicon.json")
      material: require("./icons/material.json")
      mdi: require("./icons/mdi.json")
      octicon: require("./icons/octicon.json")
      iconic: require("./icons/iconic.json")
      im: require("./icons/im.json")
      ra: require("./icons/ra.json")
    sets = {}
    for iconname in icons
      tmp = iconname.split("-")
      coll = tmp.shift()
      name = tmp.join("-")
      if allIcons[coll].aliases[name]
        name = allIcons[coll].aliases[name]
      icon = allIcons[coll].icons[name]
      throw new Error "vue-icons: #{name} not found in icon collection: #{coll}" unless icon
      sets[coll] = {a:{},i:{}} unless sets[coll]
      cName = camelize(name)
      unless sets[coll].i[cName]?
        sets[coll].i[cName] = d:icon.d, w:icon.w, h:icon.h
        if icon.aliases?
          for alias in icon.aliases
            sets[coll].a[camelize(alias)] = cName
    return """
    var sets = #{convertToText(sets)}

    function getIcon(coll, name) {
      set = sets[coll]
      if (process.env.NODE_ENV !== 'production' && (typeof set === "undefined" || set === null)){
        console.warn("vue-icons - icon collection "+coll+" not found, is your webpack set up correctly?")
      }
      if (set.a[name] != null) {
        name = set.a[name]
      }
      var icon = set.i[name]
      if (process.env.NODE_ENV !== 'production' && (typeof icon === "undefined" || icon === null)) {
        console.warn("vue-icons - icon "+coll+"-"+name+" not found, is your webpack set up correctly?")
      }
      return icon
    }
    """
