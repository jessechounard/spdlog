const std = @import("std");

pub fn build(b: *std.Build) void {
    const upstream = b.dependency("spdlog", .{});
    const lib = b.addLibrary(.{
        .name = "spdlog",
        .linkage = .static,
        .root_module = b.createModule(.{
            .target = b.standardTargetOptions(.{}),
            .optimize = b.standardOptimizeOption(.{}),
            .link_libcpp = true,
        }),
    });
    lib.addIncludePath(upstream.path("include"));
    lib.addCSourceFiles(.{
        .root = upstream.path("src"),
        .files = &.{
            "async.cpp",
            "bundled_fmtlib_format.cpp",
            "cfg.cpp",
            "color_sinks.cpp",
            "file_sinks.cpp",
            "spdlog.cpp",
            "stdout_sinks.cpp",
        },
        .flags = &.{
            "-DSPDLOG_COMPILED_LIB",
        },
    });
    lib.installHeadersDirectory(upstream.path("include/spdlog"), "spdlog", .{});
    b.installArtifact(lib);
}
