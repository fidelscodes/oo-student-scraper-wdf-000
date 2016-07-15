class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    # can also use self.send here
    # @name = student_hash[:name]
    # @location = student_hash[:location]
    # @twitter = student_hash[:twitter]
    # @linkedin = student_hash[:linkedin]
    # @github = student_hash[:github]
    # @blog = student_hash[:blog]
    # @profile_quote = student_hash[:profile_quote]
    # @bio = student_hash[:bio]
    # @profile_url = student_hash[:profile_url]

    student_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end

    @@all << self
  end

  def self.create_from_collection(students_array)
    students_array.each do |student|
      new_student = Student.new(student)
      @@all << new_student
    end
  end

  def add_student_attributes(attributes_hash)
    # self.twitter = attributes_hash[:twitter]
    # self.linkedin = attributes_hash[:linkedin]
    # self.github = attributes_hash[:github]
    # self.blog = attributes_hash[:blog]
    # self.profile_quote = attributes_hash[:profile_quote]
    # self.bio = attributes_hash[:bio]
    # self.profile_url = attributes_hash[:profile_url]

    # Using the .send= method avoids code smell
    attributes_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
  end

  def self.all
    @@all
  end
end