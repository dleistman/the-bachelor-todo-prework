require 'pry'

def get_first_name_of_season_winner(data, season)
  data[season].each do |contestant_hash|
      if contestant_hash["status"] == "Winner"
          winner = contestant_hash["name"]
          return winner.split[0]
      end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season, season_contestants|
      season_contestants.each do |contestant_hash|
          if contestant_hash["occupation"] == occupation
              return contestant_hash["name"]
          end
      end
  end
end

def count_contestants_by_hometown(data, hometown)
    hometown_counter = 0
    data.each do |season, season_contestants|
        season_contestants.each do |contestant_hash|
            if contestant_hash["hometown"] == hometown
                hometown_counter += 1
            end
        end
    end
    return hometown_counter
end

def get_occupation(data, hometown)
    data.each do |season, season_contestants|
        season_contestants.each do |contestant_hash|
            if contestant_hash["hometown"] == hometown
                return contestant_hash["occupation"]
            end
        end
    end
end

def get_average_age_for_season(data, season)
    age_counter = 0.0
    age_sum = 0
    data[season].each do |contestant_hash|
        age_sum += contestant_hash["age"].to_f
        age_counter += 1
    end
    average_age = (age_sum / age_counter)
    if (average_age - average_age.to_i) >= 0.5
        average_age = average_age.to_i + 1
    else
        average_age = average_age.to_i
    end
    return average_age
end
