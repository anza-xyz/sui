// input ../input.json
// use-stdlib
// log 0000000000000000000000000000000000000000000000000000000000000001::string::String { bytes: [72, 101, 108, 108, 111, 32, 83, 111, 108, 97, 110, 97], }

module 0x10::debug {
  native public fun print<T>(x: &T);
}

module hello::hello {
    use 0x10::debug;
    use 0x1::string;

    public entry fun main() : u64 {
        let rv = 0;
        let s = string::utf8(b"Hello Solana");
        debug::print(&s);
        rv
    }
}
