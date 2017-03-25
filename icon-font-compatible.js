(function() {
  var c, i, ifc, j, k, len, len1, prop, ref, ref1;

  i = require("./icon");

  ifc = {
    render: i.render,
    mixins: i.mixins,
    data: function() {
      return {
        elstyle: null
      };
    },
    mounted: function() {
      return this.$nextTick(function() {
        this.elstyle = window.getComputedStyle(this.$el);
        return this.onWindowResize((function(_this) {
          return function() {
            return _this.elstyle = window.getComputedStyle(_this.$el);
          };
        })(this));
      });
    },
    props: {},
    computed: {
      outerWidth: i.computed.innerWidth,
      innerHeight: function() {
        if (this.elstyle) {
          return parseFloat(this.elstyle.getPropertyValue("font-size").replace("px", ""));
        }
        return null;
      },
      outerHeight: function() {
        var lh;
        if (this.elstyle) {
          lh = this.elstyle.getPropertyValue("line-height");
          if (lh !== "normal") {
            return parseFloat(lh.replace("px", ""));
          } else {
            return this.innerHeight;
          }
        }
        return null;
      },
      widthRatio: function() {
        return 1;
      },
      mergeStyle: function() {
        return {
          height: this.outerHeight + "px"
        };
      }
    }
  };

  ref = ["name", "offsetX", "offsetY", "flipH", "flipV", "label", "style"];
  for (j = 0, len = ref.length; j < len; j++) {
    prop = ref[j];
    ifc.props[prop] = i.props[prop];
  }

  ref1 = ["processedName", "icon", "box", "aspect", "flipped", "heightRatio"];
  for (k = 0, len1 = ref1.length; k < len1; k++) {
    c = ref1[k];
    ifc.computed[c] = i.computed[c];
  }

  module.exports = ifc;

}).call(this);
