require 'rails_helper'

RSpec.describe 'Search Prices per ticket and date' do
    it 'should return results' do
        post '/prices/ticket', :params => {"ticket_name"=>"VALE3.SA", "date"=>"2000-01-03", "price"=>{"date"=>"2000-01-03"}}
        expect(response).to have_http_status(200)
    end
end

            # { "ticket_name" => "MGLU3.SA", "date" }
#         post 'Search Ticket' do 
#             tags 'Prices'
#             consumes 'application/json', 'application/xml'
#             parameter [ticket_name:, date:] :price, in: :body, schema: {
#                 type: :object,
#                 properties: {
#                     ticket_name: { type: :string },
#                     # open_price: { type: :decimal },
#                     # highest_price: { type: :decimal },
#                     # lowest_price: { type: :decimal },
#                     # volume: { type: :decimal },
#                     # close_price: { type: :decimal },
#                     date: { type: :date }
#                     # ticket_id: { type: :integer }
#                 }
#                 required: ['date','ticket_name']
#             }
#             response '200', 'price created' do
#                 let(:price) { { 
#                     # open_price: '0.50312k5', 
#                 #                 highest_price: '0.518750',
#                 #                 lowest_price: '0.312343',
#                 #                 volume: '0.432323',
#                 #                 close_price: '0.432323',
#                                 date: '2011-05-16',
#                                 ticket_name: 'MGLU3.SA'
#                             } }
#                 run_test!
#             end

#             response '422', 'invalid request' do
#                 let(:pet) { { ticket_name: '' } }
#                 run_test!
#             end
#         end
#     end
# end
