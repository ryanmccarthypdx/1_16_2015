require('rspec')
require('contact')
require('phone')
require('pry')

describe(Contact) do

  before() do
    Contact.clear()
  end

  describe('#save') do
    it("saves an entry to the main list") do
      test_contact = Contact.new({ :name => "Mr Plow", :info => "5035553223" })
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe('#all') do
    it("returns an array of all instances of Contact") do
      test_phone1 = Phone.new({ :home => "5035556258", :cell => "5035553223" })
      test_contact1 = Contact.new({ :name => "Mr Plow", :info => test_phone1 })
      test_phone2 = Phone.new({ :home => "5035551239", :cell => "5035554796" })
      test_contact2 = Contact.new({ :name => "Plow King", :info => test_phone2 })
      test_contact1.save()
      test_contact2.save()
      expect(Contact.all()).to(eq([test_contact1, test_contact2]))
    end
  end

  describe('#id') do
    it("returns the correct id for a contact entry") do
      test_phone1 = Phone.new({ :home => "5035556258", :cell => "5035553223" })
      test_contact1 = Contact.new({ :name => "Mr Plow", :info => test_phone1 })
      test_phone2 = Phone.new({ :home => "5035551239", :cell => "5035554796" })
      test_contact2 = Contact.new({ :name => "Plow King", :info => test_phone2 })
      test_contact1.save()
      test_contact2.save()
      expect(test_contact2.id()).to(eq(2))
    end
  end

  describe('#clear') do
    it("clears all contacts in one fell swoop") do
      test_phone1 = Phone.new({ :home => "5035556258", :cell => "5035553223" })
      test_contact1 = Contact.new({ :name => "Mr Plow", :info => test_phone1 })
      test_phone2 = Phone.new({ :home => "5035551239", :cell => "5035554796" })
      test_contact2 = Contact.new({ :name => "Plow King", :info => test_phone2 })
      test_contact1.save()
      test_contact2.save()
      Contact.clear
      expect(Contact.all()).to(eq([]))
    end
  end

  describe('.search') do
    it("returns an empty array if you search for something that isn't in the set") do
      test_phone1 = Phone.new({ :home => "5035556258", :cell => "5035553223" })
      test_contact1 = Contact.new({ :name => "Mr Plow", :info => test_phone1 })
      test_phone2 = Phone.new({ :home => "5035551239", :cell => "5035554796" })
      test_contact2 = Contact.new({ :name => "Plow King", :info => test_phone2 })
      test_contact1.save()
      test_contact2.save()
      expect(Contact.search("Marge Simpson")).to(eq([]))
    end

    it("returns an array with a single contact if you search something unique (name)") do
      test_phone1 = Phone.new({ :home => "5035556258", :cell => "5035553223" })
      test_contact1 = Contact.new({ :name => "Mr Plow", :info => test_phone1 })
      test_phone2 = Phone.new({ :home => "5035551239", :cell => "5035554796" })
      test_contact2 = Contact.new({ :name => "Plow King", :info => test_phone2 })
      test_contact1.save()
      test_contact2.save()
      expect(Contact.search("King")).to(eq([test_contact2]))
    end

    it("returns an array with a single contact if you search something unique (info)") do
      test_phone1 = Phone.new({ :home => "5035556258", :cell => "5035553223" })
      test_contact1 = Contact.new({ :name => "Mr Plow", :info => test_phone1 })
      test_phone2 = Phone.new({ :home => "5035551239", :cell => "5035554796" })
      test_contact2 = Contact.new({ :name => "Plow King", :info => test_phone2 })
      test_contact1.save()
      test_contact2.save()
      expect(Contact.search("796")).to(eq([test_contact2]))
    end

    it("returns an array with multiple contacts if you search something common (name)") do
      test_phone1 = Phone.new({ :home => "5035556258", :cell => "5035553223" })
      test_contact1 = Contact.new({ :name => "Mr Plow", :info => test_phone1 })
      test_phone2 = Phone.new({ :home => "5035551239", :cell => "5035554796" })
      test_contact2 = Contact.new({ :name => "Plow King", :info => test_phone2 })
      test_contact1.save()
      test_contact2.save()
      expect(Contact.search("Plow")).to(eq([test_contact1, test_contact2]))
    end

    it("returns an array with multiple contacts if you search something common (info)") do
      test_phone1 = Phone.new({ :home => "5035556258", :cell => "5035553223" })
      test_contact1 = Contact.new({ :name => "Mr Plow", :info => test_phone1 })
      test_phone2 = Phone.new({ :home => "5035551239", :cell => "5035554796" })
      test_contact2 = Contact.new({ :name => "Plow King", :info => test_phone2 })
      test_contact1.save()
      test_contact2.save()
      expect(Contact.search("555")).to(eq([test_contact1, test_contact2]))
    end
  end

  describe('.sel') do
    it('returns the object when you select it by its id') do
      test_phone1 = Phone.new({ :home => "5035556258", :cell => "5035553223" })
      test_contact1 = Contact.new({ :name => "Mr Plow", :info => test_phone1 })
      test_phone2 = Phone.new({ :home => "5035551239", :cell => "5035554796" })
      test_contact2 = Contact.new({ :name => "Plow King", :info => test_phone2 })
      test_phone3 = Phone.new({ :home => "5035558904", :cell => "5035556542"})
      test_contact3 = Contact.new({ :name => "Ned Flanders", :info => test_phone3 })
      test_contact1.save()
      test_contact2.save()
      test_contact3.save()
      expect(Contact.sel(3)).to(eq(test_contact3))
    end
  end





end
