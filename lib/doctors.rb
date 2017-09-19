class Doctor
  attr_reader(:id, :name, :specialty_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @specialty_id = attributes.fetch(:specialty_id)

  end

  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      specialty_id = doctor.fetch("specialty_id")
      id = doctor.fetch("id").to_i()
      doctors.push(Doctor.new({name: name, specialty_id: specialty_id}))
    end
    doctors
  end

  def ==(another_task)
   self.name().==(another_task.name()).& (self.specialty_id().==(another_task.specialty_id()))
 end

  def save()
    result = DB.exec("INSERT INTO doctors (name, specialty_id) VALUES ('#{@name}', '#{@specialty_id}')RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

end
