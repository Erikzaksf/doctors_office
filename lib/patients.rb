class Patient
  attr_reader( :name, :dob, :doctor_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @dob = attributes.fetch(:dob)
    @doctor_id = attributes.fetch(:doctor_id)
  end

  def self.all
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each() do |patient|
      id = patient.fetch("id").to_i()
      name = patient.fetch("name")
      dob = patient.fetch("dob")
      doctor_id = patient.fetch("doctor_id").to_i()
      patients.push(Patient.new({name: name, dob: dob, doctor_id: doctor_id}))
    end
    patients
  end

  def ==(another_task)
   self.name().==(another_task.name()).&(self.doctor_id().==(another_task.doctor_id())).&(self.dob().==(another_task.dob()))
 end

  def save
    DB.exec("INSERT INTO patients (name, dob, doctor_id) VALUES ('#{@name}', '#{@dob}', '#{@doctor_id}')RETURNING id;")
  end

end
