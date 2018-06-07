class Doctor

  attr_accessor :name
@@all_doctors = []

  def initialize(name)
    @name = name
    @@all_doctors << self
  end

  def self.all
    @@all_doctors
  end

  def new_appointment(patient, date)
    Appointment.new(patient, self, date)
  end

  def appointments
    Appointment.select do |appointment|
    appointment.doctor == self
    end
  end

  def patients
    self.appointments.collect do |appointment|
      appointment.patient
    end
  end
end
