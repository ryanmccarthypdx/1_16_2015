require('rspec')
require('phone_book')
require('pry')

describe(Contact) do

  before() do
    Contact.clear()
  end

  describe('#save') do
    it("saves an entry to the main list") do
      test_contact = Contact.new({ :name => "Mr Plow", :info => "503-KL5-3223" })
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe('#id') do
    it("returns the correct id for a contact entry") do
      test_contact1 = Contact.new({ :name => "Mr Plow", :info => "503-KL5-3223" })
      test_contact2 = Contact.new({ :name => "Plow King", :info => "503-555-4796" })
      test_contact1.save()
      test_contact2.save()
      expect(test_contact2.id()).to(eq(2))
    end
  end









end
