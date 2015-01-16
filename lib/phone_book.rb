class Contact
  attr_reader(:name, :info)

  @@all_contacts = []

  define_method(:initialize) do |attribute|
    @name = attribute.fetch(:name)
    @info = attribute.fetch(:info)
  end

  define_method(:save) do
    @@all_contacts.push(self)
    @id = @@all_contacts.length()
    self
  end

  define_singleton_method(:all) do
    @@all_contacts
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:clear) do
    @@all_contacts = []
  end







end
