require 'spec_helper'
require "patients"
describe(Patient) do
  describe(".all") do
    it("empty at first") do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves patient info") do
      patient_schedule = Patient.new({:name => "Jane Doe", dob: '2001-01-01', doctor_id: 1})
      patient_schedule.save()
      expect(Patient.all()).to(eq([patient_schedule]))
    end
  end

  describe("#==") do
     it("is the same patient if it has the same description") do
       patient1 = Patient.new({:name => "Jane Doe", doctor_id: 1, dob: '2001-01-01'})
       patient2 = Patient.new({:name => "Jane Doe", doctor_id: 1, dob: '2001-01-01'})
       expect(patient1).to(eq(patient2))
     end
   end

end
