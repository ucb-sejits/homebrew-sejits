require 'formula'

class Llvm < Formula
  homepage 'http://clang-omp.github.io/'
  head 'https://github.com/clang-omp/llvm.git'

  def install

    ENV['REQUIRES_RTTI'] = '1'

    args = [
      "--prefix=#{prefix}",
      "--enable-optimized",
    ]

    system "git clone https://github.com/clang-omp/compiler-rt projects/compiler-rt"
    system "git clone -b clang-omp https://github.com/clang-omp/clang tools/clang"

    system "./configure", *args
    system 'make'
    system 'make', 'install'

  end

end
