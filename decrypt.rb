require './lib/enigma'

handle = File.open(ARGV[0], 'r')

incoming_text = handle.read
incoming_text = incoming_text.strip

handle.close

enigma = Enigma.new

decrypted_text = enigma.decrypt_message(incoming_text, ARGV[2], ARGV[3])

writer = File.open(ARGV[1], 'w')

writer.write(decrypted_text)

writer.close

puts "Created 'decrypted.txt' with the key #{ARGV[2]} and date #{ARGV[3]}"
