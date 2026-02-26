class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "0.1.5"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v0.1.5/hibi-ai-0.1.5-macos.tar.gz"
    sha256 "8a5aaa6c0851b437fa5866d3f801bc788f6e8f11ca4609246ec49978baa1a70b"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v0.1.5/hibi-ai-0.1.5-linux.tar.gz"
    sha256 "6c7ee274276f544acb58344b5c30c22df1dab3d171c3fbc30ed82a7d4e58454c"
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
