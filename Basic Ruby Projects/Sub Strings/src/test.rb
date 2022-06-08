#!/usr/bin/env ruby
require "./substrings.rb"

def run_testing()
    print "Testing started!\n"

    dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit", "How", "hOw"]
    
    tests = { # key - value => text - solution
        "below" => { 
            "below" => 1, 
            "low" => 1 
        },
        "Howdy partner, sit down! HOw's it going? how How" => { 
            "down" => 1, 
            "go" => 1, 
            "going" => 1, 
            "how" => 4, 
            "howdy" => 1, 
            "it" => 2, 
            "i" => 3, 
            "own" => 1, 
            "part" => 1, 
            "partner" => 1, 
            "sit" => 1 
        },
        [1, 2, 3] => [], # text value is invalid type, so it returns empty array([])
    }

    test_idx = 1
    failed_test_cnt = 0
    tests.each do |key, value|
        print "Test #{test_idx}:\n"
        print "\tText: #{key}\n"

        output = substrings(key, dictionary)
        print "\tsubstrings() output: #{output}\n"
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
    print "\n"
end

run_testing()