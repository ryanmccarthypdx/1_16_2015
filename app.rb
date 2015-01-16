require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/contact.rb')
require('./lib/phone.rb')

get('/') do
  @title = "My Contact List"
  @contact_list = Contact.all()
  erb(:main)
end

post('/posted') do
  @title = "My Contact List"
  @contact_list = Contact.all()
  @name = params.fetch("name")
  @home = params.fetch("home")
  @cell = params.fetch("cell")
  new_phone = Phone.new({ :home => @home, :cell => @cell })
  new_contact = Contact.new({ :name => @name, :info => new_phone })
  new_contact.save()
  erb(:main)
end

get('/results') do
  @title = "Search Results"
  @search_results = Contact.search(params.fetch("search_term"))
  erb(:results)
end

get('/info/:selection') do
  @title = "Contact Info"
  @selected = Contact.sel((params.fetch('selection').to_i()))
  @name = @selected.name()
  @home = @selected.info().home()
  @cell = @selected.info().cell()
  erb(:info)
end

post('/delete_all') do
  @title = "My Contact List"
  Contact.clear()
  @contact_list = Contact.all()
  erb(:main)
end
