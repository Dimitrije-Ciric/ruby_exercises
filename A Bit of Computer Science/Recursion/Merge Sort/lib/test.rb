#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'merge_sort'

def run_testing
  tests = { # key - value => array - sorted array
    [1, 2, 3] => [1, 2, 3],
    [3, 2, 1] => [1, 2, 3],
    [5, 8, 1, 8, 1, 0, 0, 3, 5, 7, 2, 7, 8, 10, 2, 5, 2] => [5, 8, 1, 8, 1, 0, 0, 3, 5, 7, 2, 7, 8, 10, 2, 5, 2].sort,
    [1, 3, -12, 35, 61, 7, 1, 45] => [1, 3, -12, 35, 61, 7, 1, 45].sort,
    [10, 9, 8, 7, 6, 5, 4, 3, 2, 1] => [10, 9, 8, 7, 6, 5, 4, 3, 2, 1].sort
  }

  test_idx = 1
  failed_test_cnt = 0
  tests.each do |n, solution|
    print "Test #{test_idx}:\n"
    print "\tArray: #{n}\n"

    output = MergeSort.sort(n)
    print "\tMergeSort.sort() output: #{output}\n"
    print "\tsolution: #{solution}\n"

    if output == solution
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
