class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.21.0"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.21.0/hibi-ai-1.21.0-macos.tar.gz"
    sha256 "f969dd5f2f562813168630fdbc1a0ba0211a3c6c76e98d98afeddd630e73a73a"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.21.0/hibi-ai-1.21.0-linux.tar.gz"
    sha256 "3a2f912d502943c1f188c24f9fb126392fa15d4041e38ac7711b43c8d25438ec"
  end

  def install
    bin.install "hibi"

    share_dir = share/"hibi"
    %w[agents commands contexts hooks mcps output-styles plugins rules skills statusline].each do |d|
      share_dir.install d if File.exist?(d)
    end
    share_dir.install "settings.json" if File.exist?("settings.json")
    share_dir.install "CLAUDE.md" if File.exist?("CLAUDE.md")
    share_dir.install "AGENTS.md" if File.exist?("AGENTS.md")
    share_dir.install "mcp.md" if File.exist?("mcp.md")
  end

  test do
    # Test that binary runs
    assert_match "hibi", shell_output("#{bin}/hibi --help")
  end
end
