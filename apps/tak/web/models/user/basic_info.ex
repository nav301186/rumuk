defmodule Tak.BasicInfo do
use Ecto.Schema
import Ecto.Changeset

  schema "basic_info" do
    field :name, :string
    field :age, :integer
    field :contact_number, :integer
    field :date_of_birth, :integer
    field :current_city, :string
    field :hometown, :string
    belongs_to :user, Tak.User
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, [:name, :age, :contact_number, :date_of_birth, :current_city, :hometown, :user_id])
    |> validate_required([:name, :age])
  end

end