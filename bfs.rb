class BFS
  def self.solve(start_node)
    visited = { start_node => 1 }
    came_from = { start_node => nil }
    queue = [start_node]
    
    while queue.size > 0
      current = queue.shift

      if current.solved?
        path = []

        while came_from[current] != nil
          path.unshift(current)
          current = came_from[current]
        end

        path.unshift(current)
        return path
      end

      current.get_moves.each do |move|
        next_position = current.deep_copy
        next_position.move(move)
        next if visited[next_position]
        visited[next_position] = 1
        came_from[next_position] = current
        queue << next_position
      end
    end

    return false
  end
end
