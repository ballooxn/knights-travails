POSSIBLE_MOVES = [[1, 2], [2, 1], [1, -2], [2, -1], [-1, 2], [-2, 1], [-1, -2], [-2, -1]].freeze

def knight_moves(start, finish)
  board = Array.new(8) { Array.new(8, false) }

  queue = [[start, [start]]]

  until queue.empty?
    curr_pos, path = queue.shift
    curr_x, curr_y = curr_pos

    if curr_pos == finish
      output_path(path)
      return path
    end

    board[curr_x][curr_y] = true

    POSSIBLE_MOVES.each do |move_x, move_y|
      new_x = curr_x + move_x
      new_y = curr_y + move_y

      # Check if new position has been visited before
      if new_x.between?(0, 7) && new_y.between?(0, 7) && !board[new_x][new_y]
        queue << [[new_x, new_y], path + [[new_x, new_y]]]
      end
    end
  end
end

def output_path(path)
  puts "You made it in #{path.length - 1} moves! Here's your path:"
  path.each { |pos| puts "[#{pos[0]},#{pos[1]}]" }
end

knight_moves([0, 0], [7, 6])
