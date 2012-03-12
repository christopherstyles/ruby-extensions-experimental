require 'rake/testtask'

desc "Run the unit tests"
Rake::TestTask.new("test") do |t|
  t.libs << "test"
  t.test_files = FileList['test/tc_*.rb']
  t.verbose = true
end

namespace :benchmark do
  desc "Benchmark the custom Array intersects methods against the native counterpart"
  task :array do
    require 'benchmark'
    require 'lib/extensions/array'  
    # Set some defaults
    n = ENV['count'].to_i || 1000
    a1 = (1..n).map{ rand(n) }
    a2 = (1..n).map{ rand(n) }  
    # Benchmark'em
    Benchmark.bm do |bench|
      bench.report("native ") { a1 & a2}
      bench.report("select ") { a1.intersects_with_select a2 }
      bench.report("collect") { a1.intersects_with_collect a2 }
      bench.report("while  ") { a1.intersects_with_while a2 }
      bench.report("for    ") { a1.intersects_with_for a2 }
    end
  end
end

task :default => [:test]
