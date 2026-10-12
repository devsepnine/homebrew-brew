class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.23.0"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.23.0/hibi-ai-1.23.0-macos.tar.gz"
    sha256 "fb27af49fd56b012d48c4cf0f1f1a37f144c3a5ed8a141c0651e29c156fcb466"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.23.0/hibi-ai-1.23.0-linux.tar.gz"
    sha256 "2aac219cb9d79b105270c73422d6dea0e182ee65cbf62a291ca3b6450819f9c0"
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
