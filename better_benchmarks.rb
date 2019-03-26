require 'benchmark'
require 'prawn'
require 'squid'

class BetterBenchmarks
  class << self

    def time_vs_array_size(method, array)
      test_arrays = build_test_arrays(array)

      data = {}

      test_arrays.each do |test_array|
        data[test_array.length.to_i] = mean_benchmark(method, test_array)
      end

      Prawn::Document.generate "#{method.to_s}#{Time.now}.pdf" do
        chart({method.to_s => data}, {type: :point})
      end
    end

    def build_test_arrays(array)
      test_arrays = []
      step_size = array.length / 5

      5.times do
        test_arrays << array
        array = array.drop(step_size)
      end

      test_arrays.reverse
    end

    def mean_benchmark(method, array)
      benchmarks = []
      Benchmark.bm do |x|
        10.times do
          benchmarks << x.report(array.length) { array.send(method) }
        end
      end

      totals = benchmarks.map(&:total)
      mean = mean(totals)
      in_microseconds(mean)
    end

    def in_microseconds(seconds)
      seconds * 1000 * 1000
    end

    def mean(nums_array)
      nums_array.sum / nums_array.length.to_f
    end
  end
end
