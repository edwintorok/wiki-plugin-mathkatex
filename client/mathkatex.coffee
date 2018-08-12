
###
 * Federated Wiki : MathKaTeX Plugin
 *
 * Licensed under the MIT license.
 * https://github.com/edwintorok/wiki-plugin-mathkatex/blob/master/LICENSE.txt
###

emit = ($item, item) ->
  if (!$("link[href='/plugins/mathkatex/css/katex.min.css']").length)
    $('<link rel="stylesheet" href="/plugins/mathkatex/css/katex.min.css" crossorigin="anonymous">').appendTo("head")
  $item.append """<p style="background-color:#eee;padding:15px;">#{wiki.resolveLinks(item.text)}</p>"""

bind = ($item, item) ->
  errorCallback = (err, msg) ->
    $item.append """<p class="error">#{_.escape err}: #{_.escape msg}</p>"""
  wiki.getScript '/plugins/mathkatex/js/katex.min.js', ->
    wiki.getScript '/plugins/mathkatex/js/auto-render.min.js', ->
        renderMathInElement($item.get(0), { errorCallback })
  $item.dblclick -> wiki.textEditor $item, item

window.plugins.mathkatex = {emit, bind} if window?
