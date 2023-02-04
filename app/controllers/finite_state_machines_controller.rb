class FiniteStateMachinesController < ApplicationController

  def machine
    return unless request.post?
    @output_value = FiniteStateMachineService::new(input: params[:machine][:input], initial_state: params[:machine][:initial_state], transition_functions: params[:machine][:transition_functions], final_states: params[:machine][:final_states]).run!

    redirect_to machine_path, notice: t(".result", result: @output_value)
  end
end