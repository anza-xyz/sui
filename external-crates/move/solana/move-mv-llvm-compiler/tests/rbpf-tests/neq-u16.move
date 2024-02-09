//
module 0x101::Test1 {
  public fun test_neq_u16(a: u16, b: u16): bool {
    a != b
  }
}

module 0x10::Test {
  public fun test_main() {
    assert!(0x101::Test1::test_neq_u16(65535u16, 65534u16), 10);
    assert!(!0x101::Test1::test_neq_u16(65535u16, 65535u16), 10);
  }
}
