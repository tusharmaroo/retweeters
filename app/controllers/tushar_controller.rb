class TusharController < ApplicationController

  def index
  	client = Twitter::REST::Client.new do |config|
	  config.consumer_key        = "CtIM8qPkPFQ808mwleqV6g"
	  config.consumer_secret     = "dFi4BqUlqpeWsyGKkaq869GszIsReIyWVF24QLjio"
	end
  	#temp = "419461577310347264"
  	temp = ["421482309502922752","421336877887946752","421066920151232512","421001057477861376","420633473939177472",
  		"420619246297968640","420594049285107712","420223502789402624","418840373348544512","418826970273947648"]
  	@array = Array.new
	ary = Array.new
  	for temp1 in temp do
  		url = 'https://api.twitter.com/1.1/statuses/retweets/'+temp1+'.json?trim_user=false&&size=original'
		#url = 'https://api.twitter.com/1.1/statuses/'+temp+'/retweeted_by.json'
		@responses = client.get(url).body	
		@responses.each do |response|
			name = response[:user][:name]
			count = response[:user][:followers_count]
			image = response[:user][:profile_image_url]
			image1 = image.gsub("_normal", "")
			ary = [name, count, image1]
			@array << ary
		end
  	end
	
	@array1 = @array.uniq
	@sorted = @array1.sort {|a,b| b[1] <=> a[1]}
	@sorted1 = @sorted.first(10)
  end
end
