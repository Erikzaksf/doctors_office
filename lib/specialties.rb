class Specialty
  attr_reader(:id, :type)

  def initialize(attributes)
  @type = attributes.fetch(:type)
  end

  def self.all
    returned_specialties = DB.exec("SELECT * FROM specialties;")
    specialties = []
    returned_specialties.each() do |specialty|
      id = specialty.fetch("id").to_i()
      type = specialty.fetch("type")
      specialties.push(Specialty.new({type: type}))
    end
    specialties
  end

  def ==(another_task)
   self.type().==(another_task.type())
 end

  def save
    DB.exec("INSERT INTO specialties (type) VALUES ('#{@type}')RETURNING id;")
  end

end
