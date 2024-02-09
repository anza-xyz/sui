// abort 4017

module 0x101::Test1 {
  public fun test_shl(a: u8, b: u8): u8 {
    let c = a << b;
    c
  }
  public fun test_shr(a: u8, b: u8): u8 {
    let c = a >> b;
    c
  }
}

module 0x10::Test {
  public fun test_main() {
    let a: u8 = 1;
    let b: u8 = 4;
    assert!(0x101::Test1::test_shl(a, b) == 16, 10);  // Ok: count in range.

    0x101::Test1::test_shr(a, 9);  // Abort: count out of range.
  }
}
