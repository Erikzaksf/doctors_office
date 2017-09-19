class Doctor
  attr_reader(:id, :name, :specialty)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
  end

  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      id = doctor.fetch("id").to_i()
      specialty = doctor.fetch("specialty")
      doctors.push(Doctor.new({name: name, specialty: specialty}))
    end
    doctors
  end

  def ==(another_task)
   self.name().==(another_task.name()).&(self.specialty().==(another_task.specialty()))
 end

  def save()
    result = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}')RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

end
