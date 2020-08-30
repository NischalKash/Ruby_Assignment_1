load 'merging_files.rb'

def scores
  correct = 0
  wrong = 0
  full = 30

  # Q1
  begin
    sorted_squares([-7, -3, 2, 3, 11]) == [4, 9, 9, 49, 121] ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # Q2
  begin
    move_zeros([4, 5, 6]) == [4, 5, 6] ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # Q3
  begin
    group_anagrams(['nat','eat','tea','tan','bat','ate']) == [['nat','tan'],['eat','tea','ate'],['bat']] ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # Q4
  begin
    reverse_words("123 555") == "555 123" ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # Q5
  begin
    highest_frequency_word("A man was painting a new sign for the pub called the Pig and Whistle.") == 'a' ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # Q6
  begin
    palindrome?("") == true ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  #Q7
  begin
    b2 = Beverage.new("Mocha Latte", 10)
  rescue
    b2 = nil
  end

  begin
    b2.formatted_price=="10 dollars only" ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # puts correct+wrong
  puts correct, wrong, correct+wrong
  ((correct * full).to_f / (wrong + correct)).round(2)
end

puts "Final Scores = #{scores}"