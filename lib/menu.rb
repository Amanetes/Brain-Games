# frozen_string_literal: true

require 'tty-prompt'
require_relative '../lib/games/brain_even'
require_relative '../lib/games/brain_gcd'
require_relative '../lib/games/brain_prime'
require_relative '../lib/games/brain_calc'
require_relative '../lib/games/brain_progression'

def start_menu
  prompt = TTY::Prompt.new(help_color: :cyan)
  prompt.say('Welcome to the Brain Games!')
  game = prompt.select('Select game to start playing:', show_help: :always) do |menu|
    menu.choice 'Brain-Even'
    menu.choice 'Brain-Calc'
    menu.choice 'Brain-GCD'
    menu.choice 'Brain-Progression'
    menu.choice 'Brain-Prime'
  end
  case game
  when 'Brain-Even' then run_even
  when 'Brain-Calc' then run_calc
  when 'Brain-GCD' then run_gcd
  when 'Brain-Progression' then run_progression
  when 'Brain-Prime' then run_prime
  else prompt.error('Game is not available!')
  end
end
