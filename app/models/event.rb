class Event < ApplicationRecord
  enum status: { pending: 0, processed: 1, failed: 2 }
end
