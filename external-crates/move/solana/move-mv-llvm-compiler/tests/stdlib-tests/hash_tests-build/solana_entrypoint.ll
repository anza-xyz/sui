; ModuleID = 'solana_entrypoint'
source_filename = "solana_entrypoint"

@str_literal = private unnamed_addr constant [27 x i8] c"unit_test__unit_test_poison", align 1
@str_slice = private unnamed_addr constant { ptr, i64 } { ptr @str_literal, i64 27 }, align 8
@str_literal.1 = private unnamed_addr constant [22 x i8] c"hash__unit_test_poison", align 1
@str_slice.2 = private unnamed_addr constant { ptr, i64 } { ptr @str_literal.1, i64 22 }, align 8
@str_literal.3 = private unnamed_addr constant [28 x i8] c"hash_tests__unit_test_poison", align 1
@str_slice.4 = private unnamed_addr constant { ptr, i64 } { ptr @str_literal.3, i64 28 }, align 8

define i64 @main(ptr %0) {
entry:
  %retval = alloca i64, align 8
  %offset = alloca i64, align 8
  store i64 0, ptr %offset, align 4
  %params = alloca { { ptr, i64 }, ptr, { ptr, i64, i64 } }, align 8
  call void @move_rt_deserialize(ptr %params, ptr %0)
  %instruction_data = getelementptr inbounds { { ptr, i64 }, ptr, { ptr, i64, i64 } }, ptr %params, i32 0, i32 0
  %program_id = getelementptr inbounds { { ptr, i64 }, ptr, { ptr, i64, i64 } }, ptr %params, i32 0, i32 1
  %accounts = getelementptr inbounds { { ptr, i64 }, ptr, { ptr, i64, i64 } }, ptr %params, i32 0, i32 2
  %insn_data_ptr = getelementptr inbounds { ptr, i64 }, ptr %instruction_data, i32 0, i32 0
  %insn_data_ptr_loaded = load ptr, ptr %insn_data_ptr, align 8
  %offset_loaded = load i64, ptr %offset, align 4
  %offset_loaded1 = add i64 %offset_loaded, 8
  store i64 %offset_loaded1, ptr %offset, align 4
  %entry_slice_ptr = getelementptr i8, ptr %insn_data_ptr_loaded, i64 %offset_loaded1
  %entry_slice_len = load i64, ptr %insn_data_ptr_loaded, align 4
  %offset_loaded2 = load i64, ptr %offset, align 4
  %offset_loaded3 = add i64 %offset_loaded2, %entry_slice_len
  store i64 %offset_loaded3, ptr %offset, align 4
  %entry_func_ptr_loaded = load ptr, ptr @str_slice, align 8
  %entry_func_len_loaded = load i64, ptr getelementptr inbounds ({ ptr, i64 }, ptr @str_slice, i32 0, i32 1), align 4
  %1 = call i1 @move_rt_str_cmp_eq(ptr %entry_slice_ptr, i64 %entry_slice_len, ptr %entry_func_ptr_loaded, i64 %entry_func_len_loaded)
  br i1 %1, label %then_bb, label %else_bb

then_bb:                                          ; preds = %entry
  call void @"0000000000000001_unit_test_unit_test_poiso_4afD3MScT99fc9"()
  store i64 0, ptr %retval, align 4
  br label %exit_bb

else_bb:                                          ; preds = %entry
  %entry_func_ptr_loaded4 = load ptr, ptr @str_slice.2, align 8
  %entry_func_len_loaded5 = load i64, ptr getelementptr inbounds ({ ptr, i64 }, ptr @str_slice.2, i32 0, i32 1), align 4
  %2 = call i1 @move_rt_str_cmp_eq(ptr %entry_slice_ptr, i64 %entry_slice_len, ptr %entry_func_ptr_loaded4, i64 %entry_func_len_loaded5)
  br i1 %2, label %then_bb6, label %else_bb7

then_bb6:                                         ; preds = %else_bb
  call void @"0000000000000001_hash_unit_test_poiso_4wx61fBNpDhykC"()
  store i64 0, ptr %retval, align 4
  br label %exit_bb

else_bb7:                                         ; preds = %else_bb
  %entry_func_ptr_loaded8 = load ptr, ptr @str_slice.4, align 8
  %entry_func_len_loaded9 = load i64, ptr getelementptr inbounds ({ ptr, i64 }, ptr @str_slice.4, i32 0, i32 1), align 4
  %3 = call i1 @move_rt_str_cmp_eq(ptr %entry_slice_ptr, i64 %entry_slice_len, ptr %entry_func_ptr_loaded8, i64 %entry_func_len_loaded9)
  br i1 %3, label %then_bb10, label %else_bb11

then_bb10:                                        ; preds = %else_bb7
  call void @"0000000000000001_hash_tests_unit_test_poiso_A8wEggpFLSNBH1"()
  store i64 0, ptr %retval, align 4
  br label %exit_bb

else_bb11:                                        ; preds = %else_bb7

exit_bb:                                          ; preds = %then_bb10, %then_bb6, %then_bb
}

declare void @move_rt_deserialize(ptr sret({ { ptr, i64 }, ptr, { ptr, i64, i64 } }), ptr)

declare void @"0000000000000001_unit_test_unit_test_poiso_4afD3MScT99fc9"()

declare i1 @move_rt_str_cmp_eq(ptr nonnull readonly, i64, ptr nonnull readonly, i64)

declare void @"0000000000000001_hash_unit_test_poiso_4wx61fBNpDhykC"()

declare void @"0000000000000001_hash_tests_unit_test_poiso_A8wEggpFLSNBH1"()
