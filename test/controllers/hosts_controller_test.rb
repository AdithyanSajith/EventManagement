require "test_helper"

class HostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @host = hosts(:one)
  end

  test "should get index" do
    get hosts_url
    assert_response :success
  end

  test "should get new" do
    get new_host_url
    assert_response :success
  end

  test "should create host" do
    assert_difference("Host.count") do
      post hosts_url, params: { host: { bio: @host.bio, number: @host.number, organisation: @host.organisation, string: @host.string, website: @host.website } }
    end

    assert_redirected_to host_url(Host.last)
  end

  test "should show host" do
    get host_url(@host)
    assert_response :success
  end

  test "should get edit" do
    get edit_host_url(@host)
    assert_response :success
  end

  test "should update host" do
    patch host_url(@host), params: { host: { bio: @host.bio, number: @host.number, organisation: @host.organisation, string: @host.string, website: @host.website } }
    assert_redirected_to host_url(@host)
  end

  test "should destroy host" do
    assert_difference("Host.count", -1) do
      delete host_url(@host)
    end

    assert_redirected_to hosts_url
  end
end
