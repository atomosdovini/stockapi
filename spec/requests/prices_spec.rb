require 'rails_helper'

RSpec.describe 'Search Prices per ticket and date' do
    it 'responds 200' do
        post '/prices/ticket', :params => {"ticket_name"=>"VALE3.SA", "date"=>"2000-01-03", "price"=>{"date"=>"2000-01-03"}}
        expect(response).to have_http_status(200)
    end
end

# RSpec.describe 'Delete ticket' do
#     it 'reponds 204' do
#         delete '/tickets/:id', :params => {"ticket" =>{"id"=>"5"}}
#         expect(response).to have_http_status(204)
#     end
# end
 