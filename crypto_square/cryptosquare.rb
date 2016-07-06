class Crypto
  include Math

  attr_reader :message, :size

  def initialize(message)
    @message = message
    @size = Math.sqrt(normalize_plaintext.length).ceil
  end

  def normalize_plaintext
    message.gsub(/[\W]/, '').downcase
  end

  def plaintext_segments
    normalize_length = normalize_plaintext.length
    short_size = (normalize_length % size) == 0 ? nil : normalize_length % size
    normalize_plaintext.scan(/\w{#{size}}|\w{#{short_size}}/)
  end

  def cipher
    ciphertext = []
    string_segment = ''

    size.times do |int|
      plaintext_segments.each do |segment|
        string_segment << segment.slice(int) if int < segment.length
      end
      ciphertext << string_segment
      string_segment = ''
    end

    ciphertext
  end

  def ciphertext
    cipher.join
  end

  def normalize_ciphertext
    cipher.join(' ')
  end
end

message = Crypto.new('Vampires are people too!')

# p message.message
# p message.size
p message.normalize_plaintext
p message.plaintext_segments
# p message.ciphertext
# p message.normalize_ciphertext