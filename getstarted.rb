require 'mongo'
require 'json'

mongoURI = "mongodb+srv://tse:FreshPeopleCheer@ts-cluster-ci22a.mongodb.net/csharp?retryWrites=true"

mongoClient = Mongo::Client.new(mongoURI)
database = mongoClient.database
collection = mongoClient[:tour]

collection.drop

# make a document and insert it
document = { name: "MongoDB", type: "database", count: 1, info: {x: 203, y: 102}}
collection.insert_one(document)

# insert many
documents = Array.new

for i in 1..10
	document = {i: i}
	documents.push document
end

collection.insert_many(documents)

# lets get all the documents in the collection and print them out
collection.find.each do |document|
	puts JSON.pretty_generate(document)
end

# now use a query to get 1 document out
myDocument = collection.find(:i => 3).first
puts JSON.pretty_generate(myDocument)

# Sorting
myDocument = collection.find().sort(:i => -1).first
puts JSON.pretty_generate(myDocument)

# Projection
myDocument = collection.find({},{'projection' => {'_id' => 0 }}).first
puts JSON.pretty_generate(myDocument)

# aggregation
database = mongoClient.use('taxidata')
collection = database[:chicago]
aggregation = collection.aggregate([
	{'$match'=> {'trip_seconds' => {'$gte' => 1000}}},
	{'$group'=> {'_id'=> '$payment_type', 'total_tips'=> {'$sum'=> $tips}, 'pickup_area'=> {'$addToSet'=> $pickup_community_area}}},
	{'$project'=> {:payment_type=> '$_id', :total_tips=> '$total_tips', :pickup_area => '$pickup_area', :_id => 0}}
])

aggregation.each do |document|
	puts JSON.pretty_generate(document)
end

# release resources
mongoClient.close