require './lib/enigma'

handle = File.open(ARGV[0], 'r')

incoming_text = handle.read
incoming_text = incoming_text.strip

handle.close

enigma = Enigma.new

encrypted_text = enigma.encrypt_message(incoming_text, "82648", "240818")

writer = File.open(ARGV[1], 'w')

writer.write(encrypted_text)

writer.close

puts "Created 'encrypted.txt' with the key 82648 and date 240818"
