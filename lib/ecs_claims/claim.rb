module EcsClaims
  class Claim
    def initialize(client)
      @client = client
    end

    def create(parameters={})
      client.request(:post, "/proveedores/#{rfc}/eventos", parameters)
    end

    def fetch(id)
      client.request(:get, "/proveedores/#{rfc}/eventos/#{id}")
    end

    private
    def rfc
      client.rfc
    end

    def client
      @client
    end
  end
end
