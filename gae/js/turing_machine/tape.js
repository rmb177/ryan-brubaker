// Generated by CoffeeScript 1.3.1
(function() {

  Turing.Tape = (function() {

    Tape.name = 'Tape';

    function Tape(initialPos) {
      this.reset();
      this.initialPos = initialPos;
    }

    Tape.prototype.reset = function() {
      this.currentPos = this.initialPos;
      return this.printedCharacters = [];
    };

    Tape.prototype.doOperation = function(operation) {
      switch (operation) {
        case "":
          break;
        case "E":
          return this.printedCharacters[this.currentPos] = "";
        case "L":
          return this.currentPos -= 1;
        case "R":
          this.currentPos += 1;
          if (this.currentPos > this.printedCharacters.length) {
            return this.printedCharacters[this.currentPos] = "";
          }
          break;
        default:
          return this.printedCharacters[this.currentPos] = operation[1];
      }
    };

    Tape.prototype.currentCharacter = function() {
      return this.printedCharacters[this.currentPos] || '';
    };

    Tape.prototype.characterAtIndex = function(index) {
      if (this.printedCharacters[this.currentPos - (this.initialPos - index)] != null) {
        return this.printedCharacters[this.currentPos - (this.initialPos - index)];
      } else {
        return "";
      }
    };

    return Tape;

  })();

}).call(this);
