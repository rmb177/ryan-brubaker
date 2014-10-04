// Generated by CoffeeScript 1.3.1
(function() {
  var BALL_RADIUS, balls, init, lastTime, mainLoop, render, update, util,
    _this = this;

  BALL_RADIUS = 10;

  lastTime = 0;

  util = new Collision.Util;

  balls = [
    {
      velocityX: 200,
      velocityY: -300,
      posX: 0,
      posY: 0
    }, {
      velocityX: 100,
      velocityY: 400,
      posX: 0,
      posY: 0
    }, {
      velocityX: 200,
      velocityY: 100,
      posX: 0,
      posY: 0
    }, {
      velocityX: 300,
      velocityY: -200,
      posX: 0,
      posY: 0
    }
  ];

  update = function(delta) {
    var ball, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = balls.length; _i < _len; _i++) {
      ball = balls[_i];
      ball.posX = ball.posX + ball.velocityX * delta;
      _results.push(ball.posY = ball.posY + ball.velocityY * delta);
    }
    return _results;
  };

  render = function() {
    var ball, _i, _len, _results;
    util.clearCanvas();
    _results = [];
    for (_i = 0, _len = balls.length; _i < _len; _i++) {
      ball = balls[_i];
      util.drawBall(ball, BALL_RADIUS);
      if ((ball.posX < -1 && ball.velocityX < 0) || (ball.posX > 300 && ball.velocityX > 0)) {
        ball.velocityX = -ball.velocityX;
      }
      if ((ball.posY < -1 && ball.velocityY < 0) || (ball.posY > 300 && ball.velocityY > 0)) {
        _results.push(ball.velocityY = -ball.velocityY);
      } else {
        _results.push(void 0);
      }
    }
    return _results;
  };

  mainLoop = function() {
    var delta, now;
    now = Date.now();
    delta = (now - lastTime) / 1000;
    update(delta);
    render();
    lastTime = now;
    return window.requestAnimationFrame(mainLoop);
  };

  init = function() {
    var ball, _i, _len;
    for (_i = 0, _len = balls.length; _i < _len; _i++) {
      ball = balls[_i];
      ball.posX = Math.random() * 250;
      ball.posY = Math.random() * 250;
      util.drawBall(ball, BALL_RADIUS);
    }
    lastTime = Date.now();
    return mainLoop();
  };

  $(document).ready(init);

}).call(this);
