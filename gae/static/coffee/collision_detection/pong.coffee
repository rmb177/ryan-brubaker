UP_ARROW = 38
DOWN_ARROW = 40
W_KEY = 87
S_KEY = 83
BALL_RADIUS = 20

context = null
util = new Collision.Util

leftScore = 0
rightScore = 0

movingLeftPaddleUp = false
movingLeftPaddleDown = false
movingRightPaddleUp = false
movingRightPaddleDown = false

ball = {}
leftPaddle = {}
rightPaddle = {}

gameOver = false
lastTime = 0
   
updateScoreDisplay = ->
   scoreContext = document.getElementById("score").getContext('2d')
   scoreContext.clearRect(0, 0, scoreContext.canvas.width, scoreContext.canvas.height)
   scoreContext.font = "bold 48px sans-serif";
   scoreContext.fillText(leftScore, 10, 40);
   scoreContext.fillText(rightScore, 925, 40);

checkForPaddleCollision = ->
   if (leftPaddle.posX <= ball.posX <= (leftPaddle.posX + leftPaddle.width)) and
    (leftPaddle.posY <= ball.posY <= (leftPaddle.posY + leftPaddle.height)) and
    ball.velocityX < 0
      ball.velocityX = -ball.velocityX
      
   if (rightPaddle.posX <= ball.posX <= (rightPaddle.posX + rightPaddle.width)) and
    (rightPaddle.posY <= ball.posY <= (rightPaddle.posY + rightPaddle.height)) and
    ball.velocityX > 0
      ball.velocityX = -ball.velocityX
      
checkForEndGame = ->
   if ball.posX < -1 and ball.velocityX < 0
      gameOver = true
      rightScore += 1
   else if ball.posX > 1000 and ball.velocityX > 0
      gameOver = true
      leftScore += 1   
   
update = (delta) ->
   ball.posX = ball.posX + ball.velocityX * delta
   ball.posY = ball.posY + ball.velocityY * delta
   
   if (ball.posY < -1 and ball.velocityY < 0) or (ball.posY > 450 and ball.velocityY > 0)
      ball.velocityY = -ball.velocityY       
   
   leftPaddle.posY -= 300 * delta if movingLeftPaddleUp and leftPaddle.posY > 0
   leftPaddle.posY += 300 * delta if movingLeftPaddleDown and leftPaddle.posY < 350
   rightPaddle.posY -= 300 * delta if movingRightPaddleUp and rightPaddle.posY > 0
   rightPaddle.posY += 300 * delta if movingRightPaddleDown and rightPaddle.posY < 350   
   
   checkForPaddleCollision()
   checkForEndGame()
      
render = ->
   util.clearCanvas()
   updateScoreDisplay()
   
   util.drawBall(ball, BALL_RADIUS)
   context.fillRect(leftPaddle.posX, leftPaddle.posY, leftPaddle.width, leftPaddle.height)
   context.fillRect(rightPaddle.posX, rightPaddle.posY, rightPaddle.width, rightPaddle.height)

setInitialPositions = ->
   
   ball =
   {
      velocityX: (Math.random() * 3 + 5) * (if Math.random() > 0.5 then 1 else -1) * 60,
      velocityY: (Math.random() * 3 + 5) * (if Math.random() > 0.5 then 1 else -1) * 60,
      posX: 450,
      posY: 225,
   }

   # x/y = top/left corner
   leftPaddle =
   {
      posX: 25,
      posY: 175,
      width: 25,
      height: 100
   }

   # x/y = top/left corner
   rightPaddle =
   {
      posX: 925,
      posY: 175,
      width: 25,
      height: 100
   }
   
mainLoop = ->
   now = Date.now()
   delta = (now - lastTime) / 1000
   
   update(delta)
   render()
   lastTime = now
   
   window.requestAnimationFrame(mainLoop) if !gameOver

init = ->
   setInitialPositions()
   updateScoreDisplay()
   context = document.getElementById("bounds").getContext('2d')
  
   $(document).on('keydown',
      (event) -> 
         switch event.keyCode
            when W_KEY then [movingLeftPaddleUp, movingLeftPaddleDown] = [true, false]
            when S_KEY then [movingLeftPaddleUp, movingLeftPaddleDown] = [false, true]
            when UP_ARROW then [movingRightPaddleUp, movingRightPaddleDown] = [true, false]
            when DOWN_ARROW then [movingRightPaddleUp, movingRightPaddleDown] = [false, true]
         return false
   )

   $(document).on('keyup',
      (event) -> 
         switch event.keyCode
            when W_KEY then [movingLeftPaddleUp, movingLeftPaddleDown] = [false, false]
            when S_KEY then [movingLeftPaddleUp, movingLeftPaddleDown] = [false, false]
            when UP_ARROW then [movingRightPaddleUp, movingRightPaddleDown] = [false, false]
            when DOWN_ARROW then [movingRightPaddleUp, movingRightPaddleDown] = [false, false]
         return true
   )
   

   $('#playAgainBtn').on('click', 
      ->
         gameOver = false
         setInitialPositions()
         lastTime = Date.now()
         mainLoop()
   )
            
   lastTime = Date.now()
   mainLoop() 
       


$(document).ready init
