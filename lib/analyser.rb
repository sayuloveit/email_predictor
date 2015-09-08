class Analyser

  attr_accessor :email_patterns, :split_name, :email_domain, :patterns

  def initialize(email_patterns)
    @email_patterns = email_patterns
  end

  def analyze(name, email)
    @split_name = name.downcase.split(' ')
    email_name, @email_domain = email.split('@')
    @patterns = decide_pattern(split_name, email_name)
  end

  private
  def decide_pattern(split_name, email_name)
    email_patterns.values.select{ |pattern| pattern.call(split_name) == email_name }
  end

end