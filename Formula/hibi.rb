class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.9.4"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.9.4/hibi-ai-1.9.4-macos.tar.gz"
    sha256 "249113a993528c831bf30e2cec88740258fa52801a08cde48bf24073f30f1b43"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.9.4/hibi-ai-1.9.4-linux.tar.gz"
    sha256 "927580b1a96893e8d1d57b71c829e21b2e8359c9b463f9ea5f804b55d914a629"
  end

  def install
    # Install binary
    bin.install "hibi"

    # Install configuration files to share directory
    share_dir = share/"hibi"
    share_dir.install "agents"
    share_dir.install "commands"
    share_dir.install "contexts"
    share_dir.install "hooks"
    share_dir.install "mcps"
    share_dir.install "output-styles"
    share_dir.install "plugins"
    share_dir.install "rules"
    share_dir.install "skills"
    share_dir.install "statusline"
    share_dir.install "settings.json"
    share_dir.install "CLAUDE.md" if File.exist?("CLAUDE.md")
    share_dir.install "AGENTS.md" if File.exist?("AGENTS.md")
    share_dir.install "mcp.md" if File.exist?("mcp.md")
  end

  test do
    # Test that binary runs
    assert_match "hibi", shell_output("#{bin}/hibi --help")
  end
end
