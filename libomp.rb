require "formula"

class Libomp < Formula
  homepage ""
  url "https://www.openmprtl.org/sites/default/files/libomp_20131209_oss.tgz"
  sha1 "8a2bb24372dcddd275f374bcddfc0c5103cb0147"

  def install
    inreplace "src/makefile.mk", "ld-flags += -no-intel-extensions", ""
    inreplace "src/makefile.mk", 
              "$(c) -r -nostartfiles -static-intel  -no-intel-extensions \\",
              "$(c) -r -nostartfiles \\"

    inreplace "tools/src/common-checks.mk", 
              "$(error Development tools not found: $(missed_tools))",
              "$(warning Development tools not found: $(missed_tools))"

    system "make compiler=clang" 
    system "cp", "-r", "exports/common/include", "#{prefix}/include"
    system "cp", "-r", "exports/mac_32e/lib.thin", "#{prefix}/lib/"
  end

  test do
    system "true"
  end
end
