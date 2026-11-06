class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.23.2"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.23.2/hibi-ai-1.23.2-macos.tar.gz"
    sha256 "d5900440c283676132ee2eb84da460b2e4f3edb398a0eb357123a061c375870c"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.23.2/hibi-ai-1.23.2-linux.tar.gz"
    sha256 "a851279c3154b011a81169a3a9027658242374d09cf18ebb4cf1d299bd1d74bd"
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
