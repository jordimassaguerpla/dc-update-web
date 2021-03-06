require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe DockerCfgsController, type: :controller do
  before :each do
    allow_any_instance_of(ApplicationController).to receive(:is_admin?).and_return(true)
  end

  # This should return the minimal set of attributes required to create a valid
  # DockerCfg. As you add validations to DockerCfg, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
     :url => "http://a.b.com",
     :auth => "asdfasdf",
     :email => "a@b.com"
    }
  }

  let(:invalid_attributes) {
    {
     :url => "http://a.b.com",
     :auth => "asdfasdf",
     :email => "not valid"
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DockerCfgsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all docker_cfgs as @docker_cfgs" do
      docker_cfg = DockerCfg.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:docker_cfgs)).to eq([docker_cfg])
    end
  end

  describe "GET #show" do
    it "assigns the requested docker_cfg as @docker_cfg" do
      docker_cfg = DockerCfg.create! valid_attributes
      get :show, {:id => docker_cfg.to_param}, valid_session
      expect(assigns(:docker_cfg)).to eq(docker_cfg)
    end
  end

  describe "GET #new" do
    it "assigns a new docker_cfg as @docker_cfg" do
      get :new, {}, valid_session
      expect(assigns(:docker_cfg)).to be_a_new(DockerCfg)
    end
  end

  describe "GET #edit" do
    it "assigns the requested docker_cfg as @docker_cfg" do
      docker_cfg = DockerCfg.create! valid_attributes
      get :edit, {:id => docker_cfg.to_param}, valid_session
      expect(assigns(:docker_cfg)).to eq(docker_cfg)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new DockerCfg" do
        expect {
          post :create, {:docker_cfg => valid_attributes}, valid_session
        }.to change(DockerCfg, :count).by(1)
      end

      it "assigns a newly created docker_cfg as @docker_cfg" do
        post :create, {:docker_cfg => valid_attributes}, valid_session
        expect(assigns(:docker_cfg)).to be_a(DockerCfg)
        expect(assigns(:docker_cfg)).to be_persisted
      end

      it "redirects to the created docker_cfg" do
        post :create, {:docker_cfg => valid_attributes}, valid_session
        expect(response).to redirect_to(DockerCfg.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved docker_cfg as @docker_cfg" do
        post :create, {:docker_cfg => invalid_attributes}, valid_session
        expect(assigns(:docker_cfg)).to be_a_new(DockerCfg)
      end

      it "re-renders the 'new' template" do
        post :create, {:docker_cfg => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          :url => "http://b.c.com",
          :auth => "1234",
          :email => "b@c.com"
        }
      }

      it "updates the requested docker_cfg" do
        docker_cfg = DockerCfg.create! valid_attributes
        put :update, {:id => docker_cfg.to_param, :docker_cfg => new_attributes}, valid_session
        docker_cfg.reload
        expect(docker_cfg.url).to eq("http://b.c.com")
        expect(docker_cfg.auth).to eq("1234")
        expect(docker_cfg.email).to eq("b@c.com")
      end

      it "assigns the requested docker_cfg as @docker_cfg" do
        docker_cfg = DockerCfg.create! valid_attributes
        put :update, {:id => docker_cfg.to_param, :docker_cfg => valid_attributes}, valid_session
        expect(assigns(:docker_cfg)).to eq(docker_cfg)
      end

      it "redirects to the docker_cfg" do
        docker_cfg = DockerCfg.create! valid_attributes
        put :update, {:id => docker_cfg.to_param, :docker_cfg => valid_attributes}, valid_session
        expect(response).to redirect_to(docker_cfg)
      end
    end

    context "with invalid params" do
      it "assigns the docker_cfg as @docker_cfg" do
        docker_cfg = DockerCfg.create! valid_attributes
        put :update, {:id => docker_cfg.to_param, :docker_cfg => invalid_attributes}, valid_session
        expect(assigns(:docker_cfg)).to eq(docker_cfg)
      end

      it "re-renders the 'edit' template" do
        docker_cfg = DockerCfg.create! valid_attributes
        put :update, {:id => docker_cfg.to_param, :docker_cfg => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested docker_cfg" do
      docker_cfg = DockerCfg.create! valid_attributes
      expect {
        delete :destroy, {:id => docker_cfg.to_param}, valid_session
      }.to change(DockerCfg, :count).by(-1)
    end

    it "redirects to the docker_cfgs list" do
      docker_cfg = DockerCfg.create! valid_attributes
      delete :destroy, {:id => docker_cfg.to_param}, valid_session
      expect(response).to redirect_to(docker_cfgs_url)
    end
  end

end
