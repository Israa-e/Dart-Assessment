# Tic-Tac-Toe Console Game in Dart

A simple console-based Tic-Tac-Toe game implemented in Dart. This game allows two players to take turns placing their marks (X and O) on a 3×3 grid, with the goal of getting three of their marks in a row, column, or diagonal.

## Features

- Interactive console-based gameplay
- Visual game board representation
- Input validation to ensure fair play
- Win and draw detection
- Option to play multiple rounds
- User-friendly interface with clear instructions

## Requirements

- [Dart SDK](https://dart.dev/get-dart) installed on your system

## How to Run the Game

### Method 1: Direct Execution

1. Clone this repository or download the source files
2. Navigate to the project directory in your terminal or command prompt
3. Run the game using the Dart command:

```bash
dart run game.dart
```

### Method 2: As a Dart Package

1. Clone this repository or download the source files
2. Navigate to the project directory in your terminal or command prompt
3. Run the game:

```bash
dart run
```

## Game Instructions

1. The game is played on a 3×3 grid
2. Player X goes first, followed by Player O
3. Players take turns placing their marks in empty squares
4. Enter a number from 1 to 9 corresponding to the position on the board
5. The first player to get 3 of their marks in a row (horizontally, vertically, or diagonally) wins
6. If all squares are filled and no player has 3 marks in a row, the game is a draw
7. After each game, you can choose to play again or exit

## Game Controls

- Enter numbers 1-9 to place your mark on the corresponding position on the board
- Enter 'y' to play again after a game ends
- Enter 'n' to exit after a game ends

## Code Structure

- `game.dart`: The main game file containing all game logic and user interface
- `README.md`: This file with instructions and information about the game

## Implementation Details

The implementation follows a procedural programming approach with the following main components:

- Game board representation
- Input validation
- Win condition checking
- Draw condition checking
- Player turn management
- Game loop management
- User interface functions

## Future Improvements

Possible enhancements for future versions:

- Add an AI opponent
- Implement a scoreboard to track wins across multiple games
- Allow players to choose their marks
- Add an option to play on larger grids
- Implement a more sophisticated user interface



## Author

Created by Israa elhalby for the Dart Programming Assessment.
