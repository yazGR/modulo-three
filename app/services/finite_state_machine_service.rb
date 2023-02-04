class FiniteStateMachineService
  def initialize(input:, initial_state:, transition_functions:, final_states:)
    @input = input
    @initial_state = initial_state
    @transition_functions = transition_functions
    @final_states = final_states
  end

  def run!
    state = @initial_state
    transition_functions = transitions
    final_states_output_values = output_values
    @input.split("").each do |value|
      state = transition_functions[state][value]
    end
    final_states_output_values[state]
  end

  private

  def transitions
    functions = Hash.new { |hash, key| hash[key] = {} }
    @transition_functions.split(";").each do |transition|
      function = transition.gsub(" ", "").split("=")
      values = function[0].gsub(/\δ|\(|\)/, "").split(",")
      functions[values[0]].store values[1],function[1]
    end
    functions
  end

  def output_values
    values = Hash.new
    @final_states.split(";").each do |final_state|
      final_state_array = final_state.gsub(/\(|\)/, "").split(",")
      values[final_state_array[0]] = final_state_array[1]
    end
    values
  end
end