class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.13.0"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.13.0/hibi-ai-1.13.0-macos.tar.gz"
    sha256 "a9ae76702e3649edcab35adb6e12dbdfc7ca1a333105589528161d2bc57254a0"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.13.0/hibi-ai-1.13.0-linux.tar.gz"
    sha256 "93cdd7c06efee8488d545c989e0fd5b764d24730ebe43c657cba2e92b70ba7e2"
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
