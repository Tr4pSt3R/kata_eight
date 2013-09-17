initial_time = Time.now 

# Aim: Look for all six letter words which are composed of two concatenated smaller words. 
#      Using dictionary: WordList.txt

# 1. 
	puts "Dictionary to be processed into an..."
	dictionary = IO.readlines('WordList.txt') 
	dictionary = IO.readlines('WordList.txt')
	

# 2. 
    puts "Remove carriage return characters"
    dictionary.map! { |e| e.chomp } 
	dictionary.map! { |e| e.chomp }

# 3. 
	puts "Dictionary of all six letter words..."
	new_dictionary = []
	dictionary.each do |word|
		if word.length==6; (new_dictionary<<word); end
	end

# 4. look for all six letter words which are composed of two contenated smaller words
	# list of all six letter words which are composed of two concatenated smaller words
	kata_list = []

	# group dictionary by word size
	grouped_dictionary = dictionary.group_by{ |w| w.size }

	# find valid word combos for each word in the kata
	new_dictionary.each do |word|
		l = word.length - 1
		
		for i in 2..l do 
			head = word.slice(0, i)
			tail = word.slice(i, l)

			if grouped_dictionary[head.length] != nil && grouped_dictionary[tail.length] != nil
				if ( grouped_dictionary[head.length].include?(head) && 
					 grouped_dictionary[tail.length].include?(tail) ) then 
					if !kata_list.include?(word)
						kata_list << word
					end
				end
			end
		end
	end 
	
	puts "Number of Matches: #{kata_list.count}"
	puts "Time Taken: #{Time.now - initial_time}\n"