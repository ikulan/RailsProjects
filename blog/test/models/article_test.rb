require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "draft? returns true for draft article" do
    assert articles(:draft).draft?
  end

  test "draft? returns false for published article" do
    refute articles(:published).draft?
  end

  test "draft? returns false for scheduled article" do
    refute articles(:scheduled).draft?
  end

  test "published? returns false for draft article" do
    refute articles(:draft).published?
  end

  test "published? returns true for published article" do
    assert articles(:published).published?
  end

  test "published? returns false for scheduled article" do
    refute articles(:scheduled).published?
  end

  test "scheduled? returns false for draft article" do
    refute articles(:draft).scheduled?
  end

  test "scheduled? returns false for published article" do
    refute articles(:published).scheduled?
  end

  test "scheduled? returns true for scheduled article" do
    assert articles(:scheduled).scheduled?
  end

end
