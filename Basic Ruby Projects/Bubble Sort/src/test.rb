#!/usr/bin/env ruby
require "./bubble_sort.rb"

def run_testing()
    print "Testing started!\n"

    tests = { # key - value => array of stock_prices - solution
        [] => [],
        [17] => [17],
        {} => {}, # invalid input
        [1, 2, 3] => [1, 2, 3],
        [3, 2, 1] => [1, 2, 3],
        [4, 3, 78, 2, 0, 2] => [0, 2, 2, 3, 4, 78]
    }

    test_idx = 1
    failed_test_cnt = 0
    tests.each do |key, value|
        print "Test #{test_idx}:\n"
        print "\tinput array: #{key}\n"

        output = bubble_sort(key)
        print "\tbubble_sort() output: #{output}\n"
        print "\tsolution: #{value}\n"

        if output == value 
            print "\tTEST PASSED!\n"
        else
            print "\tTEST FAILED!\n"
            failed_test_cnt += 1
        end
        test_idx += 1
    end

    if failed_test_cnt == 0
        print "ALL TESTS PASSED ! ! !"
    elsif failed_test_cnt == 1
        print "1 TEST FAILED ! ! !"
    else
        print "#{failed_test_cnt} TESTS FAILED ! ! !"
    end
end

run_testing()