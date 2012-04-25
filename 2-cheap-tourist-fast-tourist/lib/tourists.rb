$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'graph/db'
require 'file_parser'
require 'military_time'

$file = load_input_file()

