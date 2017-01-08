(function() {
  var camelize, convertToText;

  camelize = function(str) {
    return str.replace(/-(\w)/g, function(_, c) {
      if (c) {
        return c.toUpperCase();
      } else {
        return '';
      }
    });
  };

  convertToText = function(obj) {
    var i, key, len, prop, string, val;
    string = [];
    if (obj === void 0) {
      return String(obj);
    } else if ((Array.isArray && Array.isArray(obj)) || Object.prototype.toString.call(obj) === '[object Array]') {
      for (i = 0, len = obj.length; i < len; i++) {
        prop = obj[i];
        string.push(convertToText(obj[prop]));
      }
      return "[" + string.join(",") + "]";
    } else if (typeof obj === "function") {
      string.push(obj.toString());
    } else if (typeof obj === "object" && (obj != null)) {
      for (key in obj) {
        val = obj[key];
        string.push(key + ": " + convertToText(val));
      }
      return "{" + string.join(",") + "}";
    } else {
      string.push(JSON.stringify(obj));
    }
    return string.join(",");
  };

  module.exports = function(icons) {
    return {
      getIcons: function() {
        var alias, allIcons, cName, coll, i, icon, iconname, j, len, len1, name, ref, sets, tmp;
        allIcons = {
          fa: require("./icons/fa.json"),
          glyphicon: require("./icons/glyphicon.json"),
          material: require("./icons/material.json"),
          mdi: require("./icons/mdi.json"),
          octicon: require("./icons/octicon.json"),
          iconic: require("./icons/iconic.json"),
          im: require("./icons/im.json"),
          ra: require("./icons/ra.json")
        };
        sets = {};
        for (i = 0, len = icons.length; i < len; i++) {
          iconname = icons[i];
          tmp = iconname.split("-");
          coll = tmp.shift();
          name = tmp.join("-");
          if (allIcons[coll].aliases[name]) {
            name = allIcons[coll].aliases[name];
          }
          icon = allIcons[coll].icons[name];
          if (!icon) {
            throw new Error("vue-icons: " + name + " not found in icon collection: " + coll);
          }
          if (!sets[coll]) {
            sets[coll] = {
              a: {},
              i: {}
            };
          }
          cName = camelize(name);
          if (sets[coll].i[cName] == null) {
            sets[coll].i[cName] = {
              d: icon.d,
              w: icon.w,
              h: icon.h
            };
            if (icon.aliases != null) {
              ref = icon.aliases;
              for (j = 0, len1 = ref.length; j < len1; j++) {
                alias = ref[j];
                sets[coll].a[camelize(alias)] = cName;
              }
            }
          }
        }
        return "var sets = " + (convertToText(sets)) + "\n\nfunction getIcon(coll, name) {\n  set = sets[coll]\n  if (process.env.NODE_ENV !== 'production' && (typeof set === \"undefined\" || set === null)){\n    console.warn(\"vue-icons - icon collection \"+coll+\" not found, is your webpack set up correctly?\")\n  }\n  if (set.a[name] != null) {\n    name = set.a[name]\n  }\n  var icon = set.i[name]\n  if (process.env.NODE_ENV !== 'production' && (typeof icon === \"undefined\" || icon === null)) {\n    console.warn(\"vue-icons - icon \"+coll+\"-\"+name+\" not found, is your webpack set up correctly?\")\n  }\n  return icon\n}";
      }
    };
  };

}).call(this);
