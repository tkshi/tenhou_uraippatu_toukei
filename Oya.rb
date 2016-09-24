class Oya
  def initialize(name_array)
    @name_array = name_array
  end
  def getOya(kyoku_number)
    @name_array[kyoku_number - 1]
  end
  def oya?(kyoku_number,name)
    if @name_array[kyoku_number - 1] == name
      true
    else
      false
    end
  end
end
