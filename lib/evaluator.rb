class Evaluator

  attr_reader :examples, :analyser, :patterns

  def initialize(examples, analyser)
    @examples = examples
    @analyser = analyser
    @patterns = {}
    match_patterns
  end

  private
  def match_patterns
    examples.each do |name, email|
      analyser.analyze(name, email)
      patterns[analyser.email_domain] ||= analyser.patterns
      patterns[analyser.email_domain].concat(analyser.patterns) unless repeat_pattern?(patterns[analyser.email_domain], analyser.patterns)
    end
  end

  def repeat_pattern?(matched_patterns, analyser_patterns)
    return false if matched_patterns.length == 0
    (matched_patterns - analyser_patterns).length == 0
  end

end