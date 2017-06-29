require 'rltk/lexer'

module Gitsh
  module TabCompletion
    module DSL
      class Lexer < RLTK::Lexer
        rule(/\$[a-z_]+/) { |t| [:VAR, t[1..-1]] }
        rule(/[^\s*+|()#]+/) { |t| [:WORD, t] }
        rule(/\+/) { :PLUS }
        rule(/\|/) { :OR }
        rule(/\(/) { :LEFT_PAREN }
        rule(/\)/) { :RIGHT_PAREN }
        rule(/\s*\n\s*\n/) { :BLANK }
        rule(/\s+/) {}

        rule(/#/) { push_state :comment }
        rule(/[^\n]+/, :comment) {}
        rule(/(?=\n)/, :comment) { pop_state }
      end
    end
  end
end
