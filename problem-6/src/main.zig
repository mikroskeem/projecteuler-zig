const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    var squares_sum: u64 = 0;
    var normal_sum: u64 = 0;

    var i: u64 = 1;
    while (i <= 100) {
        squares_sum += i * i;
        normal_sum += i;
        i += 1;
    }

    normal_sum *= normal_sum;

    // 5050^2 is going to be larger for sure
    var diff = normal_sum - squares_sum;

    try stdout.print("squares={}, normal={}\n", .{ squares_sum, normal_sum });
    try stdout.print("result={}\n", .{diff});
}
