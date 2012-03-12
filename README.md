# (Experimental) Extensions for Ruby README

## Introduction

This project contains experimental Ruby extensions, used exclusively as an explorative process rather than production solutions. It's simply play!

## What's included

Currently included in this project are the following
  
    Array#intersects
  
## Usage

You can include extensions easily in a Ruby program

    require 'extensions/array'
    puts [1,1,2,3,3,3,4].instersects [1,2,3,18,24] # => [1,2,3]
  
## Unit Tests

Unit tests are located in the <tt>test</tt> directory and can be run using Rake, with <tt>rake test</tt>.

## Benchmarks

You can run benchmarks on the various extension methods using Rake
    rake benchmark:array
    
    # Alternately, specify the number of benchmarked array items
    rake benchmark:array count=100000
    
