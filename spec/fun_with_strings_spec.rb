require 'fun_with_strings'
require 'byebug'
require 'rspec'

describe 'palindrome detection' do
    it 'should work for simple strings' do
        expect('redivider').to  be_a_palindrome
        expect('abracadabra').not_to  be_a_palindrome     
    end
    it 'should be case-insensitive' do
        expect('ReDivider').to be_a_palindrome
        expect('ATrainName').not_to be_a_palindrome    
    end
    it 'should ignore nonword characters' do
        expect('A man, a plan, a canal -- Panama').to be_a_palindrome
        expect("Madam, I'm Adam!").to be_a_palindrome
        expect("Is the phone number #(111) 111-1111?").not_to be_a_palindrome
    end 
    it 'should work with word characters including numbers and _' do
        expect('00non00').to be_a_palindrome
        expect('01AA10').to be_a_palindrome
        expect('1001284').not_to be_a_palindrome
        expect('_nan_').to be_a_palindrome
    end
end

describe 'word count' do
  it 'should return a hash' do
    expect('now is the time'.count_words).to be_a_kind_of Hash
  end
  it 'works on simple strings' do
    expect('Doo bee doo bee doo'.count_words).to eq({'doo' => 3, 'bee' => 2})
  end
  it 'ignores punctuation' do
    expect('A man, a plan, a canal -- Panama!'.count_words).to eq({'a' => 3, 'man' => 1, 'plan' => 1, 'canal' => 1, 'panama' => 1})
  end
  it 'works on the empty string' do
    expect(''.count_words).to eq({})
  end
  it 'ignores leading whitespace' do
    expect("  toucan".count_words).to eq({'toucan' => 1 })
  end
  it 'ignores embedded whitespace' do
    expect("four   four  \n four \t four!".count_words).to eq({'four' => 4})
  end
  it 'ignores nonwords' do
    expect("$#the man@ in the% can".count_words).to eq({'the' => 2, 'man' => 1, 'in' => 1, 'can' => 1})
  end
end

describe 'anagram grouping' do
  describe 'sanity checks' do
    it 'should work on the empty string' do
      expect(''.anagram_groups).to eq([])
    end
    it 'should return an array of arrays for nonempty string' do
      'x'.anagram_groups.each { |element| expect(element).to be_an Array }
    end
  end
  it 'for "scream cars for four scar creams"' do
    @anagrams =  'scream cars for four scar creams'.anagram_groups
    @anagrams.each { |group| group.sort! }
    [%w(cars scar), %w(four), %w(for), %w(creams scream)].each do |group|
        expect(@anagrams).to include(group)
    end
  end
    
end
