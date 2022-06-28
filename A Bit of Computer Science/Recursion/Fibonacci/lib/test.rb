#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'fib'

def run_testing
  tests = { # key - value => n - fib array
    -1 => [],
    0 => [],
    1 => [0],
    2 => [0, 1],
    3 => [0, 1, 1],
    4 => [0, 1, 1, 2],
    5 => [0, 1, 1, 2, 3],
    6 => [0, 1, 1, 2, 3, 5],
    7 => [0, 1, 1, 2, 3, 5, 8]
  }

  test_idx = 1
  failed_test_cnt = 0
  tests.each do |n, solution|
    print "Test #{test_idx}:\n"
    print "\tN: #{n}\n"

    output1 = fibs(n)
    output2 = fibs(n)
    print "\tfibs() output: #{output1}\n"
    print "\tfibs_rec() output: #{output2}\n"
    print "\tsolution: #{solution}\n"

    if output1 == solution && output2 == solution
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
