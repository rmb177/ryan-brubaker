
context = null
kUpArrow = 38
kDownArrow = 40
kWKey = 87
kSKey = 83

leftScore = 0
rightScore = 0

movingLeftPaddleUp = false
movingLeftPaddleDown = false
movingRightPaddleUp = false
movingRightPaddleDown = false

ball = {}
leftPaddle = {}
rightPaddle = {}

frameTimer = null
gameOver = false


clearCanvas = ->
   context.clearRect(0, 0, context.canvas.width, context.canvas.height)
   
drawBall = ->
   context.beginPath()
   context.moveTo(ball.posX, ball.posY)
   context.arc(ball.posX, ball.posY, 20, 0, Math.PI*2, false)
   context.closePath()
   context.fill()
   context.stroke()
   
updateScoreDisplay = ->
   scoreContext = document.getElementById("score").getContext('2d')
   scoreContext.clearRect(0, 0, scoreContext.canvas.width, scoreContext.canvas.height)
   scoreContext.font = "bold 48px sans-serif";
   scoreContext.fillText(leftScore, 10, 40);
   scoreContext.fillText(rightScore, 925, 40);


nextFrame = ->
   clearCanvas()

   ball.posX = ball.posX + ball.velocityX
   ball.posY = ball.posY + ball.velocityY
   drawBall()

   gameOver = false

   # Check if we collided with left paddle
   if (leftPaddle.posX <= ball.posX <= (leftPaddle.posX + leftPaddle.width)) and
    (leftPaddle.posY <= ball.posY <= (leftPaddle.posY + leftPaddle.height)) and
    ball.velocityX < 0
      ball.velocityX = -ball.velocityX
   
   if (rightPaddle.posX <= ball.posX <= (rightPaddle.posX + rightPaddle.width)) and
    (rightPaddle.posY <= ball.posY <= (rightPaddle.posY + rightPaddle.height)) and
    ball.velocityX > 0
      ball.velocityX = -ball.velocityX
   
   if ball.posX < -1 and ball.velocityX < 0
      gameOver = true
      rightScore += 1
      updateScoreDisplay()
   else if ball.posX > 1000 and ball.velocityX > 0
      gameOver = true
      leftScore += 1
      updateScoreDisplay()
   
      
   if (ball.posY < -1 and ball.velocityY < 0) or (ball.posY > 450 and ball.velocityY > 0)
      ball.velocityY = -ball.velocityY       

   leftPaddle.posY -= 5 if movingLeftPaddleUp and leftPaddle.posY > 0
   leftPaddle.posY += 5 if movingLeftPaddleDown and leftPaddle.posY < 350
   rightPaddle.posY -= 5 if movingRightPaddleUp and rightPaddle.posY > 0
   rightPaddle.posY += 5 if movingRightPaddleDown and rightPaddle.posY < 350

   context.fillRect(leftPaddle.posX, leftPaddle.posY, leftPaddle.width, leftPaddle.height)
   context.fillRect(rightPaddle.posX, rightPaddle.posY, rightPaddle.width, rightPaddle.height)
      
   frameTimer = setTimeout(nextFrame, 10) if not gameOver


setInitialPositions = ->
   
   ball =
   {
      velocityX: (Math.random() * 3 + 3) * (if Math.random() > 0.5 then 1 else -1),
      velocityY: (Math.random() * 3 + 3) * (if Math.random() > 0.5 then 1 else -1),
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

init = ->
   setInitialPositions()
   updateScoreDisplay()
   context = document.getElementById("bounds").getContext('2d')
   frameTimer = setTimeout(nextFrame, 10)
  
   $(document).on('keydown',
      (event) -> 
         switch event.keyCode
            when kWKey then [movingLeftPaddleUp, movingLeftPaddleDown] = [true, false]
            when kSKey then [movingLeftPaddleUp, movingLeftPaddleDown] = [false, true]
            when kUpArrow then [movingRightPaddleUp, movingRightPaddleDown] = [true, false]
            when kDownArrow then [movingRightPaddleUp, movingRightPaddleDown] = [false, true]
         return false
   )

   $(document).on('keyup',
      (event) -> 
         switch event.keyCode
            when kWKey then [movingLeftPaddleUp, movingLeftPaddleDown] = [false, false]
            when kSKey then [movingLeftPaddleUp, movingLeftPaddleDown] = [false, false]
            when kUpArrow then [movingRightPaddleUp, movingRightPaddleDown] = [false, false]
            when kDownArrow then [movingRightPaddleUp, movingRightPaddleDown] = [false, false]
         return true
   )
   
   $ ->
      $('#playAgainBtn').on('click', 
         ->
            gameOver = false
            setInitialPositions()
            frameTimer = setTimeout(nextFrame, 10))
       


$(document).ready init
