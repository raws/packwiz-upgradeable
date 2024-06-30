require 'test_helper'

module PackwizUpgradeable
  class MinecraftVersionTest < Minitest::Test
    def test_equality
      # Same major, minor and patch version
      assert_equal MinecraftVersion.new(1, 21, 1), MinecraftVersion.new(1, 21, 1)

      # Same major and minor, and implied patch version
      assert_equal MinecraftVersion.new(1, 21, 0), MinecraftVersion.new(1, 21)

      # Different patch version
      refute_equal MinecraftVersion.new(1, 21, 0), MinecraftVersion.new(1, 21, 1)

      # Different minor version
      refute_equal MinecraftVersion.new(1, 20, 0), MinecraftVersion.new(1, 21, 0)

      # Different major version
      refute_equal MinecraftVersion.new(1, 0, 0), MinecraftVersion.new(2, 0, 0)
    end

    def test_parse
      assert_equal MinecraftVersion.new(1, 21), MinecraftVersion.parse('1.21')
      assert_equal MinecraftVersion.new(1, 21, 0), MinecraftVersion.parse('1.21')
      assert_equal MinecraftVersion.new(1, 21), MinecraftVersion.parse('1.21.0')
      assert_equal MinecraftVersion.new(1, 21, 1), MinecraftVersion.parse('1.21.1')

      assert_nil MinecraftVersion.parse('24w21a')
      assert_nil MinecraftVersion.parse('1.21-pre1')
      assert_nil MinecraftVersion.parse('1.21-rc1')
    end

    def test_to_s
      assert_equal '1.21.1', MinecraftVersion.new(1, 21, 1).to_s
      assert_equal '1.21', MinecraftVersion.new(1, 21, 0).to_s
      assert_equal '1.21', MinecraftVersion.new(1, 21).to_s
    end
  end
end
