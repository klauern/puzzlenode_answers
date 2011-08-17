watch( '^spec/.*_spec\.rb' ) {|md| system("rspec spec/*")}
watch( '^lib/(.*)\.rb' )     {|md| system("rspec spec/*")}

