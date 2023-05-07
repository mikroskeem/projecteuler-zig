const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    var max: u64 = 4e6;
    var sum: u64 = 0;

    var previous: u64 = 0;
    var current: u64 = 1;
    while (current < max) {
        var next = previous + current;
        previous = current;
        current = next;

        if (@mod(current, 2) != 0) {
            continue;
        }

        sum += current;
    }

    try stdout.print("sum={}\n", .{sum});
}
