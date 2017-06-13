class Track < ApplicationRecord

  SHORT = 180000
  LONG = 360000

  def self.short
    # where('milliseconds < ?', SHORT)
    shorter_than(SHORT)
  end

  def self.medium
    # where('milliseconds >= ? AND milliseconds < ?', SHORT, LONG)
    longer_than(SHORT).shorter_than(LONG)
  end

  def self.long
    # where('milliseconds >= ?', LONG)
    longer_than(LONG)
  end

  def self.shorter_than(milliseconds)
    where('milliseconds < ?', milliseconds)
  end

  def self.longer_than(milliseconds)
    where('milliseconds >= ?', milliseconds)
  end
end
