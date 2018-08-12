
###
 * Federated Wiki : MathKaTeX Plugin
 *
 * Licensed under the MIT license.
 * https://github.com/edwintorok/wiki-plugin-mathkatex/blob/master/LICENSE.txt
###

emit = ($item, item) ->
  if (!$("link[href='https://cdn.jsdelivr.net/npm/katex@0.10.0-beta/dist/katex.min.css']").length)
    $('<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.10.0-beta/dist/katex.min.css" integrity="sha256-sI/DdD47R/Sa54XZDNFjRWlS+Dv8MC5xfkqQLRh0Jes=" crossorigin="anonymous">').appendTo("head")
  $item.append """<p style="background-color:#eee;padding:15px;">#{wiki.resolveLinks(item.text)}</p>"""

bind = ($item, item) ->
  errorCallback = (err, msg) ->
    $item.append """<p class="error">#{_.escape err}: #{_.escape msg}</p>"""
  wiki.getScript 'https://cdn.jsdelivr.net/npm/katex@0.10.0-beta/dist/katex.min.js', ->
    wiki.getScript 'https://cdn.jsdelivr.net/npm/katex@0.10.0-beta/dist/contrib/auto-render.min.js', ->
        renderMathInElement($item.get(0), { errorCallback })
  $item.dblclick -> wiki.textEditor $item, item

window.plugins.mathkatex = {emit, bind} if window?
