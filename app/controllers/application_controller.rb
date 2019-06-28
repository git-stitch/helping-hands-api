class ApplicationController < ActionController::API
  def encode_token(user_id)
    JWT.encode({user_id: user_id}, "BananasInCabanas")
  end

  def org_encode_token(organization_member_id)
    JWT.encode({organization_member_id: organization_member_id}, "BananasInCabanas")
  end
  
  def get_auth_headers
    request.headers["Authorization"]
  end

  def decode_token
    begin
      JWT.decode(get_auth_headers, "BananasInCabanas")[0]["user_id"]
    rescue
      nil
    end
  end

  def org_decode_token
    begin
      JWT.decode(get_auth_headers, "BananasInCabanas")[0]["organization_member_id"]
    rescue
      nil
    end
  end

  def session_user
    User.find_by(id: decode_token)
  end

  def org_session_user
    OrganizationMember.find_by(id: decode_token)
  end
end
