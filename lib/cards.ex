defmodule Cards do
  @moduledoc """
    This is the most incredible documentation tool I've seen
  """

  @doc """
    Generate a deck for the user
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    List.flatten(for value <- values do
      for suit <- suits do
        "#{value} of #{suit}"
      end
    end)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines whether deck contains card.

  ## Examples

      iex(1)> cards = Cards.create_deck
      iex(2)> Cards.contains?(cards, "Ace of Hearts")
      true
      
  """
  def contains?(deck, card) do
    Enum.member?(deck,card)
  end


  @doc """
    Divides hand into deck.  `hand_size` shows numbers of cards in hand.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck) do
    file = :erlang.term_to_binary(deck)
    File.write("saveme",file)
  end

  def load(file) do
    case File.read(file) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "Bad filename"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
