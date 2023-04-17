require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos if !prev_move_pos.nil?
  end
require "byebug"
  def children
    children = []
    # @board.op
    (0...3).each do |r_i|
      (0...3).each do |c_i|
        el = @board.rows[r_i][c_i]
        if el.nil?
          dup_board = @board.dup
          n_m = self.next_mover_mark == :o ? :x : :o
          dup_board.rows[r_i][c_i] = TicTacToeNode.new(dup_board, n_m, [r_i, c_i])
          children << dup_board.rows[r_i][c_i]
        end 
      end 
    end 
    children
  end 


  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  def inspect
    self.next_mover_mark
  end 
end

