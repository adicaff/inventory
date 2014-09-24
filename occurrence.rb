class Occurrence

  # Find the first occurrence index and count of a number
  #   into an array of numbers.
  #
  # @param [Array<Object>] objects  an array of objects to search
  #   for the first index and occurrences.
  # @param [Object] object_to_find the number to find the
  #   occurrences and first index in the array.
  #
  # @return [Array<Fixnum>] an array with the first index
  #   of the occurrence and the count of occurrences.
  def self.search_for_occurrences(objects, object_to_find)
    objects ||= []

    index = objects.find_index(object_to_find)
    occu = objects.count(object_to_find)
    [index, occu]
  end
end