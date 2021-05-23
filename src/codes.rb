require 'aws-sdk-dynamodb'

DDB = Aws::DynamoDB::Client.new


module Codes
  def self.get(user_id, code)
    item = DDB.get_item(
      key: {user_id: user_id, code: code},
      table_name: ENV['CODES_TABLE']
    ).to_hash
    item[:item] || {}
  end

  def self.create(user_id, code, url)
    DDB.put_item(
      table_name: ENV['CODES_TABLE'],
      item: {
        user_id: user_id,
        code: code,
        url: url
      },
      expected: {
        user_id: {exists: false},
        code: {exists: false}
      }
    ).to_hash
  end
end

