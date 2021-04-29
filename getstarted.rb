require 'mongo'
require 'json'

mongoURI = ENV['MONGODB_URI']


puts "Connecting to MongoDB"
mongoClient = Mongo::Client.new(mongoURI, :database => 'getstarted')
collection = mongoClient[:ruby]

puts "Dropping collection 'getstarted.ruby' (command)"
collection.drop

# make a document and insert it
puts "Inserting a single document"
document = { name: "MongoDB", type: "database", count: 1, info: {x: 203, y: 102}}
collection.insert_one(document)

# insert many
documents = Array.new

for i in 1..10
	document = {type:"database", info: {x:i}}
	documents.push document
end

puts "Inserting many documents"
collection.insert_many(documents)

# lets get all the documents in the collection and print them out
puts "Querying using find()"
collection.find.each do |document|
	puts JSON.pretty_generate(document)
end

puts "Query documents with a predicate"
# now use a query to get 1 document out
myDocument = collection.find(:i => 3).first
puts JSON.pretty_generate(myDocument)

# Sorting
puts "Query a document with a sort()"
myDocument = collection.find().sort(:i => -1).first
puts JSON.pretty_generate(myDocument)

# Projection
puts "Query a document and use projection"
myDocument = collection.find({},{'projection' => {'_id' => 0 }}).first
puts JSON.pretty_generate(myDocument)

# aggregation
aggregation = collection.aggregate([
	{'$group'=> {'_id'=> 'null', 'total'=> {'$sum'=> "$info.x"}}},
])

puts "Aggregation result:"
aggregation.each do |document|
	puts JSON.pretty_generate(document)
end

# release resources
puts "Finished."
mongoClient.close