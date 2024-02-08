add_executable(MyTests HelloWorldTests.cpp)
target_link_libraries(MyTests GTest::gtest GTest::gtest_main)