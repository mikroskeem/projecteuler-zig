const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    var sum: u64 = 0;

    var n: u64 = 0;
    while (n < 1000) : (n += 1) {
        if (@mod(n, 3) == 0 or @mod(n, 5) == 0) {
            sum += n;
        }
    }

    try stdout.print("sum={}\n", .{sum});
}
