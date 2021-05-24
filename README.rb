# Slices
Slices takes a 1d array, and returns a 2d array with X number of
chunks.  Remainder is distributed round-robin, starting with the
first element. For example:

  alphabet = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  pp slices(4, alphabet)

  ==>[["a", "b", "c", "d", "e", "f", "y"],
      ["g", "h", "i", "j", "k", "l", "z"],
      ["m", "n", "o", "p", "q", "r"],
      ["s", "t", "u", "v", "w", "x"]]

matt.a.feenstra@gmail.com
-------
```ruby
random_array_generator = ->{ nums = []; 1..100.times { nums << rand(100000) }; nums  }
slices(7, random_array_generator.call)
```
Test Output:
```ruby
slices(7, random_array_generator.call).each.with_index(1) { |e, i| puts "#{i}: #{e}"  }
1: [15549, 63888, 29039, 59624, 21179, 40532, 21494, 13167, 54884, 27034, 45570, 95465, 89429, 21374, 14105]
2: [70501, 18553, 80737, 10800, 89867, 12198, 56142, 65431, 40911, 28425, 12990, 70065, 93112, 40659, 92035]
3: [19595, 12909, 62205, 57208, 3820, 25248, 97048, 75145, 25249, 36043, 86406, 67679, 77555, 31778]
4: [81974, 89360, 9898, 98881, 74693, 57970, 96360, 83634, 16487, 86773, 86169, 76211, 30594, 27436]
5: [64857, 91287, 51215, 90894, 21285, 84792, 66221, 76618, 81901, 80984, 77291, 12804, 82305, 15085]
6: [31836, 61325, 17293, 40844, 75188, 70198, 20201, 9145, 79674, 92353, 80038, 16149, 89891, 72515]
7: [99344, 99886, 8234, 53476, 77900, 99405, 68349, 5682, 22675, 87709, 94836, 38146, 70574, 2180]
```
