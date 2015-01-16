require('rspec')
require('phone_book')
require('pry')

describe(Contact) do

  describe('#save') do
    it("saves an entry to the main list") do
      test_contact = Contact.new({ :name => "Mr Plow", :info => "503-KL5-3223" })
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end

  end










end
