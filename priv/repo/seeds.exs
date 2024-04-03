# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MiniViking.Repo.insert!(%MiniViking.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias MiniViking.Accounts

# Create users

random_roles = ["admin", "subscriber", "manager"]

random_email_domains = [
  "gmail.com",
  "yahoo.com",
  "hotmail.com",
  "outlook.com",
  "yandex.com",
  "mail.com",
  "gmx.com",
  "inbox.com",
  "lavabit.com",
  "guerrillamail.com",
  "sharklasers.com",
  "temp-mail.org",
  "10minutemail.com",
  "emailfake.com"
]

Enum.map(1..100, fn _ ->
  first_name = Faker.Person.first_name()
  last_name = Faker.Person.last_name()

  %{
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}.#{last_name}@#{Enum.random(random_email_domains)}",
    role: Enum.random(random_roles)
  }
end)
|> Enum.map(&Accounts.create_user(&1))

{:ok, _user} =
  Accounts.create_user(%{
    first_name: "Ragnar",
    last_name: "Lothbrok",
    email: "admin@sagawisdom.com",
    role: "admin"
  })
