def sorted(a)
    nums = []
    for i in 0..a.length-1
        nums[i] = a[i]*a[i]
    end
    return nums.sort
end

def move_zeroes(a)
    nums = []
    count = 0
    j = 0
    for i in 0..a.length-1
        if a[i]==0
            count+=1
        else
            nums[j] = a[i]
            j+=1
        end
    end
    for i in j..j+count-1
        nums[i] = 0
    end
    return nums
end

def check_anagrams(a,b)
    check_a = Hash.new
    check_b = Hash.new
    for i in 0..a.length-1
        if check_a.key?(a[i])
        check_a[a[i]] += 1
        else
        check_a[a[i]] = 1
        end
    end
    for i in 0..b.length-1
        if check_b.key?(b[i])
        check_b[b[i]] += 1
        else
        check_b[b[i]] = 1
        end
    end
    if check_a==check_b
        return 1
    else
        return 0
    end
end

def reverse(a)
    s1 = ""
    s2 = ""
    vowels = ['a','e','i','o','u']
    for i in 0..a.length-1
        if vowels.include? a[i]
            s1 += a[i]
        else
            s2 += a[i]
        end
    end
    return s2+s1
end

def find_highest(word)
    words = word.split(' ')
    final_list = Hash.new

    for i in 0..words.length-1
        if final_list.include? words[i]
            final_list[words[i]]+=1
        else
            final_list[words[i]] = 1
        end
    end
    final_list = final_list.sort_by {|_key, value| value}.reverse
    return final_list[0]
end

def palindrome(s)
    return s==s.reverse
end

a = [-4,-1,0,3,90]
value = sorted a
puts "#{value}"

a = [9,12,0,0,0,0,11]
value = move_zeroes a
puts "#{value}"

a = ['restful','fluster','hour','rouh','fluster']
final_list = Hash.new
i = 0
while i<a.length
final_list[a[i]] = [a[i]]
    j = i+1
    while j<=a.length-1
        value = check_anagrams a[i],a[j]
        if value == 1
            final_list[a[i]].append(a[j])
            a.delete_at(j)
            j-=1
        end
        j+=1
    end
    i+=1
end
value = []
final_list.each do | key, values |
    value.append(values)
end
puts "#{value}"

string = "Object          Oriented                      Design!!"
string = string.downcase
string = string.gsub(/\s+/m, ' ').strip.split(" ")
nums = []
for i in 0..string.length-1
    a = reverse string[i]
    nums[i] = a
end
nums = nums.reverse()
puts "#{nums.join(' ')}"


string = "Bob hit a ball, the Hit BALL flew far after it was hit."
string = string.downcase
string = string.gsub!(/[^0-9A-Za-z ]/, '')
value = find_highest string
puts "#{value[0]}"

string = "A man, a plan, a canal: Panama."
string = string.downcase
string = string.gsub!(/[^0-9A-Za-z]/, '')
puts "#{palindrome string}"

