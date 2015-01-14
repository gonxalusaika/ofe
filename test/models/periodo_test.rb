require 'test_helper'

class PeriodoTest < ActiveSupport::TestCase
  test "normal" do
  	p = Periodo.new(nombre: "Un período")
    assert p.valid?, "Periodo normal"
  end
end
