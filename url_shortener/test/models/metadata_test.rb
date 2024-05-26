require "test_helper"

class MetadataTest < ActiveSupport::TestCase
  test "title attribute" do
    assert_equal "Hello", Metadata.new("<title>Hello</title>").title
  end

  test "missing title attribute" do
    assert_nil Metadata.new.title
  end

  test "meta description through og tag" do
    assert_equal "Hello", Metadata.new("<meta property='og:description' content='Hello'>").description
  end

  test "meta description without og tag" do
    assert_equal "Hello2", Metadata.new("<meta name='description' content='Hello2'>").description
  end

  test "missing meta description" do
    assert_nil Metadata.new.description
  end

  test "image" do
    assert_equal "https://example.org/a.png", Metadata.new("<meta property='og:image' content='https://example.org/a.png'>").image
  end

  test "missing image" do
    assert_nil Metadata.new.image
  end
end