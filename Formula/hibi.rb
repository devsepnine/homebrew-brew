class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.23.4"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.23.4/hibi-ai-1.23.4-macos.tar.gz"
    sha256 "843d38597b7ed1d5fa8c302df0ce307e9a72bf3dae3cb7a7d2916ec5a4bf608b"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.23.4/hibi-ai-1.23.4-linux.tar.gz"
    sha256 "cf5d781cb73b53830247d58b3bb6de5b37e889a30b80b8c4ae3c492564aff0de"
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
