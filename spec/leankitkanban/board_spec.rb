require "spec_helper"

describe LeanKitKanban::Board do
  before :all do
    ConfigHelper.set_test_config
  end

  describe :all do
    it "gets all boards for that account" do
      api_call = "/Boards"
      # expect(LeanKitKanban::Board).to receive (:get).with(api_call)
      LeanKitKanban::Board.should_receive(:get).with(api_call)
      LeanKitKanban::Board.all
    end
  end

  describe :find do
    before :each do
      @board_id  = double("boardID")
    end

    it "gets the board whose id is passed as parameter" do
      api_call = "/Boards/#{@board_id}"
      LeanKitKanban::Board.should_receive(:get).with(api_call)
      LeanKitKanban::Board.find(@board_id)
    end
  end

  describe :get_identifiers do
    before :each do
      @board_id  = double("boardID")
    end

    it "gets the identifiers of the board whose id is passed as parameter" do
      api_call = "/Board/#{@board_id}/GetBoardIdentifiers"
      LeanKitKanban::Board.should_receive(:get).with(api_call)
      LeanKitKanban::Board.get_identifiers(@board_id)
    end
  end

  describe :get_newer_if_exists do
    before :each do
      @board_id   = double("boardID")
      @version_id = double("versionID")
    end

    it "gets a greater version of the board than the one passed" do
      api_call = "/Board/#{@board_id}/BoardVersion/#{@version_id}/GetNewerIfExists"
      LeanKitKanban::Board.should_receive(:get).with(api_call)
      LeanKitKanban::Board.get_newer_if_exists(@board_id, @version_id)
    end
  end

  describe :get_board_history_since do
    before :each do
      @board_id   = double("boardID")
      @version_id = double("versionID")
    end

    it "gets a greater version of the board than the one passed" do
      api_call = "/Board/#{@board_id}/BoardVersion/#{@version_id}/GetBoardHistorySince"
      LeanKitKanban::Board.should_receive(:get).with(api_call)
      LeanKitKanban::Board.get_board_history_since(@board_id, @version_id)
    end
  end

  describe :check_for_updates do
    before :each do
      @board_id   = double("boardID")
      @version_id = double("versionID")
    end

    it "gets any events that have occurred with the Board since the given version" do
      api_call = "/Board/#{@board_id}/BoardVersion/#{@version_id}/CheckForUpdates"
      LeanKitKanban::Board.should_receive(:get).with(api_call)
      LeanKitKanban::Board.check_for_updates(@board_id, @version_id)
    end
  end
end