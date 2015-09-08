module Generator

  def email_generate(name, domain, pattern)
    split_name = name.downcase.split(' ')
    raise 'name must have a first and last name' unless split_name.size == 2
    "#{pattern.call(split_name)}@#{domain}"
  end

end