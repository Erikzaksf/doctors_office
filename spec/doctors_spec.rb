require 'spec_helper'
require 'doctors'
describe(Doctor) do
  describe(".all") do
    it("empty at first") do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves doctor info") do
      doctor = Doctor.new({:id => nil, :name => "Jane Doe", :specialty_id => "2"})
      doctor.save()
      expect(Doctor.all()).to(eq([doctor]))
    end
  end

  describe("#==") do
     it("is the same doctor if it has the same description") do
       doctor1 = Doctor.new({:name => "Jane Doe", :specialty_id => "2"})
       doctor2 = Doctor.new({:name => "Jane Doe", :specialty_id => "2"})
       expect(doctor1).to(eq(doctor2))
     end
   end

end
