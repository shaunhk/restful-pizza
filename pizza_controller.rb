require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('./models/pizza_order.rb')
also_reload('./models/*')

#INDEX - SHOW all PIZZAS

get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

#CREATE - create a database entry for the pizza
post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end
#NEW - display a form for a new pizza

post '/pizza-orders/update/:id' do
  @order = PizzaOrder.new(params)
  @order.update()
  erb(:update)
end

get '/pizza-orders/new' do
  erb(:new)
end

post '/pizza-orders/edit/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end
#SHOW - DISPLAY one PIZZA

get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

#EDIT - display a form to edit a pizza order's details

#UPDATE - update database entry with above

#DELETE - delete a pizza order from the database

# get '/pizza-orders/delete/:id' do
#   @order = PizzaOrder.find(params[:id])
#   erb(:delete)
# end

post '/pizza-orders/deleted/:id' do
  order = PizzaOrder.find(params[:id])
  order.delete()
  erb(:deleted)
end
