# https://stackoverflow.com/questions/23505247/have-to-json-return-a-mongoid-as-a-string
module BSON
  class ObjectId
    def to_json(*)
      to_s.to_json
    end
    def as_json(*)
      to_s.as_json
    end
  end
end

module Mongoid
  module Document
    def serializable_hash(options = nil)
      super(options).tap do |hash|
        hash["id"] = self.id.to_s
        hash.delete("_id")
      end
    end
  end
end
