require 'minitest/autorun'
require './data_structures/graph'

describe Graph do
  #    1   2  6
  #   / \ /     \
  #  3 - 4 - 5   7
  let(:nodes) do
    {
      1 => [3, 4],
      2 => [4],
      3 => [1, 4],
      4 => [1, 2, 3, 5],
      5 => [4],
      6 => [7],
      7 => [6]
    }
  end
  let(:graph) { Graph.new(nodes) }

  describe '#has_path_dfs?' do
    describe 'when there is a path' do
      it 'returns true' do
        assert graph.has_path_dfs?(1, 5)
      end
    end

    describe 'when there is no path' do
      it 'returns false' do
        refute graph.has_path_dfs?(2, 6)
      end
    end
  end

  describe '#has_path_bfs?' do
    describe 'when there is a path' do
      it 'returns true' do
        assert graph.has_path_bfs?(1, 4)
      end
    end

    describe 'when there is no path' do
      it 'returns false' do
        refute graph.has_path_bfs?(2, 6)
      end
    end
  end
end
