class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.15.0"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.15.0/hibi-ai-1.15.0-macos.tar.gz"
    sha256 "3dbc2b07a44d0ace5d5fa6b3007760cae43a8f4943d65620114f855a2989fcf0"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.15.0/hibi-ai-1.15.0-linux.tar.gz"
    sha256 "9df14aabeb62a34fcf0d2b8c6caf9e9c7b80e60b7c7aa87a4c2555fd0ecd37ea"
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
