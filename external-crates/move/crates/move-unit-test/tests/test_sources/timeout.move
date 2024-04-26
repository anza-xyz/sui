address 0x1 {
module M {
    #[test]
    #[gas_budget(compute_unit_limit=10000000, heap_size=40000, max_call_depth=10)]
    fun timeout_fail() {
        while (true) {}
    }

    #[test]
    #[expected_failure]
    #[gas_budget(compute_unit_limit=10000000, heap_size=40000, max_call_depth=10)]
    fun timeout_fail_with_expected_failure() {
        while (true) {}
    }

    #[test]
    fun no_timeout() { }

    #[test]
    fun no_timeout_fail() { abort 0 }

    #[test]
    fun no_timeout_while_loop() {
        let i = 0;
        while (i < 10) {
            i = i + 1;
        };
    }
}
}
