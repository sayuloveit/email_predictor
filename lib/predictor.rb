require_relative 'generator'

class Predictor
  include Generator

  attr_reader :evaluator

  def initialize(evaluator)
    @evaluator = evaluator
  end

  def predict(name, domain)
    #guard clause
    #confident ruby book
    return 'no prediction was possible for this domain' unless have_patterns?
    # null object pattern - no nil return values
    # aloha ruby conf 2012 - ben orenstein, refactoring
    evaluator.match_patterns(domain).map { |pattern| email_generate(name, domain, pattern)}
  end

  def have_patterns?
    !evaluator.match_patterns(domain).empty?
  end

end