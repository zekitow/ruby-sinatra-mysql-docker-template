require './spec/spec_helper'

describe HomeController do

  context 'when I am authorized' do
    context 'GET /' do
      subject { get '/', {}, auth_header }

      context 'when I access the root page' do
        it { expect(subject.status).to eql(200) }
        it { expect(subject.body).to include('403 Forbidden') }
      end
    end
  end
end