require 'spec_helper'

RSpec.describe EcsClaims::Client do
  let(:client) { EcsClaims::Client.new(token: TOKEN, url: URL, rfc: RFC) }
  let(:claim) { EcsClaims::Claim.new(client) }

  it 'catches HTTP 500 errors', :vcr do
    expect { claim.create({}) }.to raise_error(Faraday::ClientError,
      'the server responded with status 500')
  end
end
