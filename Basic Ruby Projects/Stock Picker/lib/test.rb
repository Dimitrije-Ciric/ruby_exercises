#!/usr/bin/env ruby
# frozen_string_literal: true

require './stock_picker'

def run_testing
  print "Testing started!\n"

  tests = { # key - value => array of stock_prices - solution
    [17, 3, 6, 9, 15, 8, 6, 1, 10] => [1, 4],
    [3, 3, 3] => [0, 0]
  }

  test_idx = 1
  failed_test_cnt = 0
  tests.each do |key, value|
    print "Test #{test_idx}:\n"
    print "\tstock prices: #{key}\n"

    output = stock_picker(key)
    print "\tstock_picker() output: #{output}\n"
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
