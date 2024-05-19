require "test_helper"

class Base62Test < ActiveSupport::TestCase
  test "encode 0" do
    assert_equal "0", Base62.encode(0)
  end

  test "encode 1" do
    assert_equal "1", Base62.encode(1)
  end

  test "encode 10" do
    assert_equal "A", Base62.encode(10)
  end

  test "encode 62" do
    assert_equal "10", Base62.encode(62)
  end

  test "encode 1212" do
    assert_equal "JY", Base62.encode(1212)
  end

  test "encode 999_999" do
    assert_equal "4C91", Base62.encode(999_999)
  end

  test "decode '0'" do
    assert_equal 0, Base62.decode("0")
  end

  test "decode '1'" do
    assert_equal 1, Base62.decode("1")
  end

  test "decode '3D7'" do
    assert_equal 12345, Base62.decode("3D7")
  end

  test "decode '4C92''" do
    assert_equal 1_000_000, Base62.decode("4C92")
  end

  # non legal input
  test "encode -1" do
    assert_equal "", Base62.encode(-1)
  end

  test "encode -87" do
    assert_equal "", Base62.encode(-87)
  end

  test "decode 'iur#'" do
    assert_equal -1, Base62.decode("iur#")
  end

  test "decode '+sadf'" do
    assert_equal -1, Base62.decode("+sadf")
  end

  test "decode '39sdf+sadf'" do
    assert_equal -1, Base62.decode("39sdf+sadf")
  end
end
