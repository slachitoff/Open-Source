#include <gtest/gtest.h>

// Your test cases go here
TEST(MyTestSuite, Test1) {
  // Your test assertions go here
  EXPECT_EQ(10 * 10, 100);
}

int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}