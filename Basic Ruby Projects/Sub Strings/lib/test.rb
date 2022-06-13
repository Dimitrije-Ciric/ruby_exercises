#!/usr/bin/env ruby
# frozen_string_literal: true

require './substrings'

def run_testing
  print "Testing started!\n"

  dictionary = %w[below down go going horn how howdy it i low own part partner
                  sit How hOw]

  tests = { # key - value => text - solution
    'below' => {
      'below' => 1,
      'low' => 1
    },
    "Howdy partner, sit down! HOw's it going? how How" => {
      'down' => 1,
      'go' => 1,
      'going' => 1,
      'how' => 4,
      'howdy' => 1,
      'it' => 2,
      'i' => 3,
      'own' => 1,
      'part' => 1,
      'partner' => 1,
      'sit' => 1
    }
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

  case failed_test_cnt
  when 0
    print 'ALL TESTS PASSED ! ! !'
  when 1
    print '1 TEST FAILED ! ! !'
  else
    print "#{failed_test_cnt} TESTS FAILED ! ! !"
  end
  print "\n"
end

run_testing
