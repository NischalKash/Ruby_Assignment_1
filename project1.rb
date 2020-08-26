def sorted_squares(a)
  a.map! { |num| num**2 }.sort
end

def move_zeros(a)
  c = a.count
  a.delete(0)
  zero_count = c - a.count
  a = a.fill(0, a.size, zero_count)
end

def group_anagrams(a)
  res = Hash.new{ |h,k| h[k] = Array.new}
  # puts res
  a.each do |s|
    sorted_str = s.chars.sort.join
    # puts sorted_str
    if res[sorted_str]
      res[sorted_str] << s
    else
      res[sorted_str] = [s]
    end
  end
  res.values
end

# Part 2

def reverse_words(str)
  # ADD YOUR CODE HERE
  vowel_str = ''
  str = str.strip.gsub(/\s\s+/, ' ')
  words_list = str.split(' ')
  words_list = words_list.reverse
  # puts words_list.inspect
  res = []

  words_list.each do |word|
    # puts word
    vowel_str = ''
    word.chars.to_a.each do |ch|
      # puts ch
      if ch =~ /[aeiouAEIOU]/
        vowel_str << ch
        # puts c
        word = word.delete(ch)
        # puts w
      end
    end
    word += vowel_str
    res << word
  end
  res.join(' ')
end

def highest_frequency_word(s)
  # ADD YOUR CODE HERE
  words_list = s.gsub(Regexp.union(['!', '?', ',', '\'', ';', '.']), ' ').split.map(&:downcase)
  # puts words_list

  res = Hash.new{}
  words_list.each do |word|
    if res[word]
      res[word] += 1
    else
      res[word] = 1
    end
  end
  # puts res

  res.max_by{|k,v| v}[0]
end



def palindrome?(s)
  # ADD YOUR CODE HERE
  if s == ''
    return true
  end

  str = s.gsub(/[^0-9a-z ]/i, '')
  str = str.gsub(/\s+/, '').downcase!

  # puts str
  i = 0
  j = str.to_s.length - 1

  while i < j
    return false if str[i] != str[j]

    i += 1
    j -= 1
  end
  true
end

# Part 3

class Beverage
  def initialize(name, price)
    raise ArgumentError, 'Argument is nil or ""' unless name != nil && name != ''
    raise ArgumentError, 'Argument is nil or <0' unless price != nil && price >= 0

    @name = name
    @price = price
  end
end

puts sorted_squares([-4, -1, 0, 3, 10]).inspect
puts move_zeros([1, 0, 2, 8, 0, 0, 7]).inspect
puts group_anagrams(['elbow', 'cried', 'below', 'cider']).inspect
puts reverse_words(' hello world! ')
puts highest_frequency_word('She says she got married')
puts palindrome?('A man, a plan, a canal: Panama')



