class Track < ApplicationRecord

  SHORT = 180000
  LONG = 360000

  scope :starts_with_scope, -> (char) { where('name ILIKE ?', "#{char}%") }
  # def self.short
  #   # where('milliseconds < ?', SHORT)
  #   shorter_than(SHORT)
  # end
  scope :short, -> {shorter_than(SHORT)}

  # def self.medium
  #   # where('milliseconds >= ? AND milliseconds < ?', SHORT, LONG)
  #   longer_than(SHORT).shorter_than(LONG)
  # end
  scope :medium, -> {longer_than(SHORT).shorter_than(LONG)}

  # def self.long
  #   # where('milliseconds >= ?', LONG)
  #   longer_than(LONG)
  # end
  scope :long, -> {longer_than(LONG)}

  def self.shorter_than(milliseconds)
    where('milliseconds < ?', milliseconds)
  end

  def self.longer_than(milliseconds)
    where('milliseconds >= ?', milliseconds)
  end

  # def self.starts_with_method(char)
  #   if char.present
  #     { where('name ILIKE ?', "#{char}%") }
  #   else
  #     none
  #   end
  # end
end
