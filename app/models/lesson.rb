class Lesson < ActiveRecord::Base
  validates :name, :presence => true
  validates :content, :presence => true
  validates :number, :presence => true

  def next
    if (self == Lesson.last)
      Lesson.first
    else
      next_lesson = Lesson.where("number > (?)", self.number).first
    end
  end
end
