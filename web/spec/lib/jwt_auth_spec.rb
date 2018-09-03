require './spec/spec_helper'

describe JwtAuth do

  before do
    allow(Time).to receive(:now).and_return(1)
  end

  context "#payload" do
    it 'should generates the payload' do
      expect(JwtAuth.payload("some username")).to eq({
        exp: Time.now.to_i + 60 * 60,
        iat: Time.now.to_i,
        iss: "example.com",
        user: { username: "some username" }
      })
    end
  end

  context '#token' do
    it 'should generate token' do
      expect(JwtAuth.token('username')).to eq('eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjM2MDEsImlhdCI6MSwiaXNzIjoiZXhhbXBsZS5jb20iLCJ1c2VyIjp7InVzZXJuYW1lIjoidXNlcm5hbWUifX0.K8FhHwsoNheLk6GjrVkgws1G1XJcZQYuzVdXQ5qSYPA')
    end
  end
end
