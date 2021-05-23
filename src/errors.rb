module Errors
  def self.url_not_found(response, user_id, code)
    response.status = 404
    {error: "Code #{user_id}/#{code} could not be found."}
  end

  def self.already_exists(response, user_id, code)
    response.status = 400
    {error: "Code #{user_id}/#{code} already exists."}
  end
end
