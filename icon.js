;(function(){
var camelize, getIcon, getIcons;

camelize = function(str) {
  return str.replace(/-(\w)/g, function(_, c) {
    if (c) {
      return c.toUpperCase();
    } else {
      return '';
    }
  });
};

getIcons = function() {};

getIcons();

if (process.env.NODE_ENV !== 'production' && (typeof getIcon === "undefined" || getIcon === null)) {
  console.error("icon-loader wasn't called - please see vue-icons documentation on how to setup webpack");
  getIcon = function(name1, name2) {
    return console.error("vue-icons isn't setup properly - failed to get " + name1 + "-" + name2);
  };
}

module.exports = {
  mixins: [require("vue-mixins/vue"), require("vue-mixins/style"), require("vue-mixins/onWindowResize")],
  props: {
    style: {
      "default": function() {
        return [];
      }
    },
    name: {
      type: String,
      required: true
    },
    size: {
      type: Number,
      "default": 16
    },
    scale: {
      type: Number,
      "default": 1
    },
    offsetX: {
      type: Number,
      "default": 0
    },
    offsetY: {
      type: Number,
      "default": 0
    },
    flipH: {
      type: Boolean,
      "default": false
    },
    flipV: {
      type: Boolean,
      "default": false
    },
    label: String,
    hcenter: {
      type: Boolean,
      "default": false
    }
  },
  data: function() {
    return {
      parent: null,
      children: []
    };
  },
  mounted: function() {
    var child, i, len, ref;
    ref = this.$children;
    for (i = 0, len = ref.length; i < len; i++) {
      child = ref[i];
      if (child.isStack) {
        this.children.push(child);
      }
    }
    return this.$nextTick(function() {
      this.parent = this.$el.parentElement;
      return this.onWindowResize((function(_this) {
        return function() {
          if (_this.hcenter) {
            return _this.parent = _this.$el.parentElement;
          }
        };
      })(this));
    });
  },
  computed: {
    processedName: function() {
      var set, tmp;
      tmp = this.name.split("-");
      set = tmp.shift();
      return [set, tmp.join("-")];
    },
    icon: function() {
      return getIcon(this.processedName[0], camelize(this.processedName[1]));
    },
    box: function() {
      var h, hOffset, s, w, wOffset;
      if (!this.heightRatio) {
        return null;
      }
      w = this.icon.w;
      h = this.icon.h;
      wOffset = -w * ((this.widthRatio - 1) / 2 + this.offsetX / 100);
      hOffset = -h * ((this.heightRatio - 1) / 2 - this.offsetY / 100);
      if (this.flipV) {
        s = "-" + (w + wOffset) + " ";
      } else {
        s = wOffset + " ";
      }
      if (this.flipH) {
        s += "-" + (h + hOffset) + " ";
      } else {
        s += hOffset + " ";
      }
      return s + ((w * this.widthRatio) + " " + (h * this.heightRatio));
    },
    aspect: function() {
      return this.icon.w / this.icon.h;
    },
    innerWidth: function() {
      return this.aspect * this.innerHeight;
    },
    outerWidth: function() {
      var child, cw, i, len, ref, w;
      w = this.innerWidth;
      ref = this.children;
      for (i = 0, len = ref.length; i < len; i++) {
        child = ref[i];
        cw = child.innerWidth * (1 + Math.abs(child.offsetX) / 50);
        if (cw > w) {
          w = cw;
        }
      }
      return w;
    },
    widthRatio: function() {
      return this.outerWidth / this.innerWidth;
    },
    innerHeight: function() {
      return this.size * this.scale;
    },
    outerHeight: function() {
      var ch, child, h, i, len, ref;
      if (this.hcenter && (this.parent != null)) {
        return this.parent.clientHeight;
      }
      h = this.innerHeight;
      ref = this.children;
      for (i = 0, len = ref.length; i < len; i++) {
        child = ref[i];
        ch = child.innerHeight * (1 + Math.abs(child.offsetY) / 50);
        if (ch > h) {
          h = ch;
        }
      }
      return h;
    },
    heightRatio: function() {
      return this.outerHeight / this.innerHeight;
    },
    flipped: function() {
      if (!(this.flipH || this.flipV)) {
        return null;
      }
      return "scale(" + (-this.flipV * 2 + 1) + "," + (-this.flipH * 2 + 1) + ")";
    },
    mergeStyle: function() {
      var ref, style;
      style = {
        display: "inline-block",
        height: this.outerHeight + "px"
      };
      if (((ref = this.children) != null ? ref.length : void 0) > 0) {
        style.position = "relative";
      }
      return style;
    }
  }
};

})()
if (module.exports.__esModule) module.exports = module.exports.default
var __vue__options__ = (typeof module.exports === "function"? module.exports.options: module.exports)
__vue__options__.render = function render () {var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;return _c('span',{style:(_vm.computedStyle)},[_c('svg',{attrs:{"version":"1.1","role":_vm.label ? 'img' : 'presentation',"aria-label":_vm.label,"width":_vm.outerWidth,"height":_vm.outerHeight,"viewBox":_vm.box}},[_c('path',{attrs:{"d":_vm.icon.d,"transform":_vm.flipped,"fill":"currentColor"}})]),_vm._t("default")],2)}
__vue__options__.staticRenderFns = []
