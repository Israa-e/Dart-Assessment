import 'dart:io';

// تمثيل اللوحة (Board representation)
List<String> board = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

// دالة لطباعة اللوحة (Function to print the board)
void printBoard() {
  print('\n${board[0]} | ${board[1]} | ${board[2]}');
  print('---------');
  print('${board[3]} | ${board[4]} | ${board[5]}');
  print('---------');
  print('${board[6]} | ${board[7]} | ${board[8]}\n');
}

// دالة للتحقق إذا فاز اللاعب (Function to check if a player has won)
bool checkWin(String player) {
  // سطور للفوز (Winning positions)
  List<List<int>> winningPositions = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], // سطور أفقية (horizontal rows)
    [0, 3, 6], [1, 4, 7], [2, 5, 8], // سطور عمودية (vertical columns)
    [0, 4, 8], [2, 4, 6], // قطريان (diagonals)
  ];

  for (var position in winningPositions) {
    if (board[position[0]] == player &&
        board[position[1]] == player &&
        board[position[2]] == player) {
      return true;
    }
  }
  return false;
}

// دالة للتحقق إذا كانت اللعبة انتهت بالتعادل (Function to check if the game is a draw)
bool isBoardFull() {
  for (int i = 0; i < 9; i++) {
    if (board[i] != 'X' && board[i] != 'O') {
      return false;
    }
  }
  return true;
}

// دالة للتحقق من صحة الإدخال (Function to validate move input)
bool isValidMove(int move) {
  if (move < 1 || move > 9) {
    return false;
  }

  return board[move - 1] != 'X' && board[move - 1] != 'O';
}

// دالة إعادة ضبط اللوحة (Function to reset the board)
void resetBoard() {
  board = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
}

// A robust function to get the player's move
int getPlayerMove(String player) {
  while (true) {
    print('Player $player, enter a number (1-9) for your move:');

    // Read input and remove whitespace
    String? input = stdin.readLineSync()?.trim();

    // Handle case where input is null or empty
    if (input == null || input.isEmpty) {
      print('Please enter a number from 1 to 9.');
      continue;
    }

    // Process only the first character if multiple were entered
    String firstChar = input[0];

    // Try to parse the character as an integer
    int? move;
    try {
      move = int.parse(firstChar);
    } catch (e) {
      print('Please enter a valid number from 1 to 9.');
      continue;
    }

    // Validate the move
    if (!isValidMove(move)) {
      if (move < 1 || move > 9) {
        print('Please enter a number from 1 to 9.');
      } else {
        print('That position is already taken. Choose another one.');
      }
      continue;
    }

    return move;
  }
}

// A robust function to ask if players want to play again
bool playAgain() {
  while (true) {
    print('Do you want to play again? (y/n)');

    // Read input and remove whitespace
    String? input = stdin.readLineSync()?.trim().toLowerCase();

    // Handle null or empty input
    if (input == null || input.isEmpty) {
      print('Please enter y or n.');
      continue;
    }

    // Process only the first character
    String firstChar = input[0];

    if (firstChar == 'y') {
      return true;
    } else if (firstChar == 'n') {
      return false;
    } else {
      print('Please enter y for yes or n for no.');
    }
  }
}

// Add visual enhancements to the game
void displayGameHeader() {
  print('╔════════════════════════╗');
  print('║      TIC-TAC-TOE       ║');
  print('╚════════════════════════╝');
}

// Display game instructions with better formatting
void displayInstructions() {
  print('\nInstructions:');
  print('• Player X goes first, then Player O');
  print('• Enter a number (1-9) to place your mark');
  print('• First player to get 3 in a row wins!\n');
}

// Improved game loop with better feedback and visuals
void playGame() {
  String currentPlayer = 'X';
  bool gameRunning = true;

  while (gameRunning) {
    displayGameHeader();
    displayInstructions();
    resetBoard();

    bool roundRunning = true;
    while (roundRunning) {
      printBoard();

      int move = getPlayerMove(currentPlayer);
      board[move - 1] = currentPlayer;

      if (checkWin(currentPlayer)) {
        printBoard();
        print('╔══════════════════════════════════╗');
        print('║ 🎉 Player $currentPlayer wins the game! 🎉 ║');
        print('╚══════════════════════════════════╝');
        roundRunning = false;
      } else if (isBoardFull()) {
        printBoard();
        print('╔═════════════════════════╗');
        print('║ 🤝 It\'s a draw! 🤝 ║');
        print('╚═════════════════════════╝');
        roundRunning = false;
      } else {
        // تبديل اللاعبين (Switch players)
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      }
    }

    // سؤال اللاعبين إذا يريدون اللعب مرة أخرى (Ask players if they want to play again)
    gameRunning = playAgain();
  }

  print('\nThanks for playing! Goodbye.\n');
}

// The main function that starts the game
void main() {
  print('\nWelcome to Tic-Tac-Toe!');
  playGame();
}
