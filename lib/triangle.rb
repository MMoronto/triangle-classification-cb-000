class Triangle
    attr_accessor :length_a, :length_b, :length_c
  
    def initialize(length_a, length_b, length_c)
      @length_a = length_a 
      @length_b = length_b
      @length_c = length_c  
    end 
  
    def kind
      validate_triangle
      if length_a == length_b && length_b == length_c
          :equilateral
      elsif length_a == length_b || length_b == length_c || length_a == length_c
          :isosceles
      else
          :scalene
      end 
    end
    
    def validate_triangle
      legit_triangle = [(length_a + length_b > length_c),
      (length_a + length_c > length_b), (length_b + length_c > length_a)]
      [length_a, length_b, length_c].each {|side| legit_triangle << false if side <= 0}
      raise TriangleError if legit_triangle.include?(false)
    end
    
    class TriangleError < StandardError
      # triangle error code
    end
    
end
