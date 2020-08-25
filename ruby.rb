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
puts "#{final_list}"