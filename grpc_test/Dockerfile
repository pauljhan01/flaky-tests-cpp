FROM ubuntu:22.04
RUN apt-get install build-essential autoconf libtool pkg-config
RUN apt-get install cmake
RUN apt-get install clang libc++-dev
# This should install Bazel from apt for Ubuntu 22.04
RUN apt install apt-transport-https curl gnupg -y
RUN curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg
RUN mv bazel-archive-keyring.gpg /usr/share/keyrings
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
RUN apt update && apt install bazel
RUN apt update && apt full-upgrade
# Clone, build and run all the testcases
RUN git clone https://github.com/grpc/grpc.git
RUN bazel build: all
RUN bazel test --config=dbg /test/cpp/end2end
