# spdlog
This is [spdlog](https://github.com/gabime/spdlog), packaged for [Zig](https://ziglang.org/). (Intended for C++ projects using Zig as a build tool.)

## Usage
First, update your `build.zig.zon`:
```sh
zig fetch --save git+https://github.com/jessechounard/spdlog
```

Next, in your `build.zig`, you can access the library as a dependency:
```zig
const spdlog_dep = b.dependency("spdlog", .{
    .target = target,
    .optimize = optimize,
});
const spdlog_lib = spdlog_dep.artifact("spdlog");

exe.root_module.linkLibrary(spdlog_lib);
```

Finally, in your C++ file, you can use the library:
```cpp
#include <spdlog/spdlog.h>

int main() {
  spdlog::info("Hello, world (from spdlog)!");
  return 0;
}
```
