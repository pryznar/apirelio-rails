# frozen_string_literal: true

require "minitest/autorun"
require "rack/mock"
require "apirelio/rails"

class RecordingTransport
  attr_reader :events

  def initialize
    @events = []
  end

  def send(events)
    @events.concat(events)
  end
end
