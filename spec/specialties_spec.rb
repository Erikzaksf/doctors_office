require 'spec_helper'
require "specialties"

describe(Specialty) do
  describe(".all") do
    it("empty at first") do
      expect(Specialty.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves patient info") do
      specialty_type = Specialty.new({:type => "CARD"})
      specialty_type.save()
      expect(Specialty.all()).to(eq([specialty_type]))
    end
  end

  describe("#==") do
     it("is the same patient if it has the same description") do
       patient1 = Specialty.new({:type => "CARD"})
       patient2 = Specialty.new({:type => "CARD"})
       expect(patient1).to(eq(patient2))
     end
   end

end
