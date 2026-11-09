class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.24.0"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.24.0/hibi-ai-1.24.0-macos.tar.gz"
    sha256 "aac7f1957cb8c3b996c4a8af2659c90702f6c3c4157423c7e2fa6d6340549146"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.24.0/hibi-ai-1.24.0-linux.tar.gz"
    sha256 "4be7f59f34976e37de1d14318449763b680545169823611dcbe532dcbb1bc441"
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
