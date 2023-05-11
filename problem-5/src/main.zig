const std = @import("std");

fn is_divisible(num: u64) bool {
    // Start from 2 - all natural numbers are divisible by 1
    var div: u64 = 2;

    while (div <= 20) {
        if (@mod(num, div) != 0) {
            return false;
        }

        div += 1;
    }

    return true;
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    var r: u64 = 1;
    while (!is_divisible(r)) {
        r += 1;
    }

    try stdout.print("result={}\n", .{r});
}
