	def lowercases(romanNumber)
		capital = ["I", "V", "X", "L", "C", "D", "M"]
		romanNumber.each_char { |c|
			if ! (capital.include? c)
				return false
			end
		}
		return true
	end

	def fromRoman(romanNumber)
		number = [1,4,5,9,10,40,50,90,100,400,500,900,1000]
		roma   = ["I","IV","V","IX","X","XL","L","XC","C","CD","D","CM","M"]
		hash   = roma.zip(number).inject({}) {|r,ele| r[ele.first] = ele.last; r}
	 if ! (lowercases(romanNumber))
        raise TypeError
     end
		reg    = /M|CM|D|CD|C|XC|L|XL|X|IX|V|IV|I/
	temp = romanNumber.scan(reg)
	temp.uniq.inject(0) do |r,ele|
		r += temp.count(ele)*hash[ele]
	end
	end


  def toRoman(arabicNumber)
	number = [1,4,5,9,10,40,50,90,100,400,500,900,1000]
	roma   = ["I","IV","V","IX","X","XL","L","XC","C","CD","D","CM","M"]
	hash = number.zip(roma).inject({}) {|r,ele| r[ele.first] = ele.last;r}
	if (arabicNumber > 3999) or (arabicNumber < 1)
		raise RangeError
		end
	temp = 3.step(0,-1).inject([]) do |r,ele|
            r << arabicNumber/(10**ele)
            arabicNumber %= 10**ele
            r
          end
	temp.reverse!
	result = ""
	3.step(0,-1).each do |i|
    if i == 3
      result << "M"*temp[i]
		next
	end
		if number.include?(temp[i]*(10**i))
		result << hash[temp[i]*(10**i)]
		else
		temp[i].to_i < 5 ? result << hash[10**i]*temp[i] : result << (hash[5*(10**i)]+hash[10**i]*(temp[i]-5))
		end
	end
	result
  end