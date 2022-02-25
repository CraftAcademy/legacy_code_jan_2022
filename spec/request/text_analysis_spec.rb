# frozen_string_literal: true

RSpec.describe Api::AnalysesController, type: :request do
  describe 'Text analysis' do
    describe 'successfully' do
      before do
        post '/api/analyses', params: { "analysis": { "resource": 'Are you fucking stupid???', "category": 'text' } }
      end

      it 'is expected to return a status code of 200' do
        expect(response.status).to eq 200
      end

      it 'is expected to return results of analysis of text' do
        expect(eval(JSON.parse(response.body)['results']['classifications'])[0]['tag_name']).to eq 'profanity'
      end

      it 'is expected to return a degree of certainty with results' do
        expect(eval(JSON.parse(response.body)['results']['classifications'])[0]['confidence']).to be_within(0.5).of(0.5)
      end
    end

    describe 'unsuccessfully' do
      describe 'when the category is missing' do
      end
      before do
        post '/api/analyses', params: { "analysis": { "resource": 'Are you fucking stupid???', "category": 'text' } }
      end

      it 'is expected to return an empty result' do
        expect(JSON.parse(response.body)['results']['external_id']).to eq nil
      end
    end
  end
end
