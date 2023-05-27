require "logstash/devutils/rspec/spec_helper"
require "logstash/outputs/datadog"

describe LogStash::Outputs::Datadog do

  let(:plugin) { described_class.new(config) }

  describe "debugging `api_key`" do
    let(:config) {{ 'dd_tags' => %w[foo bar],
                    "api_key" => "$ecre&-key"
      }
    }

    it "should not show origin value" do
      expect(plugin.logger).to receive(:debug).with('<password>')
      plugin.logger.send(:debug, plugin.api_key.to_s)
    end
  end

end