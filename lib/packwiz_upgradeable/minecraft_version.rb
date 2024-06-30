module PackwizUpgradeable
  # Mojang and the Minecraft community don't quite use true semantic versioning. This class does its
  # best to understand Minecraft version strings. It focuses on release versions, and does not
  # support snapshots ("24w21a"), prereleases ("1.21-pre1"), or release candidates ("1.21-rc1").
  #
  # Minecraft releases always include a major and a minor version (e.g. "1.21"), but not always a
  # patch version (e.g. the community uses "1.21" to mean "1.21.0"). Subsequent patch releases do,
  # however, include a patch version (e.g. "1.21.1"). Therefore, while this class internally
  # represents 1.21.0 with a major, minor, and patch version, methods like #to_s output "1.21" to
  # match what the Minecraft community expects.
  #
  # For an exhaustive list of Minecraft Java Edition versions, see:
  # https://minecraft.wiki/w/Template:Navbox_Java_Edition_versions
  class MinecraftVersion
    PATTERN = /\A(?<major>\d+)\.(?<minor>\d+)(?:\.(?<patch>\d+))?\z/

    attr_reader :major, :minor, :patch

    def self.parse(version_string)
      version_string.match(PATTERN) do |match|
        new(match[:major].to_i, match[:minor].to_i, match[:patch].to_i)
      end
    end

    def initialize(major, minor, patch = 0)
      @major = major
      @minor = minor
      @patch = patch
    end

    def ==(other)
      major == other.major &&
        minor == other.minor &&
        patch == other.patch
    end

    def to_s
      "#{major}.#{minor}".tap do |string|
        string << ".#{patch}" unless patch.zero?
      end
    end
  end
end
