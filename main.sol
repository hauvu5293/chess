pragma solidity ^0.8.0;

contract ChessGame {
    address public player1;
    address public player2;
    uint public turn = 1;
    bool public gameFinished;
    mapping(uint => mapping(uint => address)) board;
    
    constructor() {
        player1 = payable(msg.sender);
    }
    
    function joinGame() public {
        require(player2 == address(0), "Game is full!");
        player2 = payable(msg.sender);
    }
    
    function makeMove(uint fromX, uint fromY, uint toX, uint toY) public {
        require(!gameFinished, "Game is over!");
        require(msg.sender == getCurrentPlayer(), "Not your turn!");
        require(fromX < 8 && fromY < 8 && toX < 8 && toY < 8, "Invalid move!");
        address piece = board[fromX][fromY];
        require(piece != address(0), "No piece at source!");
        require(piece == getCurrentPlayer(), "Not your piece!");
        require(isValidMove(piece, fromX, fromY, toX, toY), "Invalid move!");
        board[toX][toY] = piece;
        board[fromX][fromY] = address(0);
        if (isCheckmate(getCurrentPlayer())) {
            gameFinished = true;
            emit GameFinished(getCurrentPlayer());
        } else {
            turn++;
        }
    }
    
    function getCurrentPlayer() public view returns (address) {
        return turn % 2 == 1 ? player1 : player2;
    }
    
    function isValidMove(address piece, uint fromX, uint fromY, uint toX, uint toY) internal view returns (bool) {
        // Check if move is valid
        // ...
        // Reset timer for next turn
        if (turn % 2 == 1) {
            turnStartTime = block.timestamp;
        }
        return true;
    
    function isCheckmate(address player) internal view returns (bool) {
        // Check if player is in checkmate
    }
    
    event GameFinished(address winner);
}
