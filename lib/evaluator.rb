require 'pry'

class Evaluator

  attr_reader :examples, :analyser

  def initialize(examples, analyser)
    @examples = examples
    @analyser = analyser
  end

  def match_patterns(domain)
    patterns = {}
    filtered_examples = examples.select { |_, v| v.split('@').last == domain }
    filtered_examples.each do |name, email|
      analyser.analyze(name, email)
      patterns[analyser.email_domain] ||= analyser.patterns
      patterns[analyser.email_domain].concat(analyser.patterns).uniq!
    end

    patterns[domain]
  end

end