module 0x10::debug {
  native public fun print<T>(x: &T);
}

module 0x100::Test {
  use 0x10::debug;

  fun main() {
    debug::print(&10);
  }
}
