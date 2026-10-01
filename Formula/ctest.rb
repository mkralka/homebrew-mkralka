class Ctest < Formula
  desc "Portable unit-testing framework for C"
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
    system "#{bin}/ctester", "run", "#{lib}/ctest/examples/simple_suite.so",
            "#{lib}/ctest/examples/suite_with_data.so",
            "#{lib}/ctest/examples/suite_with_fixtures.so"
  end
end
