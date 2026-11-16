class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.25.0"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.25.0/hibi-ai-1.25.0-macos.tar.gz"
    sha256 "ed824d9e100f5c7f8b5ebbe207eeda8da625c6ca7fe9f8bcb85ff66a6bdaa018"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.25.0/hibi-ai-1.25.0-linux.tar.gz"
    sha256 "2b3045159d0034da81de519a8634e5740e25274e9af1bb0908866c0be165f802"
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
