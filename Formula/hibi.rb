class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.17.0"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.17.0/hibi-ai-1.17.0-macos.tar.gz"
    sha256 "66eb94c83ca71e99bb1ddf37a9060a82c2066ff783b8921308fc654e92961bab"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.17.0/hibi-ai-1.17.0-linux.tar.gz"
    sha256 "cda1e419a193eb92be3efba73695df8a061c7db3406beab668e2b6b297ae5e9e"
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
