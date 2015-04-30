require "marshal_dump_and_load/version"

# オブジェクトに対して「深いコピー」 (deep copy) を行うメソッドを提供するモジュール
module MarshalDumpAndLoad

  # @!group オブジェクトの操作

  # オブジェクトに対して「深いコピー」 (deep copy) を行うメソッド
  # @return [Object]
  def deep_copy
    ::Marshal.load( ::Marshal.dump( self ) )
  end

  # @!endgroup

end

BasicObject.class_eval do
  include MarshalDumpAndLoad
end