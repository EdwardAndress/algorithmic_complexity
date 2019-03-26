require_relative './into.rb'
require_relative './better_benchmarks.rb'

# last
# build the biggest array that will be used
array = [1] * 1000 * 1000 * 10
# do the benchmarking and plot the data
BetterBenchmarks.time_vs_array_size(:last, array)

# shuffle
# build the biggest array that will be used
array = [1] * 1000 * 1000 * 10
# do the benchmarking and plot the data
BetterBenchmarks.time_vs_array_size(:shuffle, array)

# reverse
# build the biggest array that will be used
array = [1] * 1000 * 1000 * 10
# do the benchmarking and plot the data
BetterBenchmarks.time_vs_array_size(:reverse, array)

# sort
# build the biggest array that will be used
array = [1] * 1000 * 1000 * 10
array = array.map { |n| rand(0..9) }
# do the benchmarking and plot the data
BetterBenchmarks.time_vs_array_size(:sort, array)

# into
# build the array
array = ['theresa', 'boris', 'jacob', 'dominic', 'david', 'amber', 'liz', 'yvette']
# do the benchmarking and plot the data
BetterBenchmarks.time_vs_array_size(:into, array)
