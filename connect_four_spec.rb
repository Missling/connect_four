require 'pry'
require "./connect_four"

describe "win?" do
  it "check column win" do
    connect_four = ConnectFour.new(3, 3, 3)
    connect_four.play(1, 1)
    connect_four.play(2, 2)
    connect_four.play(1, 0)
    connect_four.play(2, 0)
    connect_four.play(1, 1)
    connect_four.play(1, 1)

    connect_four.display

    expect(connect_four.win?(1)).to be true
  end

  it "check row win" do
    connect_four = ConnectFour.new(3, 3, 3)
    connect_four.play(1, 1)
    connect_four.play(1, 2)
    connect_four.play(1, 0)

    connect_four.display

    expect(connect_four.win?(0)).to be true
  end

  it "check diagonal top left win" do
    connect_four = ConnectFour.new(3, 3, 3)
    connect_four.play(1, 1)
    connect_four.play(2, 2)
    connect_four.play(1, 0)
    connect_four.play(1, 1)
    connect_four.play(2, 2)
    connect_four.play(1, 2)
  

    connect_four.display

    expect(connect_four.win?(1)).to be true
  end

  it "check diagonal top right win" do
    connect_four = ConnectFour.new(3, 3, 3)
    connect_four.play(1, 1)
    connect_four.play(2, 2)
    connect_four.play(1, 0)
    connect_four.play(2, 1)
    connect_four.play(1, 0)
    connect_four.play(2, 0)

    connect_four.display

    expect(connect_four.win?(2)).to be true
  end
end
