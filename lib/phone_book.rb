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

  define_singleton_method(:search) do |search_term|
    search_results = []
    @@all_contacts.each() do |contact_object|
      if contact_object.name().include?(search_term) || contact_object.info().include?(search_term)
        search_results.push(contact_object)
      end
    end
    search_results
  end






end
