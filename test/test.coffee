# build time tests for mathkatex plugin
# see http://mochajs.org/

mathkatex = require '../client/mathkatex'
expect = require 'expect.js'

describe 'mathkatex plugin', ->

  describe 'expand', ->

    it 'can make itallic', ->
      result = mathkatex.expand 'hello *world*'
      expect(result).to.be 'hello <i>world</i>'
