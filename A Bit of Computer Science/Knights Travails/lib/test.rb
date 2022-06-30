#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'knight_moves'

def run_testing
  tests = { # [starting, ending positions] => path
    [[0,0], [1,2]] => [[0, 0], [1, 2]],
    [[0,0], [3,3]] => [[0, 0], [2, 1], [3, 3]],
    [[3,3], [0,0]] => [[3, 3], [1, 2], [0, 0]]
  }

  test_idx = 1
  failed_test_cnt = 0
  tests.each do |key, value|
    print "Test #{test_idx}:\n"
    print "\tStarting position: #{key[0]}\n"
    print "\tEnding position: #{key[1]}\n"

    output = knight_moves(key[0], key[1])
    print "\tknight_moves() output: #{output}\n"
    print "\tsolution: #{value}\n"

    if output == value
      print "\tTEST PASSED!\n"
    else
      print "\tTEST FAILED!\n"
      failed_test_cnt += 1
    end
    test_idx += 1
  end

  case failed_test_cnt
  when 0
    print 'ALL TESTS PASSED ! ! !'
  when 1
    print '1 TEST FAILED ! ! !'
  else
    print "#{failed_test_cnt} TESTS FAILED ! ! !"
  end
end

run_testing