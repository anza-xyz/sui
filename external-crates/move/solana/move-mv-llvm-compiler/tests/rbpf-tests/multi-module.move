module 0x100::Test1 {
  use 0x101::Test2;

  public fun test1(a: u8, b: u8): u8 {
    Test2::test2(a, b)
  }
}

module 0x101::Test2 {
  public fun test2(a: u8, b: u8): u8 {
    let c = a + b;
    c
  }
}

module 0x10::Test {
  public fun test_main() {
    let a: u8 = 3;
    let b: u8 = 2;
    let c = 0x100::Test1::test1(a, b);
    assert!(c == 5, 10);
  }
}
