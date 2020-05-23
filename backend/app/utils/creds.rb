class Creds
  def self.get(*args)
    method = args.shift
    Rails.application.credentials.public_send(method)&.dig(*args)
  end
end