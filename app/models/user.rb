class User < ApplicationRecord
  validate :check_validation

  def check_validation
    changed_char = 0
    if password.length < 10
      changed_char += 10 - password.length
    end

    if password.length > 16
      changed_char += password.length - 16
    end

    if !password.upcase
      changed_char += 1
    end

    if !password.downcase
      changed_char += 1
    end

    consective = password.scan(/(\w)(\1*)/).map(&:join).map(&:length)
    consective.each do |chr|
      if chr >= 3
        changed_char += 1
      end
    end

    if changed_char > 0
      errors.add(:base, "Change #{changed_char} character of #{name}'s password")
      throw(:abort)
    else
      true
    end
  end
end
