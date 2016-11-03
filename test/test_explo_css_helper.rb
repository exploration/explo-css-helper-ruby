require 'minitest/autorun'
require 'explo_css_helper'

class ExploCssHelperTest < Minitest::Test
  include ExploCssHelper

  def test_xc_exists
    assert_equal(
      'measure lh-copy f5 fw5',
      xc('p')
    )
  end

  def test_xs_exists
    assert_equal(
      'appearance: none; background:transparent; background: url(http://cdn.lab.explo.org/images/input_select_arrow.svg) 96% / 15% no-repeat #FFF;',
      xs('select')
    )
  end

  def test_xc_replaces_values
    assert_equal(
      'measure lh-copy f5 CHEESE',
      xc('p', replace: {'fw5' => 'CHEESE'})
    )
  end

  def test_xc_adds_values
    assert_equal(
      'measure lh-copy f5 fw5 NACHOS',
      xc('p', add: ['NACHOS'])
    )
  end

  def test_xc_can_add_and_replace_simultaneously
    assert_equal(
      'measure lh-copy f5 CHEESE NACHOS',
      xc('p', replace: {'fw5' => 'CHEESE'}, add: ['NACHOS'])
    )
  end

  def test_xs_replaces_values
    assert_equal(
      'appearance: none; background:transparent; background: url(http://cdn.lab.explo.org/images/input_select_arrow.svg) 96% / 15% no-repeat #CCC;',
      xs('select', replace: {'FFF' => 'CCC'})
    )
  end

  def test_xs_adds_values
    assert_equal(
      'appearance: none; background:transparent; background: url(http://cdn.lab.explo.org/images/input_select_arrow.svg) 96% / 15% no-repeat #FFF; display: none;',
      xs('select', add: ['display: none;'])
    )
  end

  def test_xs_can_add_and_replace_simultaneously
    assert_equal(
      'appearance: none; background:transparent; background: url(http://cdn.lab.explo.org/images/input_select_arrow.svg) 96% / 15% no-repeat #CCC; display: none;',
      xs('select', replace: {'FFF' => 'CCC'}, add: ['display: none;'])
    )
  end
end
