require 'w3c_validators'
class Stylesheet < ActiveRecord::Base

  include W3CValidators

  FAMILY_LIST =[ 'Sans-Serif', 'Arial, sans-serif', 'Helvetica, sans-serif',
                 'Gill Sans, sans-serif', 'Lucida, sans-serif', 'Helvetica Narrow, sans-serif',
                 'sans-serif', 'Times, serif', 'Times New Roman, serif',
                 'Palatino, serif', 'Bookman, serif', 'New Century Schoolbook, serif',
                 'serif', 'Courier New, monospace', 'Courier, monospace', 'Lucidatypewriter, monospace',
                 'Fixed, monospace', 'monospace']

  DEFAULT_FAMILY = "Sans-Serif"
  DEFAULT_SIZE = 12
  DEFAULT_COLOR = '#3c3c3c'

  validate :check_custom_css, :if => Proc.new{|f| f.custom.present? } 

  def initialize(args=nil)
    super
    self.family = DEFAULT_FAMILY
    self.size = DEFAULT_SIZE
    self.color = DEFAULT_COLOR
  end

  private 
  def check_custom_css
    validator = CSSValidator.new
    results = validator.validate_text(self.custom)
    errors.add(:custom, "Invalid custom css text.") if results.errors.length > 0
  end

end
