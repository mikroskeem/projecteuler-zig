const std = @import("std");

fn is_palindrome(num: u64) !bool {
    const alloc = std.heap.page_allocator;

    var buf = try std.fmt.allocPrint(alloc, "{d}", .{num});
    defer alloc.free(buf);

    if (@mod(buf.len, 2) != 0) {
        return false;
    }

    const half = buf.len / 2;
    var a = buf[0..half];
    var b = buf[half..buf.len];

    // Reverse b
    var b_idx = b.len - 1;
    while (b_idx > 0) {
        var src_idx = b.len - 1 - b_idx;
        var tmp_a = b[src_idx];

        b[src_idx] = b[b_idx];
        b[b_idx] = tmp_a;

        b_idx -= 1;
    }

    return std.mem.eql(u8, a, b);
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    // Ok, so:
    // - Number must be in range [100^2, 999^2] and result must be 6 digits.
    // - d or e must be divisible by 11 - but not simultaneously. Right now won't apply e % 11 check, doesn't make big difference
    // - Make sure that d is always divisible by 11 by decrementing it by 11 on
    //   each outer loop iteration, and decrementing e only by 1

    var r: u64 = 0;

    var d: u64 = 990;
    while (d >= 100) {
        var e: u64 = 999;

        inner: {
            while (e >= 100) {
                var v: u64 = d * e;
                if (r < v and try is_palindrome(v)) {
                    // we found next largest palindrome, cool
                    r = v;
                    try stdout.print("new r => (d={}, e={}) {}\n", .{ d, e, v });
                    break :inner;
                } else if (v < r) {
                    break :inner;
                }

                e -= 1;
            }
        }

        d -= 11;
    }

    try stdout.print("result={}\n", .{r});
}
