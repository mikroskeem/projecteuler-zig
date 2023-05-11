const std = @import("std");

fn is_prime(num: u64) bool {
    var i: u64 = 2;
    while (i < num) : (i += 1) {
        if (@mod(num, i) == 0) {
            return false;
        }
    }
    return true;
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    var target_nth: u64 = 10001;

    // Start from 2nd prime, 1st prime is `2`
    var current_prime: u64 = 3;
    var current_nth: u64 = 2;

    var n: u64 = 3;
    while (current_nth <= target_nth) : (n += 1) {
        if (@mod(n, 2) != 0) {
            if (is_prime(n)) {
                current_prime = n;
                //try stdout.print("n={} prime={}\n", .{ current_nth, current_prime });

                current_nth += 1;
            }
        }
    }

    try stdout.print("result={}\n", .{current_prime});
}
