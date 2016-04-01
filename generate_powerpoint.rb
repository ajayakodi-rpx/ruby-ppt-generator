#!/usr/bin/env ruby
require 'java'
require 'matrix'
require File.expand_path('../powerpoint/powerpoint_generator', __FILE__)
require File.expand_path('../lib/poi-3.14-20160307.jar', __FILE__)
require File.expand_path('../lib/poi-scratchpad-3.14-20160307.jar', __FILE__)

module HSLFModel
  include_package 'org.apache.poi.hslf.usermodel'
end

module SLModel
  include_package 'org.apache.poi.sl.usermodel'
end

input = Matrix[
  ["INPUT INFORMATION", "NUMBER OF ROWS"],
  ["Item identifiers", "11559"],
  ["Vendor locations", "300"],
  ["Purchase History Number", "10000"],
  ["Total # of requests", "10200038"]
]

# Test PPT creation
generator = PowerpointGenerator.new(input)
generator.populate_table
generator.adjust_view
generator.write_to_file('test_file.ppt')

# Database Based PPT creation
generator.generate_portfolio_ppt
