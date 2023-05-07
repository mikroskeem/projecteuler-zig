const std = @import("std");
const printf = std.io.printf;

fn range(len: usize) []const void {
    return @as([*]void, undefined)[0..len];
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    var sum: u64 = 0;

    //for (0..1000) |n| {
    for (range(1000)) |_, n| {
        if (@mod(n, 3) == 0 or @mod(n, 5) == 0) {
            sum += n;
        }
    }

    try stdout.print("sum={}\n", .{sum});
}
