task :default do
  sh "ruby collect.rb > data.ndjson"
  sh "../tippecanoe/tippecanoe --maximum-zoom=16 -P -f -o data.mbtiles --layer=gsi-fgd data.ndjson"
end
