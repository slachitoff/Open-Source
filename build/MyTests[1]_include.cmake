if(EXISTS "C:/Users/Sky/Documents/GitHub/Open-Source/build/MyTests[1]_tests.cmake")
  include("C:/Users/Sky/Documents/GitHub/Open-Source/build/MyTests[1]_tests.cmake")
else()
  add_test(MyTests_NOT_BUILT MyTests_NOT_BUILT)
endif()