class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.14.1"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.14.1/hibi-ai-1.14.1-macos.tar.gz"
    sha256 "03ca34e201e3b5650c3d017de0dca754f6f29b987e9a9611f1a3e1fe7e220371"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.14.1/hibi-ai-1.14.1-linux.tar.gz"
    sha256 "29fbc5e7b0996fbe2b81c1401d64ca4d02168e18e3d9739da2088db2898ca08b"
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
