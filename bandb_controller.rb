require ('sinatra')
require ('sinatra/contrib/all')
require ('pry-byebug')
require_relative('./models/booking')

get '/booking/new' do
  erb(:new)
end

post '/booking' do
  @booking = Booking.new(params)
  #save to db
  # binding.pry
  @booking.save()
  erb(:create)
end

get '/booking' do
  @bookings = Booking.all()
  erb(:index)
end