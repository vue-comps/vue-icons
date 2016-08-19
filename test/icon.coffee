env = null
describe "icon", ->

  describe "basic env", ->

    before ->
      env = loadComp(require("../dev/basic.vue"))

    after ->
      unloadComp(env)

    it "should font awesome", ->
      el = env.$refs.fa.$el.firstChild
      el.should.have.attr "viewBox", "0 0 1792 1792"
      el.firstChild.should.have.attr "d","M1699 186q0 35-43 78l-632 632v768h320q26 0 45 19t19 45-19 45-45 19H448q-26 0-45-19t-19-45 19-45 45-19h320V896L136 264q-43-43-43-78 0-23 18-36.5t38-17.5 43-4h1408q23 0 43 4t38 17.5 18 36.5z"

    it "should material design icons", ->
      el = env.$refs.mdi.$el.firstChild
      el.should.have.attr "viewBox", "0 0 512 512"
      el.firstChild.should.have.attr "d","M213.3 85.3c47.2 0 85.4 38.2 85.4 85.4S260.5 256 213.3 256 128 217.8 128 170.7s38.2-85.4 85.3-85.4m0 213.4c94.3 0 170.7 38.2 170.7 85.3v42.7H42.7V384c0-47.1 76.3-85.3 170.6-85.3M426.7 256V149.3h42.6V256h-42.6m0 85.3v-42.6h42.6v42.6h-42.6z"

    it "should google material icons", ->
      el = env.$refs.material.$el.firstChild
      el.should.have.attr "viewBox", "0 0 512 512"
      el.firstChild.should.have.attr "d","M484 405c9 6 9 21-2 30l-49 49c-9 9-21 9-30 0L209 290c-49 19-106 9-147-32-43-43-54-107-28-158l94 92 64-64-92-92c51-23 115-15 158 28 41 41 51 98 32 147z"

    it "should octicons", ->
      el = env.$refs.octicon.$el.firstChild
      el.should.have.attr "viewBox", "0 0 96 96"
      el.firstChild.should.have.attr "d","M40 26h-1 1zm0 0v4h-3q-6 0-6-6v-7h-3v-3l3-1V8h5v5h4v4h-4v7q0 2 2 2h2zm50-5q0-5-3-4l-2 1v7q1 1 2 1 3 0 3-5zm5 0q0 9-6 9l-6-2v2h-3l-1-1V6l1-1h4l1 1v8q1-2 4-2 6 0 6 9zm-18-8v17h-3l-1-1v-1q-2 2-5 2-6 0-6-6V13h5v10q0 3 2 3l3-1V13h5zm-51 0v17h-4q-1 0-1-1V13h5zm-2-7q3 0 3 3t-3 3-3-3 3-3zm35-1v25h-4l-1-1V19h-7v11h-5V5h5v9h7V6l1-1h4zM19 16v12q-3 2-7 2Q0 30 0 17T11 4q5 0 7 2l-1 4q-3-1-5-1-7 0-7 8t6 8h3v-5h-4v-5h8z"

    it "should iconic", ->
      el = env.$refs.iconic.$el.firstChild
      el.should.have.attr "viewBox", "0 0 900 800"
      el.firstChild.should.have.attr "d","M551 0c16 0 32 0 47 3l-97 97v200h200l97-97c3 15 3 31 3 47 0 138-112 250-250 250-32 0-62-8-90-19L173 772c-20 20-46 28-72 28s-52-8-72-28c-39-39-39-105 0-144l291-287c-11-28-19-59-19-91C301 112 413 0 551 0zM101 650c-28 0-50 22-50 50s22 50 50 50 50-22 50-50-22-50-50-50z"

    it "should glyphicon", ->
      el = env.$refs.glyphicon.$el.firstChild
      el.should.have.attr "viewBox", "0 0 1200 1200"
      el.firstChild.should.have.attr "d","M649 251q48-68 109.5-104T880 108.5t118.5 20 102.5 64 71 100.5 27 123q0 57-33.5 117.5t-94 124.5T945 785.5 795 938t-146 174q-62-85-145.5-174t-150-152.5T227 658t-93.5-124.5T100 416q0-64 28-123t73-100.5 104-64 119-20T544.5 147 649 251z"

    it "should flip horizontal", ->
      el = env.$refs.horizontal.$el.firstChild
      el.should.have.attr "viewBox", "0 -1792 2048 1792"
      el.firstChild.should.have.attr "transform","scale(1,-1)"

    it "should flip vertical", ->
      el = env.$refs.vertical.$el.firstChild
      el.should.have.attr "viewBox", "-1792 0 1792 1792"
      el.firstChild.should.have.attr "transform","scale(-1,1)"

    it "should flip both", ->
      el = env.$refs.flipboth.$el.firstChild
      el.should.have.attr "viewBox", "-512 -512 512 512"
      el.firstChild.should.have.attr "transform","scale(-1,-1)"
    it "should size", ->
      el = env.$refs.size.$el.firstChild
      el.should.have.attr "height", "32"

    it "should scale", ->
      el = env.$refs.scale.$el.firstChild
      el.should.have.attr "height", "32"

    it "should color", ->
      el = env.$refs.color.$el
      el.should.have.attr("style").match(/color: red/)

    it "should hcenter", (done) ->
      el = env.$refs.hcenter.$el
      env.$nextTick ->
        el.should.have.attr("style").match(/padding-top: 12px/)
        done()


  describe "font-compatible env", ->

    before ->
      env = loadComp(require("../dev/font-compatible.vue"))

    after ->
      unloadComp(env)

    it "should size", (done) ->
      el = env.$refs.size.$el.firstChild
      env.$nextTick ->
        el.should.have.attr "height", "20"
        done()

    it "should line-height", (done) ->
      el = env.$refs.lineHeight.$el
      env.$nextTick ->
        el.should.have.attr("style").match(/padding-top: 10px/)
        done()
