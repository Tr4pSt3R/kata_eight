require './lib/kata_eight_extendable'

describe Kata do 
	before(:each) do 
		@k = Kata.new(6, 'WordList.txt')
	end

	context "process dictionary" do 
		it "should identify all dictionary words" do 
			@k.dictionary_of_n_sized_words.should_not be_empty
		end

		it "should successfully identify all words of length six" do 
			k = Kata.new(6, 'WordList.txt')
			k.dictionary_of_n_sized_words.select { |w| w.size != 6}.should be_empty
		end
	end
end