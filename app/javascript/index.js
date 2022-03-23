window.addEventListener('load', function(){

  const pullDownButton = document.getElementById("menus")
  const pullDownParents = document.getElementById("pull-down-mn")

  pullDownButton.addEventListener('mouseover', function(){
    pullDownButton.setAttribute("style", "background-color:#dfedfc;")
  })

  pullDownButton.addEventListener('mouseout', function(){
    pullDownButton.removeAttribute("style", "background-color:#dfedfc;")
  })

  pullDownButton.addEventListener('click', function() {
    // プルダウンメニューの表示と非表示の設定
    if (pullDownParents.getAttribute("style") == "display:block;") {
      // pullDownParentsにdisplay:block;が付与されている場合（つまり表示されている時）実行される
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      // pullDownParentsにdisplay:block;が付与されていない場合（つまり非表示の時）実行される
      pullDownParents.setAttribute("style", "display:block;")
        }
  })

})

window.addEventListener('load', function(){

  const pullDownButton = document.getElementById("categories")
  const pullDownParents = document.getElementById("pull-down-ct")


  pullDownButton.addEventListener('mouseover', function(){
    pullDownButton.setAttribute("style", "background-color:#dfedfc;")
  })

  pullDownButton.addEventListener('mouseout', function(){
    pullDownButton.removeAttribute("style", "background-color:#dfedfc;")
  })

  pullDownButton.addEventListener('click', function() {
    // プルダウンメニューの表示と非表示の設定
    if (pullDownParents.getAttribute("style") == "display:block;") {
      // pullDownParentsにdisplay:block;が付与されている場合（つまり表示されている時）実行される
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      // pullDownParentsにdisplay:block;が付与されていない場合（つまり非表示の時）実行される
      pullDownParents.setAttribute("style", "display:block;")
        }
  })

})
