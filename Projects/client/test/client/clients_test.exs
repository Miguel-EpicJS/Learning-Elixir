defmodule Client.ClientsTest do
  use Client.DataCase

  alias Client.Clients

  describe "users" do
    alias Client.Clients.User

    @valid_attrs %{desc: "some desc", name: "some name", price: 120.5}
    @update_attrs %{desc: "some updated desc", name: "some updated name", price: 456.7}
    @invalid_attrs %{desc: nil, name: nil, price: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Clients.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Clients.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Clients.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Clients.create_user(@valid_attrs)
      assert user.desc == "some desc"
      assert user.name == "some name"
      assert user.price == 120.5
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Clients.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Clients.update_user(user, @update_attrs)
      assert user.desc == "some updated desc"
      assert user.name == "some updated name"
      assert user.price == 456.7
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Clients.update_user(user, @invalid_attrs)
      assert user == Clients.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Clients.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Clients.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Clients.change_user(user)
    end
  end
end
