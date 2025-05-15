class Libyang < Formula
    desc "YANG data modelling language parser and toolkit written (and providing API) in C."
    homepage "https://github.com/CESNET/libyang"
    url "https://github.com/CESNET/libyang/archive/refs/tags/v3.7.8.tar.gz"
    sha256 "0b75f2afb60c6b94f0f881cd2112663482b81e9800328f95c6ec862b000e59e9"
    license "BSD-3-Clause license"

    depends_on "cmake" => :build

    def install
        with_env(
            "CMAKE_BUILD_TYPE" => "RELEASE"
        ) do
            ENV.deparallelize
            system "cmake", "-S", ".", "-B", "build", *std_cmake_args
            system "cmake", "--build", "build"
            system "cmake", "--install", "build"
        end
    end
end
