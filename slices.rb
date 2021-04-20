# Slices takes a 1d array, and returns a 2d array with X number of
# chunks.  Remainder is distributed round-robin, starting with the 
# first element. For example:
#
#   alphabet = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
#   pp slices(4, alphabet)
#
#   ==>[["a", "b", "c", "d", "e", "f", "y"],
#       ["g", "h", "i", "j", "k", "l", "z"],
#       ["m", "n", "o", "p", "q", "r"],
#       ["s", "t", "u", "v", "w", "x"]]
# 
# matt.a.feenstra@gmail.com

def slices(chunks, ary)
  if (
     !(chunks.is_a?(Integer)) || (chunks > ary.size) ||
     chunks.negative? || chunks.zero? || !(ary.is_a? Array)
     ) then
    STDERR.puts 'ERROR: my_slices - bad args'; return nil end
  width = ary.size / chunks
  remainder = ary.size % chunks
  results = []; i = 0
  ary_orig = ary.dup; ary_tmp = ary.dup
  0..chunks.times do results << ary_tmp.slice!(0,width) end
  if remainder > 0 then
    i = 0;
    ary_orig.last(remainder).each do |entry|
      results[i] << entry
      if i < results.size then i += 1 else i = 0 end
    end
  end
  results
end

