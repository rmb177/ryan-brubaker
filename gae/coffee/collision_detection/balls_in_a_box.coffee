balls =
[
   { velocityX: 2, velocityY: -3, posX: 0, posY: 0 },
   { velocityX: 1, velocityY:  4, posX: 0, posY: 0 },
   { velocityX: 2, velocityY:  1, posX: 0, posY: 0 },
   { velocityX: 3, velocityY: -2, posX: 0, posY: 0 }
]

frameTimer = null

clearCanvas = ->
   context = document.getElementById("bounds").getContext('2d')
   context.clearRect(0, 0, context.canvas.width, context.canvas.height)

drawBall = (ball) ->
   context = document.getElementById("bounds").getContext('2d')
   context.beginPath()
   context.moveTo(ball.posX, ball.posY)
   context.arc(ball.posX, ball.posY, 10, 0, Math.PI*2, false)
   context.closePath()
   context.fill()
   context.stroke()
   
nextFrame = ->
   clearCanvas()
   for ball in balls
      ball.posX = ball.posX + ball.velocityX
      ball.posY = ball.posY + ball.velocityY
      drawBall ball
      
      if (ball.posX < -1 and ball.velocityX < 0) or (ball.posX > 300 and ball.velocityX > 0)
         ball.velocityX = -ball.velocityX
         
      if (ball.posY < -1 and ball.velocityY < 0) or (ball.posY > 300 and ball.velocityY > 0)
         ball.velocityY = -ball.velocityY       
            
   frameTimer = setTimeout(nextFrame, 10)


init = ->
   for ball in balls
      ball.posX = Math.random() * 250
      ball.posY = Math.random() * 250
      drawBall ball

   frameTimer = setTimeout(nextFrame, 10)


$(document).ready init


