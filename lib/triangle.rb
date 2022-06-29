class Triangle
  # write code here

  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    # if (side1 + side2 <= side3) || (side1 + side3 <= side2) || (side3 + side2 <= side1) || side1 <= 0 || side2 <= 0 || side3 <= 0
    #   raise TriangleError
    # else
      @side1 = side1
      @side2 = side2
      @side3 = side3
    # end
  end


  def kind 
    validate_triangle
    if (side1 == side2) && (side2 == side3) && (side1 == side3)
      type = :equilateral
    elsif (side1 == side2) || (side2 == side3) || (side1 == side3)
      type = :isosceles
    else
      type = :scalene
    end
  end

  def sides_greater_than_zero?
    [side1, side2, side3].all?(&:positive?)
  end

  def valid_triangle_inequality?
    (side1 + side2 > side3) && (side1 + side3 > side2) && (side3 + side2 > side1)
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end

  class TriangleError < StandardError
    def message
      'Each side must be larger than 0 and satisfy the triangle inequality'
    end
  end
end
