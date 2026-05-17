class Memory < Formula
  desc "Local-first project memory for AI coding agents"
  homepage "https://memory.aictx.dev"
  url "https://registry.npmjs.org/@aictx/memory/-/memory-0.1.47.tgz"
  sha256 "8024fa01163657a641a4a48cddb03e059c14137c97b576a2488267541dad20eb"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args

    node_path = Formula["node"].opt_bin
    (bin/"memory").write_env_script libexec/"bin/memory", PATH: "#{node_path}:$PATH"
    (bin/"memory-mcp").write_env_script libexec/"bin/memory-mcp", PATH: "#{node_path}:$PATH"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/memory --version")
    assert_match "Memory docs:", shell_output("#{bin}/memory docs")
  end
end
