module 0x42::m {

#[test]
#[expected_failure(out_of_gas, location=Self)]
fun t0() {}

#[test]
#[expected_failure(out_of_gas, location=Self)]
#[gas_budget(compute_unit_limit=10000000, heap_size=40000, max_call_depth=10)]
fun t1() {
    loop {}
}

#[test]
#[expected_failure(arithmetic_error, location=Self)]
fun t2() {
    0 - 1;
}

}
