const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class Game {
  constructor(pegs = [[3, 2, 1], [], []]) {
    this.pegs = pegs;
  }

  promptMove(callback) {
    let fromIdx;
    let toIdx;
    console.log(this.pegs);
    reader.question("From which tower would you like to take?", (res1) => {
      fromIdx = parseInt(res1, 10);
      reader.question("Which tower would you like to move to?", (res2) => {
        toIdx = parseInt(res2, 10);
        callback(fromIdx, toIdx);
      });
    });
  }

  isValidMove(from, to) {

  }
}

var a = new Game();
a.promptMove(a.isValidMove);
