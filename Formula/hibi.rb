class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.22.0"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.22.0/hibi-ai-1.22.0-macos.tar.gz"
    sha256 "abf3c569523e5a8b3fe5c2f0d7b6f17a731aff053bfda142c1870849db44166a"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.22.0/hibi-ai-1.22.0-linux.tar.gz"
    sha256 "1037d2d10bfd8b98619627e34d9d8cd51f7f4f88267d9b0203e8c703241ffc01"
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
