context = document.getElementById("graph").getContext('2d')   

drawGraph = ->
   context.moveTo(50, 25)
   #context.strokeStyle = "#000"
   context.lineTo(50, 500)
   context.stroke()
   
   context.lineTo(750, 500)
   context.strokeStyle = "#eee"
   context.stroke()
   ###
   context.moveTo(46, 424.5)
   context.lineTo(54, 424.5)
   context.stroke()
   context.moveTo(50, 424.5)
   context.lineTo(750, 424.5)
   context.strokeStyle = "#eee"
   context.stroke()
   
   context.moveTo(46, 349.5)
   context.lineTo(54, 349.5)
   context.stroke()
   
   context.moveTo(46, 274.5)
   context.lineTo(54, 274.5)
   context.stroke()
   
   context.moveTo(46, 199.5)
   context.lineTo(54, 199.5)
   context.stroke()
   
   context.moveTo(46, 124.5)
   context.lineTo(54, 124.5)
   context.stroke()
   
   context.moveTo(46, 49.5)
   context.lineTo(54, 49.5)
   context.stroke()
   
   ###
   
   
   
init = ->
  drawGraph()
   
$(document).ready init


