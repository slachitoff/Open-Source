add_test([=[MyTestSuite.Test1]=]  C:/Users/Sky/Documents/GitHub/Open-Source/build/Debug/MyTests.exe [==[--gtest_filter=MyTestSuite.Test1]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[MyTestSuite.Test1]=]  PROPERTIES WORKING_DIRECTORY C:/Users/Sky/Documents/GitHub/Open-Source/build SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
set(  MyTests_TESTS MyTestSuite.Test1)
