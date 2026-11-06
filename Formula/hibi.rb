class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.23.3"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.23.3/hibi-ai-1.23.3-macos.tar.gz"
    sha256 "0e1b4d27d15c06125b1d441f717a2f382f28ddb940f8035c17cc264c1b882c7c"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.23.3/hibi-ai-1.23.3-linux.tar.gz"
    sha256 "6d570d95fd08e8ea705d6c5e1c01c66df65e995106fc858b8f3bb92e74231277"
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
