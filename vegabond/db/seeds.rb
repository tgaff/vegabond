Post.destroy_all
puts "all previous seeds have been removed"

Post.create({title:"Taiwan", city:"Taipei", story:"邝楠何关是一个善良的人，
  从来没杀过任何有生命的东西。他有含银千件，他存放在棺材罐子。白蚂蚁，其中有在他的小区那么多，
  入侵棺材，吃银的一部分。当家人发现发生了什么事，他们追踪了蚂蚁数以百万计人住一个空心洞穴。
  他们认为，如果他们把这些蚂蚁在坩埚中，或许他们可以恢复丢失的银的一部分。但何反对这项计划，
  他说：“我不忍看到杀害账户银小额所有这些许多动物.", author:"Ya Dang"})

Post.create({title:"California Surfing", city:"Santa Monica", story:"It’s just
me and my friends and the endless Summer. We are travelling on a boat to various
places, places with BIG waves. Waves you can only dream of.
The boat is set up for cruising and surfing trips. The kitchen
is small, with two sinks, but only one tap. The beds are double bunks and only
one foot away from each other. There is a storage room for the boards and other
surfing equipment.", author:"Wavey Clavey"})

Post.create({title:"The bar", city:"Berlin", story:"Went to the bar, got kicked out", author:"Ash"})

Post.create({title:"The restaurant", city:"Oakland", story:"Best soup in the world", author:"Ash"})

puts "new seeds have been plotted"
