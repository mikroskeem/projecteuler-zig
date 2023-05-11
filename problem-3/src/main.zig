const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    var num: u64 = 600851475143;
    var res: u64 = num;

    var i: u64 = 2;
    while ((i * i) < res) : (i += 1) {
        while (@mod(res, i) == 0) {
            res /= i;
        }
    }

    try stdout.print("res={}\n", .{res});
}
