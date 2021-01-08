defmodule LiveViewTodosWeb.TodoLive do
  use LiveViewTodosWeb, :live_view
  alias LiveViewTodos.Todos


  def mount(_params, _session, socket) do
    {:ok, assign(socket, todos: Todos.list_todos())}
  end

  def render(assigns) do
    ~L"""
      <%= for todo <- @todos do %>
        <div> <%= todo.title %> </div>
      <% end %>
    """
  end

end
