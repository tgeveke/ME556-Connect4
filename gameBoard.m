% Board
board = [[0,0,0,0,0,0,0];
         [0,0,0,0,0,0,0];
         [0,0,0,0,0,0,0];
         [0,0,0,0,0,0,0];
         [0,0,0,0,0,0,0];
         [0,0,0,0,0,0,0];
        ];

% Establish player numbers
player1 = 1;
player2 = 2;

board = addPiece(board, player1, 2);
board = addPiece(board, player1, 2);
board = addPiece(board, player1, 2);
board = addPiece(board, player2, 2);
target_column = getPiece(board, player1)

%%% ---------- FUNCTIONS ----------  %%%
function board = addPiece(board, player_number, column)
    for i = 1:6
        current = board(7-i,column);
        if current == 0
            board(7-i,column) = player_number;
            disp(board)

            % Check if won
            didWin(board);

            break
        end
    end
end

function bool = didWin(board) % This will be hard
    % Find if there's 4 in a row
    counter = 1;
    lastVal = 0;
    for rowIndex = 1:6
        for columnIndex = 1:7
            val = board(rowIndex, columnIndex);
            if val >= 1
                if val == lastVal
                    counter = counter + 1;
                    if counter >= 4
                        bool = true;
                        disp("Winner!")
                        return
                    end
                end
            end
            lastVal = val; 
        end
    end

    % Find if there's 4 in a column
        counter = 1;
    lastVal = 0;
    for columnIndex = 1:7
        for rowIndex = 1:6
            val = board(rowIndex, columnIndex);
            if val >= 1
                if val == lastVal
                    counter = counter + 1;
                    if counter >= 4
                        bool = true;
                        disp("Winner!")
                        disp(board)
                    end
                end
            end
            lastVal = val; 
        end
    end
    bool = false;
end

function target_column = getPiece(board, player_number)
    for column = 1:7
        for row = 1:6
            val = board(row, column);
            if val > 0 % Some piece in index
                if val == player_number
                    target_column = column;
                    return
                else
                    continue
                end
            end
        end
    end
    target_column = 0; % No result
end

function reset(sim, clientID)
    % Open bottom of board
end