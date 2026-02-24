class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "0.1.0"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v0.1.0/hibi-ai-0.1.0-macos.tar.gz"
    sha256 "af4619847e6fa4db5491bb0c18d9b730a282dc9e97d530f7a057dd2c658a0006"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v0.1.0/hibi-ai-0.1.0-linux.tar.gz"
    sha256 "5779448e8eaddd278f088077202e673aaf110936fb6bb073c868d5f7bcbb6947"
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
    assert_match "hibi", shell_output("#{bin}/hibi --help 2>&1", 1)
  end
end
