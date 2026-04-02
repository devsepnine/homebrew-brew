class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.9.3"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.9.3/hibi-ai-1.9.3-macos.tar.gz"
    sha256 "1da8022914bcb3fd3aba278233f15551ad2137c5beb0a35e8fdb70c5334e6cd9"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.9.3/hibi-ai-1.9.3-linux.tar.gz"
    sha256 "15dbbeecf3e002e46f13b9465e583d93252e9de282413370c618651b081b7dc8"
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
