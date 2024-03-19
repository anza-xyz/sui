//
module 0x101::Test1 {
  public fun test_neq_u256(a: u256, b: u256): bool {
    a != b
  }
}

module 0x10::Test {
  public fun test_main() {
    assert!(0x101::Test1::test_neq_u256(21267647932558653966460912964485513215u256, 21267647932558653966460912964485513214u256), 10);
    assert!(!0x101::Test1::test_neq_u256(21267647932558653966460912964485513215u256, 21267647932558653966460912964485513215u256), 10);
  }
}
