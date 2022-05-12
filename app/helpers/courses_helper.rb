module CoursesHelper
  def enrollment_button(course)
    if current_user
      if course.user == current_user
        link_to "You created this course. View analytics", course_path(course), { :style => "font-size: xx-small" }
      elsif course.enrollments.where(user: current_user).any?
        link_to "You bought this course. Keep learning", course_path(course), { :style => "font-size: xx-small" }
      elsif course.price > 0
        link_to number_to_currency(course.price), new_course_enrollment_path(course), class: "btn btn-sm btn-success"
      else
        link_to "Free", new_course_enrollment_path(course), class: "btn btn-sm btn-success"
      end
    else
      link_to "Check Price", course_path(course), class: "btn btn-sm btn-success"
    end
  end
end
