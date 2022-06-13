#!/usr/bin/env ruby
# frozen_string_literal: true

require './caesar_cipher'

def run_testing
  print caesar_cipher('What a string!', 5), "\n"
  print caesar_cipher('Testing started!', 130), "\n"

  text = 'Lorem ipsum dolor sit amet.[12]'

  tests = { # key - value => shift - solution
    26 => 'Lorem ipsum dolor sit amet.[12]',
    53 => 'Mpsfn jqtvn epmps tju bnfu.[12]',
    -53 => 'Knqdl hortl cnknq rhs zlds.[12]',
    -123 => 'Svylt pwzbt kvsvy zpa htla.[12]',
  }

  test_idx = 1
  failed_test_cnt = 0
  tests.each do |key, value|
    print "Test #{test_idx}:\n"
    print "\tShift: #{key}\n"

    output = caesar_cipher(text, key)
    print "\tcaesar_cipher() output: #{output}\n"
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
