#!/usr/bin/env ruby

require 'test_helper'

class TestRepack < Test::Unit::TestCase
  def test_repack
    in_temp_dir do |path|
      r1 = Git.clone(BARE_REPO_PATH, 'repo1')


      r1.chdir do
        new_file('new_file', 'new content')
      end
      r1.add
      r1.commit('my commit')

      # see how big the repo is
      size1 = r1.repo_size

      r1.repack

      # see how big the repo is now, should be smaller
      assert(size1 > r1.repo_size)
    end
  end
end
