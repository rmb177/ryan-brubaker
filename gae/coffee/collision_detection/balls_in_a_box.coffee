BALL_RADIUS = 10
lastTime = 0
util = new Collision.Util


balls =
[
   { velocityX: 200, velocityY: -300, posX: 0, posY: 0 }
   { velocityX: 100, velocityY:  400, posX: 0, posY: 0 },
   { velocityX: 200, velocityY:  100, posX: 0, posY: 0 },
   { velocityX: 300, velocityY: -200, posX: 0, posY: 0 }
]

# update the position of each ball
update = (delta) ->
   for ball in balls
      ball.posX = ball.posX + ball.velocityX * delta
      ball.posY = ball.posY + ball.velocityY * delta

# draw each ball and reverse direction if it has bumped into the side o the box
render = ->
   util.clearCanvas()
   for ball in balls
      util.drawBall(ball, BALL_RADIUS)
      
      if (ball.posX < -1 and ball.velocityX < 0) or (ball.posX > 300 and ball.velocityX > 0)
         ball.velocityX = -ball.velocityX
         
      if (ball.posY < -1 and ball.velocityY < 0) or (ball.posY > 300 and ball.velocityY > 0)
         ball.velocityY = -ball.velocityY  

mainLoop = =>
   now = Date.now()
   delta = (now - lastTime) / 1000
   
   update(delta)
   render()
   lastTime = now
   window.requestAnimationFrame(mainLoop)

init = ->
   for ball in balls
      ball.posX = Math.random() * 250
      ball.posY = Math.random() * 250
      util.drawBall(ball, BALL_RADIUS)
   
   lastTime = Date.now()
   mainLoop() 
   
$(document).ready init


