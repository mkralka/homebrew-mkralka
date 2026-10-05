class P13n < Formula
  desc "Manage personal configuration files with reusable bundles"
  homepage "https://github.com/mkralka/p13n"
  url "https://github.com/mkralka/p13n/releases/download/2026.10.04.1626/p13n-2026.10.04.1626.tar.gz"
  sha256 "4b0c879b1b298763beb4950c45402b98808a134abb23e3aaaee78c351f15919a"
  head "https://github.com/mkralka/p13n.git", branch: "main"

  bottle do
    root_url "https://github.com/mkralka/p13n/releases/download/2026.10.04.1626"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "cd916d6c59c521084bb654b5d68c0ba7c6e4e04772a230e057287303cbe889f9"
  end

  def install
    prefix.install "bin", "bundles"
  end

  test do
    assert_match "Install a p13n bundle", shell_output("#{bin}/p13n --help")
    (testpath/"bundle/p13n.conf").write "name=enterprise\nfilesdir=files\n"
    (testpath/"bundle/files/_enterprise").write "Live long and prosper.\n"
    system bin/"p13n", "install", testpath/"bundle"
    assert_predicate testpath/".enterprise", :symlink?
    assert_equal "Live long and prosper.\n", (testpath/".enterprise").read
    assert_path_exists prefix/"bundles/bash/p13n.conf"
  end
end
