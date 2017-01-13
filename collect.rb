require 'find'
require 'json'

src_dir = '/Volumes/My Passport for Mac/xyz/experimental_fgd/18'
src_x = 113
src_y = 51
d = 2 ** 11
d.times {|dx|
  x = src_x * d + dx
  d.times {|dy|
    y = src_y * d + dy
    path = "#{src_dir}/#{x}/#{y}.geojson"
    next unless File.exist?(path)
    json = JSON::parse(File.read(path))
    json['features'].each {|feat|
      feat[:tippecanoe] = {:minzoom => 13} if %w{普通建物 一般等高線}.include?(feat['properties']['type'])
      print JSON::dump(feat), "\n"
    }
  }
}

