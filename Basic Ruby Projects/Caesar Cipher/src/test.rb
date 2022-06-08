#!/usr/bin/env ruby
require "./caesar_cipher.rb"

def run_testing()
    caesar_cipher("What a string!", 5)
    print "\n"
    caesar_cipher("Testing started!", 130)
    print "\n"

    text = "Lorem ipsum dolor sit amet.[12]"

    tests = { # key - value => shift - solution
        26 => "Lorem ipsum dolor sit amet.[12]",
        53 => "Mpsfn jqtvn epmps tju bnfu.[12]",
        -53 => "Knqdl hortl cnknq rhs zlds.[12]",
        -123 => "Svylt pwzbt kvsvy zpa htla.[12]"
    }

    test_idx = 1
    failed_test_cnt = 0
    tests.each do |key, value|
        print "Test #{test_idx}:\n"
        print "\tShift: #{key}\n"

        print "\tcaesar_cipher() output:"
        output = caesar_cipher(text, key)
        print "\n\tsoultion: #{value}\n"

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