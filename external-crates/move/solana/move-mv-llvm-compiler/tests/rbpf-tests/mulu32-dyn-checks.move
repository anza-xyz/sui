// abort 4017

module 0x101::Test1 {
  public fun test_mulu32(a: u32, b: u32): u32 {
    let c = a * b;
    c
  }
}

module 0x10::Test {
  public fun test_main() {
    let a: u32 = 2147483647;
    assert!(0x101::Test1::test_mulu32(a, 2) == 4294967294, 10);  // Ok: no overflow.

    0x101::Test1::test_mulu32(a, 3);  // Abort: overflow.
  }
}
