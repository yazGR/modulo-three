require "rails_helper"

RSpec.describe FiniteStateMachinesController do

  describe "GET #machine" do
    before { get :machine, params: {} }

    it { expect(response).to be_successful }
  end

  describe "POST #machine" do

    let(:post!) do
      post :machine, params: { machine: { input: "1010", initial_state: "S0",
                                             transition_functions: "δ(S0,0) = S0; δ(S0,1) = S1; δ(S1,0) = S2; δ(S1,1) = S0; δ(S2,0) = S1; δ(S2,1) = S2", final_states: "(S0,0);(S1,1);(S2,2)"} }
    end

    before { post! }

    it { expect(response).to redirect_to(machine_path) }
    it { expect(flash[:notice]).to be_present }
  end
end