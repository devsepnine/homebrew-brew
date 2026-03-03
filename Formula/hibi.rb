class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "0.1.6"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v0.1.6/hibi-ai-0.1.6-macos.tar.gz"
    sha256 "0709229938fdb83177fd386d184af71a83463c45a1e9f05e9e6246ea04884b2f"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v0.1.6/hibi-ai-0.1.6-linux.tar.gz"
    sha256 "1b46025964fe4136e2505a5a8ab9982bb299975ac4de55cd5a15a8c8b89117f9"
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
