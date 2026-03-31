class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.9.1"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.9.1/hibi-ai-1.9.1-macos.tar.gz"
    sha256 "d112c73c3ab1c9a9e928b4c5e39e22b09c846795898ee831198469bfb3cff600"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.9.1/hibi-ai-1.9.1-linux.tar.gz"
    sha256 "3443f09b9dcad15d6551d1ab54593d84e6444eadfb46f8aae881e83f1a59e853"
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
