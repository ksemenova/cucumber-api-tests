When(/^I GET health endpoint$/) do
  @url = "#{@api_url}/health"
  puts @url
  @method = :get
  @payload = nil
end

Then(/^API responds with code (\d+)$/) do |expected_code|
  @payload = @payload.to_json unless @payload.nil? || @payload.is_a?(String)
  puts "Payload: #{@payload}"
  begin
    @response = RestClient::Request.execute(:method => @method, :url => @url,  :payload => @payload, :headers => @headers)
    puts "Response: #{@response.body}"
  rescue => e
    @response = e.response
    print @response
    puts "Response: #{@response.body}"
  end
  @response.code.to_s.should == expected_code
end

And(/^Response matches '([^']*)' pattern$/) do |pattern_name|
  pattern = $PATTERNS[pattern_name]
  @response.body.should match_json_expression(pattern)
end

And(/^Error title is '([^']*)'$/) do |title|
  actual_title = JsonPath.on(@response.to_json, '$.error').first
  actual_title.should == title
end

# And(/^Error message is '([^']*)'$/) do |error_message|
#   actual_message = JsonPath.on(@response.to_json, '$.errors.detail.message').first
#   actual_message.should include(error_message)
# end
#
# And(/^Error description is '([^']*)'$/) do |error_description|
#   actual_description = JsonPath.on(@response.to_json, '$.errors.detail[0].description').first.gsub(/"/, '').gsub(/'/, '')
#   actual_description.should include(error_description)
# end