class Dessert
    attr_accessor :name
    attr_accessor :calories 

    def initialize(name, calories)
        raise ArgumentError.new("Name cannot be empty, you put") unless name.empty? == false
        raise ArgumentError.new("Calories cannot be a negative number") unless calories >= 0
        
        @name = name.gsub(/\W/, '').gsub(/\d/, '')
        @calories = calories
    end
    def healthy?
        if @calories < 200
            return true
        else
            return false
        end
    end
    def delicious?
        return true
    end

end

class JellyBean < Dessert
    attr_accessor :flavor

    def initialize(flavor)
        raise ArgumentError.new("Jelly bean flavor cannot be empty") unless flavor.empty? == false
        
        @flavor = flavor.gsub(/\W/, '').gsub(/\d/, '')
        @calories = 5  
        @name = "#{@flavor} jelly bean"
    end
    def delicious?
	   if @flavor == "licorice"
	       return false
	   else
	       super
	   end
    end
end
