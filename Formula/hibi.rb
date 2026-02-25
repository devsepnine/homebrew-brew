class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "0.1.4"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v0.1.4/hibi-ai-0.1.4-macos.tar.gz"
    sha256 "8da12bc998d66af0439bf5119a66efb97ddc2c4f5d164e4696d5c4bd6369475d"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v0.1.4/hibi-ai-0.1.4-linux.tar.gz"
    sha256 "07f0ad848257ba7fcbbe38a3922232db94445693cbf6a396d1b21ce8b1eb635c"
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
