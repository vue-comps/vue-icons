env = null
describe "icon", ->

  describe "basic env", ->

    before ->
      env = loadComp(require("../dev/basic.vue"))

    after ->
      unloadComp(env)

    it "should font awesome", ->
      el = env.$refs.fa.$el
      el.should.have.attr "viewBox", "0 0 1792 1792"
      el.firstChild.should.have.attr "d","M1699 186q0 35-43 78l-632 632v768h320q26 0 45 19t19 45-19 45-45 19H448q-26 0-45-19t-19-45 19-45 45-19h320V896L136 264q-43-43-43-78 0-23 18-36.5t38-17.5 43-4h1408q23 0 43 4t38 17.5 18 36.5z"

    it "should material design icons", ->
      el = env.$refs.mdi.$el
      el.should.have.attr "viewBox", "0 0 512 512"
      el.firstChild.should.have.attr "d","M213.3 85.3c47.2 0 85.4 38.2 85.4 85.4S260.5 256 213.3 256 128 217.8 128 170.7s38.2-85.4 85.3-85.4m0 213.4c94.3 0 170.7 38.2 170.7 85.3v42.7H42.7V384c0-47.1 76.3-85.3 170.6-85.3M426.7 256V149.3h42.6V256h-42.6m0 85.3v-42.6h42.6v42.6h-42.6z"

    it "should google material icons", ->
      el = env.$refs.material.$el
      el.should.have.attr "viewBox", "0 0 512 512"
      el.firstChild.should.have.attr "d","M484 405c9 6 9 21-2 30l-49 49c-9 9-21 9-30 0L209 290c-49 19-106 9-147-32-43-43-54-107-28-158l94 92 64-64-92-92c51-23 115-15 158 28 41 41 51 98 32 147z"

    it "should octicons", ->
      el = env.$refs.octicon.$el
      el.should.have.attr "viewBox", "0 0 2880 1024"
      el.firstChild.should.have.attr "d","M553 332H312c-7 0-12 5-12 11v118c0 6 5 11 12 11h94v147s-21 7-80 7c-69 0-165-25-165-237s101-239 195-239c81 0 116 14 139 21 7 2 13-5 13-11l27-114c0-3-1-6-4-9-9-6-65-37-205-37C165 0 0 68 0 397s189 379 348 379c132 0 212-57 212-57 3-1 4-6 4-8V343c0-6-5-11-12-11h1zM1773 28h-136c-6 0-11 5-11 11v262h-212V39c0-6-5-11-11-11h-136c-6 0-11 5-11 11v711c0 6 6 11 11 11h136c6 0 11-5 11-11V446h212l-1 304c0 6 5 11 11 11h136c6 0 11-5 11-11V39c0-6-5-11-11-11h1zM716 44c-49 0-88 39-88 88s39 88 88 88c48 0 87-39 87-88s-39-88-87-88zm78 227c0-6-5-11-11-11H647c-6 0-11 6-11 13v470c0 13 8 17 19 17h123c13 0 16-6 16-17V271zm1505-10h-134c-7 0-11 5-11 12v348s-35 25-83 25-62-22-62-70V272c0-6-5-11-11-11h-137c-6 0-11 5-11 11v327c0 141 79 176 187 176 89 0 161-49 161-49s3 25 5 29c1 3 6 6 10 6h86c7 0 11-5 11-11l1-478c0-6-5-11-12-11zm369-16c-77 0-129 34-129 34V38c0-6-5-11-11-11h-136c-6 0-11 5-11 11l-1 711c0 6 6 11 12 11h95c4 0 7-1 9-5 3-4 6-33 6-33s56 53 161 53c124 0 195-63 195-282s-113-248-190-248zm-53 401c-47-1-78-23-78-23V398s31-19 69-22c49-5 96 10 96 126 0 122-21 146-87 144zm-1429-3c-6 0-21 3-37 3-50 0-67-23-67-53V393h102c6 0 10-5 10-12V272c0-6-5-11-10-11h-102V126c0-5-3-8-9-8H935c-6 0-9 3-9 8v139s-70 17-74 18c-5 1-8 6-8 11v87c0 7 5 12 11 12h71v210c0 156 109 172 183 172 34 0 75-11 81-14 4-1 6-6 6-10v-96c0-7-5-12-11-12h1z"

    it "should iconic", ->
      el = env.$refs.iconic.$el
      el.should.have.attr "viewBox", "0 0 900 800"
      el.firstChild.should.have.attr "d","M551 0c16 0 32 0 47 3l-97 97v200h200l97-97c3 15 3 31 3 47 0 138-112 250-250 250-32 0-62-8-90-19L173 772c-20 20-46 28-72 28s-52-8-72-28c-39-39-39-105 0-144l291-287c-11-28-19-59-19-91C301 112 413 0 551 0zM101 650c-28 0-50 22-50 50s22 50 50 50 50-22 50-50-22-50-50-50z"

    it "should flip horizontal", ->
      el = env.$refs.horizontal.$el
      el.should.have.attr "viewBox", "0 -1792 2048 1792"
      el.firstChild.should.have.attr "transform","scale(1,-1)"

    it "should flip vertical", ->
      el = env.$refs.vertical.$el
      el.should.have.attr "viewBox", "-1792 0 1792 1792"
      el.firstChild.should.have.attr "transform","scale(-1,1)"

    it "should size", ->
      el = env.$refs.size.$el
      el.should.have.attr "height", "32"

    it "should scale", ->
      el = env.$refs.scale.$el
      el.should.have.attr "height", "32"

    it "should color", ->
      el = env.$refs.color.$el
      el.should.have.attr("style").match(/color: red/)

    it "should hcenter", (done) ->
      el = env.$refs.hcenter.$el
      env.$nextTick ->
        el.should.have.attr("style").match(/margin-top: 12px/)
        done()


  describe "font-compatible env", ->

    before ->
      env = loadComp(require("../dev/font-compatible.vue"))

    after ->
      unloadComp(env)

    it "should size", (done) ->
      el = env.$refs.size.$el
      env.$nextTick ->
        el.should.have.attr "height", "20"
        done()

    it "should line-height", (done) ->
      el = env.$refs.lineHeight.$el
      env.$nextTick ->
        el.should.have.attr("style").match(/margin-top: 10px/)
        done()
