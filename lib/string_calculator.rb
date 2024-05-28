class StringCalculator
  def self.add(input)
    # If input is empty, return 0
    return 0 if input.empty?

    # Check for custom delimiter
    delimiter = ','
    if input.start_with?("//")
      delimiter = input[2]
      input = input[(input.index("\n") + 1)..-1]
    end

    # Split input string by delimiter and new lines
    numbers = input.split(/#{delimiter}|\n/)

    # Convert numbers to integers and sum them
    sum = 0
    negative_numbers = []
    numbers.each do |num|
      num = num.to_i
      if num < 0
        negative_numbers << num
      else
        sum += num
      end
    end

    # If there are negative numbers, raise an exception
    if negative_numbers.any?
      raise "negative numbers not allowed: #{negative_numbers.join(',')}"
    end

    return sum
  end
end
