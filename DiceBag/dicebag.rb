# I often play games that require dice, anywhere between 4-sided up to 100-sided

module DiceBag
    class InvalidDieError < NoMethodError    
    end

    def what_kind_of_die(sides)
        case sides
        when 4
            return DFour.new
        when 6
            return DSix.new
        when 8
            return DEight.new
        when 10
            return DTen.new
        when 12
            return DTwelve.new
        when 20
            return DTwenty.new
        when 100
            return DHundred.new
        else
            raise InvalidDieError
        end
    end

    class Die
        def sides
            raise NoMethodError
        end

        def roll
            rand(1...sides)
        end

        def sum_dice(dice_array)
            total = 0
            dice_array.each{|num|
                total += num
            }
            return total
        end

        def reroll_and_keep(roll)
            # i'll eventually write this
            # a method to reroll a die and keep the original
        end

        def reroll_and_toss(roll)
            # i'll eventually write this
            # a method to reroll a die and toss the original
        end
    end

    class DFour < Die
        def sides
            4
        end
    end

    class DSix < Die
        def sides
            6
        end
    end

    class DEight < Die
        def sides
            8
        end
    end

    class DTen < Die
        def sides
            10
        end
    end

    class DTwelve < Die
        def sides
            12
        end
    end

    class DTwenty < Die
        def sides
            20
        end
    end

    class DHundred < Die
        def sides
            100
        end
    end
end