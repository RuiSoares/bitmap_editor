module Insertion
  def is_colour?(colour)
    (colour =~ /\A[A-Z]\z/) == 0
  end
end
