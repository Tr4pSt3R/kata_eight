require 'benchmark'

# Aim: Look for all six letter words which are composed of two concatenated smaller words. 
#      Process the dictionary WordList.txt

puts "Dictionary to be processed..."
puts dictionary = IO.readlines('WordList.txt')

puts "Dictionary of all six letter words..."
dictionary.map! { |e| e.delete "\n" }
# dictionary.map! { |e| e.chomp }


new_dictionary=[]
dictionary.each do |word|
	if word.length==6 then (new_dictionary<<word) end
end

puts new_dictionary

# look for all six letter words which are composed of two contenated smaller words
	
	# kata_list is the list of all six letter words which are composed of two concatenated smaller words
	kata_list = []

	# 
	new_dictionary.each do |word|
		len = word.length - 1
		for i in 2..len do 
			head = word.slice(0, i)
			tail = word.slice(i, len)

			if (dictionary.include?(head) && dictionary.include?(tail)) then
				if !kata_list.include?(word)
					kata_list << word
				end
			end
		end
	end

	puts "Kata List #{kata_list}"