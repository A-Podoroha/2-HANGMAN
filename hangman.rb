word = "hangman"
display_word = word.clone

selected_letter = nil
wrong_letters = Array.new()
mistakes = 0

for i in 1..word.length-2
  display_word[i] = '_'
end

puts "The word is '#{display_word}'"

while mistakes < 6
  puts "Enter the letter:"
  selected_letter = gets.strip
  
  while selected_letter.length > 1
    selected_letter.chop
	
	puts selected_letter
  end
  
  selected_letter.downcase
  
  if word.include? selected_letter
    for i in 0..word.length
	  if word[i] == selected_letter[0]
        display_word[i] = selected_letter[0]
	  end
    end
  elsif !wrong_letters.include? selected_letter
	mistakes += 1
	wrong_letters << selected_letter[0]
  end
  puts "\n\nMistakes: #{mistakes},  Wrong letters: #{wrong_letters}\n"
  
  puts display_word
  
  if !display_word.include? '_'
    break
  end
end

puts "The word was '#{word}'"

if mistakes >= 6
  puts "You lost"
else
  puts "You won"
end