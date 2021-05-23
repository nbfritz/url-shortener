# frozen_string_literal: true

require 'roda'


class App < Roda
  plugin :json
  plugin :json_parser

  route do |r|
    r.on String do |user_id|
      r.post do
        code, url = r.POST['code'], r.POST['url']

        begin
          Codes.create(user_id, code, url)
        rescue Aws::DynamoDB::Errors::ConditionalCheckFailedException
          Errors.already_exists(response, user_id, code)
        end
      end

      r.on String do |code|
        ret = Codes.get(user_id, code)

        r.on "go" do
          r.redirect(ret['url'])
        end

        ret.empty? ? Errors.url_not_found(response, user_id, code) : ret
      end
    end
  end
end

