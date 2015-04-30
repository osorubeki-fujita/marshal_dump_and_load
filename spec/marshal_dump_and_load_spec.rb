require 'spec_helper'
require 'deplo'

spec_filename = ::File.expand_path( ::File.dirname( __FILE__ ) )
version = "0.1.0"

describe MarshalDumpAndLoad do
  it "has a version number \'#{ version }\'" do
    expect( ::MarshalDumpAndLoad::VERSION ).to eq( version )
    expect( ::Deplo.version_check( ::MarshalDumpAndLoad::VERSION , spec_filename ) ).to eq( true )
  end

  ary_1 = [1,2,3]
  ary_2 = ary_1

  ary_3 = ary_1.dup
  ary_4 = ary_1.clone
  ary_5 = ary_1.deep_copy

  ary_1 << 4

  ary_3 << 5
  ary_4 << 6
  ary_5 << 7

  it 'copy objects deeply' do
    expect( ary_1 ).to eq( [1,2,3,4] )
    expect( ary_2 ).to eq( [1,2,3,4] )

    expect( ary_3 ).to eq( [1,2,3,5] )
    expect( ary_4 ).to eq( [1,2,3,6] )
    expect( ary_5 ).to eq( [1,2,3,7] )
  end

end