require 'unit/spec_helper'

module Infrataster
  module Resources
    describe HttpResource do
      context "with no scheme URI" do
        it "complements scheme" do
          resource = HttpResource.new('/path/to/resource')
          expect(resource.uri.scheme).to eq('http')
        end
      end

      context "with scheme and host in URI" do
        it "uses scheme and host" do
          resource = HttpResource.new('http://app.example.com')
          expect(resource.uri.scheme).to eq('http')
          expect(resource.uri.host).to eq('app.example.com')
        end
      end

        context "with URI and params" do
          it "uses URI and params" do
            resource = HttpResource.new('http://app.example.com', params: {'foo' => 'bar' })
            expect(resource.uri.scheme).to eq('http')
            expect(resource.uri.host).to eq('app.example.com')
            expect(resource.params['foo']).to eq('bar')
          end
        end

      context "with URI and body" do
        it "uses URI and body" do
          resource = HttpResource.new('http://app.example.com', body: '{ "name": "Unagi" }')
          expect(resource.uri.scheme).to eq('http')
          expect(resource.uri.host).to eq('app.example.com')
          expect(resource.body).to eq('{ "name": "Unagi" }')
        end
      end

      context "with URI, headers, and JSON body" do
        it "uses URI, headers, and JSON body" do
          resource = HttpResource.new('http://app.example.com', headers: {'Content-Type' => 'application/json'}, body: '{ "name": "Unagi" }')
          expect(resource.uri.scheme).to eq('http')
          expect(resource.uri.host).to eq('app.example.com')
          expect(resource.headers['Content-Type']).to eq('application/json')
          expect(resource.body).to eq('{ "name": "Unagi" }')
          
        end
      end











    end
  end
end
