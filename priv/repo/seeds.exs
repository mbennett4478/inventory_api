# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BsmpleInventory.Repo.insert!(%BsmpleInventory.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias BsmpleInventory.Blog

%{
  title: "Test 1",
  body: "Test Body"
} |> Blog.create_post
