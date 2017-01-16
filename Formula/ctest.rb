class Ctest < Formula
  desc "A portable unit-testing framework for C"
  homepage "https://github.com/mkralka/ctest"
  url "https://github.com/mkralka/ctest/files/709333/ctest-0.0.1.tar.gz"
  sha256 "702b1fd7aa28c3621d55fb8bef530a49ba00ac9ae4890bfdc5df55ef5ffc15b1"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test ctest`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/ctester", "run", "#{lib}/ctest/examples/simple_suite.so", 
            "#{lib}/ctest/examples/suite_with_data.so",
            "#{lib}/ctest/examples/suite_with_fixtures.so"
  end
end
