BALL_RADIUS = 10
lastTime = 0
rotationAngle = 35
util = new Collision.Util

# Original coordinates of our square relative to the
# origin in the x/y plane. Used for rotation around
# the origin
rotationBounds = 
[
   { x: -150,  y:  150 },        # Top, left corner
   { x:  150,  y:  150 },        # Top, right corner
   { x:  150,  y: -150 },        # Bottom, right corner
   { x: -150,  y: -150 },        # Bottom, left corner
]

# Current coordinates of the square in canvas coordinate space
currentBoundaryPoints = 
[
   { x: 100, y: 100 },           # Top, left corner
   { x: 400, y: 100 },           # Top, right corner
   { x: 400, y: 400 },           # Bottom, right corner
   { x: 100, y: 400 }            # Bottom, left corner
]

# Normal vector to each "plane" side of our box. Coordinates
# are normalized to a square around the origin in the x/y plane 
# with each side having a normal of length 1 to the origin.
planes = 
[
   { x:  0, y:  1, dist: 1 },    # Top border
   { x:  1, y:  0, dist: 1 },    # Right border
   { x:  0, y: -1, dist: 1 },    # Bottom border
   { x: -1, y:  0, dist: 1 }     # Left border
]

# The ball bouncing around in a box. Coordinates and velocity
# are based on the canvas coordinate space
balls =
[
   { velocityX:  200, velocityY:  100, posX: 250, posY: 250 },
   { velocityX: -200, velocityY:  400, posX: 250, posY: 250 },
   { velocityX:  100, velocityY: -200, posX: 250, posY: 250 },
   { velocityX:  100, velocityY: -300, posX: 250, posY: 250 }
]
   
drawBoundaries = ->
   context = document.getElementById("bounds").getContext('2d')
   context.beginPath()
   context.strokeStyle = "#000"
   context.moveTo(currentBoundaryPoints[3].x, currentBoundaryPoints[3].y)
                  
   for point in currentBoundaryPoints
      context.lineTo(point.x, point.y)
      
   context.closePath()
   context.stroke()


# Translate a coordinate in our canvas coordinate space into
# the x/y plane coordinate space
normalizePoint = (point) ->
   return (point - 250) / 150

update = (delta) ->
   for ball in balls
      ball.posX = ball.posX + ball.velocityX * delta
      ball.posY = ball.posY + ball.velocityY * delta

render = ->
   util.clearCanvas()
   drawBoundaries()
   
   for ball in balls
      util.drawBall(ball, BALL_RADIUS)
      
      ## Determine if the ball has collided with a wall.
      for plane in planes
         distance = (normalizePoint(ball.posX) * plane.x) + (normalizePoint(ball.posY) * plane.y) + plane.dist
         
         # Save off current velocities to use in calculations below
         currentXVelocity = ball.velocityX
         currentYVelocity = ball.velocityY
         
         normalVelocity = (currentXVelocity * plane.x) + (currentYVelocity * plane.y)
         
         if distance < 0 and normalVelocity < 0
            ball.velocityX = currentXVelocity - (2 * plane.x * ( (currentXVelocity * plane.x) + (currentYVelocity * plane.y) ))
            ball.velocityY = currentYVelocity - (2 * plane.y * ( (currentXVelocity * plane.x) + (currentYVelocity * plane.y) ))
            

recalculateNormal = (plane, corner1, corner2) ->
   plane.x = normalizePoint((corner1.x + corner2.x) / 2)
   plane.y = normalizePoint((corner1.y + corner2.y) / 2)
   plane.dist = Math.sqrt(Math.pow(plane.x, 2) + Math.pow(plane.y, 2))


# Uses a rotation matrix to rotate box boundaries appropriately
rotateSquare = (degrees) ->
   radians = degrees * Math.PI / 180
   for i in [0..3]
      originPoint = rotationBounds[i]
      newPoint = currentBoundaryPoints[i]
      
      ## Add 250 to the point since we're working off square shifted over to the origin
      newPoint.x = (originPoint.x * Math.cos(radians)) + (originPoint.y * Math.sin(radians)) + 250
      newPoint.y = (originPoint.x * -Math.sin(radians)) + (originPoint.y * Math.cos(radians)) + 250

   recalculateNormal(planes[0], currentBoundaryPoints[0], currentBoundaryPoints[1])
   recalculateNormal(planes[1], currentBoundaryPoints[1], currentBoundaryPoints[2])
   recalculateNormal(planes[2], currentBoundaryPoints[2], currentBoundaryPoints[3])
   recalculateNormal(planes[3], currentBoundaryPoints[3], currentBoundaryPoints[0])

mainLoop = =>
   now = Date.now()
   delta = (now - lastTime) / 1000
   
   update(delta)
   render()
   lastTime = now
   window.requestAnimationFrame(mainLoop)

init = ->
   rotateSquare(rotationAngle)
   drawBoundaries()
   
   lastTime = Date.now()
   mainLoop() 

$(document).ready init


