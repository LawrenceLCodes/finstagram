# Variable examples
full_name = "Lawrence Lee"
last_name = "Lee"

# Array example
web_class = [
    "Lawrence",
    "Mike",
    "Jeremy",
    "Rocio"
]

# object example
lawrence = [
    name: "Lawrence",
    last_name: "Lee",
    age: 38,
    phone_number: 12349087,
]

# Array of objects with multiple key value pairs
# Very common data type used in the real world, will be working with this often in the developer world.
users = [
    {
        name: "Lawrence",
        last_name: "Lee",
        age: 38,
        phone_number: 1234908746
    },
    {
        name: "Tiffany",
        last_name: "Anderson",
        age: 29,
        phone_number: 1263092890
    },
    {
        name: "Lydia",
        last_name: "Andrews",
        age: 35,
        phone_number: 1153087340
    },
    {
        name: "Lyndsay",
        last_name: "Lee",
        age: 20,
        phone_number: 1519054768
    }
]

# if statement example
age = 38

if age > 90
    puts "you are old"
elsif age >= 50 && age < 90
    puts "you are almost old"
elsif age < 50 && age > 35
    puts "You are average age"
elsif age <= 35 && age >= 20
    puts "Young adult" 
elsif age < 20 && age <= 10
    puts "You are young"
else
    puts "you are too young"
end

# function definition and function call with parameters
def check_age(age)
    if age > 90
        puts "you are old"
    elsif age >= 50 && age < 90
        puts "you are almost old"
    elsif age < 50 && age > 35
        puts "You are average age"
    elsif age <= 35 && age >= 20
        puts "Young adult" 
    elsif age < 20 && age <= 10
        puts "You are young"
    else
        puts "you are too young"
    end
end

# check_age(users[0][:age])
# check_age(users[1][:age])
# check_age(users[2][:age])

# for in loop in Ruby
# Commonly used by instructor in his career
# index not required as the for loop is doing the checking
# check the age of every single user in our array and display some kind of output
for user in users
    check_age(user[:age])
end

# For each loop
# use this if you need to perform some logic before the loop
# users.each do [user]
#     puts user
# end

#  Using a for in loop output the numbers from 1 to 10
for number in (1..10)
    puts number
end

# Uses loops to output Hello 10 times
10.times do 
    puts 'Hello'
end

# FizzBuzz using Ruby
# for n in (1..100)
#     if n % 3 == 0
#         puts 'Fizz'
#     else 
#         puts n
#     end 
# end

# Yellow Pager code
# Needs more work, instructor left the rest of the code to me to work on
# def yellow_pager(string)
#     phone_number = ""
#     string.downcase.each_char do |letter|
#         # if character in string is "a" append 2
#         if letter == "a" || letter == "b" || letter == "c"
#             phone_number += "2"
#         elsif letter == "d" || letter == "e" || letter == "f"
#             phone_number += "3"
#         else
#             phone_number += letter
#         end
#     end
#     puts phone_number
# end

# yellow_pager("Lawrence")

# Class - can store methods, properties that can be used and inherited
class Human 
    def walk
        puts "I can walk!"
    end

    def talk
        puts "I can talk as well!"
    end
end

class Robot
    def fly
        puts "I can fly!"
    end
end

# This is an example of inheriting
# The SuperHuman class is inheriting all of the properties from the Human class
class SuperHuman < Human
    def super_walk
        puts "I can walk at 60mph!"
    end
end

class MegaHuman < SuperHuman

end

larry = Human.new
larry.walk
larry.talk

legion = Robot.new
legion.fly

Jo = SuperHuman.new
Jo.super_walk
Jo.walk

Shepard = MegaHuman.new
Shepard.walk
Shepard.super_walk
