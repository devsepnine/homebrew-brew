class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.16.0"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.16.0/hibi-ai-1.16.0-macos.tar.gz"
    sha256 "ca4ab0bda0a29d1c9d11870ad76ad45393478e59103a8a80fa28897d1ac8afd9"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.16.0/hibi-ai-1.16.0-linux.tar.gz"
    sha256 "7f01f8ec19f9dd7892e28c7833a82f40063b562509aa48e76c31b607c8fea9c3"
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
