
def greet(name)
  return "Hello, #{name}"
end

def sum_even(arr)
  sum = 0
  for i in 0..arr.length-1 do
    sum += arr[i] if arr[i] % 2 == 0
  end
  sum
end

def sum_even(arr)
  arr.select { |n| n.even? }.sum
end

def highest_even(arr)
  arr.select { |n| n.even? }.max
end

def reverse_string(string)
  temp = string.split('')
  reverse = []
  for i in 1..(temp.length) do
    reverse << temp[i * -1]
  end
  reverse.join('')
end

def longest_word(string)
  string = string.split(' ')
  high_count = string[0]
  for i in 1..string.length-1
    high_count = string[i] if high_count.length < string[i].length
  end
  high_count
end

def longest_word_fast(sentence)
  sentence.split.max_by(&:length)
end

def roman_to_int(roman)
  values = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  total = 0
  prev = 0

  roman.upcase.reverse.each_char do |char|
    value = values[char]
    if value < prev
      total -= value
    else
      total += value
    end
    prev = value
  end

  total
end

def int_to_roman(num)
  thousand = ["", "M", "MM", "MMM"]
  hundred  = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
  ten      = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
  one      = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]

  t = thousand[num / 1000]
  h = hundred[(num % 1000) / 100]
  te = ten[(num % 100) / 10]
  o = one[num % 10]

  t + h + te + o
end

def palindrome(str)
  str == str.reverse
end


def palindrome(str)
  left = 0
  right = str.length - 1

  while left < right
    return false if str[left] != str[right]
    left += 1
    right -= 1
  end
  true
end

def capitalize_map(string)
  string.split('').map(&:upcase).join('')
end

def find_palindrome(arr)
  new_arr = []
  for i in 0..arr.length-1 do
    new_arr << arr[i] if capitalize_map(arr[i]) == capitalize_map(arr[i]).reverse
  end
  new_arr
  # arr.select { |w| w.downcase == w.downcase.reverse }
end

def count_vowels(str)
  str.downcase.split('').select { |n| ['a', 'e', 'i', 'o', 'u'].include?(n) }.count
  str.count('aeiouAEIOU')
end

def find_missing_iteration(arr)
  arr = arr.sort
  check = arr[0]
  for i in 0..arr.length-2 do
    puts arr[i] +1 if (arr[i + 1] - arr[i]) != 1   
  end 
end
