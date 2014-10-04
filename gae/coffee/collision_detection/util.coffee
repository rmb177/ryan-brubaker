# Common drawing functions used by all three demos

window.Collision = {}

class Collision.Util

   drawBall: (ball, radius) ->
      context = document.getElementById("bounds").getContext('2d')
      context.beginPath()
      context.moveTo(ball.posX, ball.posY)
      context.arc(ball.posX, ball.posY, radius, 0, Math.PI * 2, false)
      context.closePath()
      context.fill()
      context.stroke()
      
   clearCanvas: ->
      context = document.getElementById("bounds").getContext('2d')
      context.clearRect(0, 0, context.canvas.width, context.canvas.height)