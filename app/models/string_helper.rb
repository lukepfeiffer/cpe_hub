class StringHelper
  def self.is_num?(string)
    true if Float(string) rescue false
  end

  def self.is_letter?(string)
    string.match(/^[[:alpha:]]$/).nil? ? false : true
  end

  def self.num_letters(string)
    string.count("a-zA-Z")
  end

  def self.num_digits(string)
    string.count("0-9")
  end

  def self.is_integer?(string)
    true if Integer(self) rescue false
  end

  def rchomp(sep = $/)
    self.start_with?(sep) ? self[sep.size..-1] : self
  end
end
