require_relative 'generator'

class Predictor
  include Generator

  attr_reader :evaluator

  def initialize(evaluator)
    @evaluator = evaluator
  end

  def predict(name, domain)
    return 'no prediction was possible for this domain' unless evaluator.patterns[domain]
    evaluator.patterns[domain].map { |pattern| email_generate(name, domain, pattern)}
  end

end