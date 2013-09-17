require 'benchmark'
require 'pry'

# Aim: Look for all six letter words which are composed of two concatenated smaller words. 
#      Using dictionary: WordList.txt

class Kata

	attr_accessor :word_size, :dictionary_name

	def initialize(word_size, dictionary_name)
		@word_size  		= word_size
		@dictionary_name	= dictionary_name if File.exists?(dictionary_name)
	end

	def read_dictionary
		_from_dictionary = self.dictionary_name

		dictionary = IO.readlines _from_dictionary
		dictionary.map! { |e| e.chomp }
	end

	def dictionary_of_n_sized_words
		new_dictionary = []
		read_dictionary.each do |word|
			if word.length==self.word_size; (new_dictionary<<word); end
		end
		new_dictionary
	end
	
	def grouped_dictionary
		read_dictionary.group_by{ |w| w.size }
	end

	# find valid word combos for each word in the kata
	def process_dictionary
		kata_list = []

		# group dictionary by word size
		_grouped_dictionary = grouped_dictionary

		dictionary_of_n_sized_words.each do |word|
			l = word.length - 1 
			
			for i in 2..l do 
				head = word.slice(0,i)
				tail = word.slice(i,l)

				if _grouped_dictionary[head.length] != nil && _grouped_dictionary[tail.length] != nil
					if ( _grouped_dictionary[head.length].include?(head) && 
						 _grouped_dictionary[tail.length].include?(tail) ) then 
						if !kata_list.include?(word)
							kata_list << word
						end
					end
				end
			end
		end

		kata_list
	end
	
	def match_count
		process_dictionary.count
	end

	def matched
		process_dictionary
	end
end

initial_time = Time.now
	k = Kata.new(6, 'WordList.txt')
	puts "Number of Matches: #{k.process_dictionary.count}"
	puts "Time Taken: #{Time.now - initial_time}"