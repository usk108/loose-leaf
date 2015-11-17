require 'test_helper'
require 'active_record'

module Elasticsearch
  module Model
    class ActiveRecordNamespacedModelIntegrationTest < Elasticsearch::Test::IntegrationTestCase
      context "Namespaced ActiveRecord model integration" do
        setup do
          ActiveRecord::Schema.define(:version => 1) do
            create_table :articles do |t|
              t.string   :title
            end
          end

          module ::MyNamespace
            class Article < ActiveRecord::Base
              include Elasticsearch::Model
              include Elasticsearch::Model::Callbacks

              mapping { indexes :title }
            end
          end

          MyNamespace::Article.delete_all
          MyNamespace::Article.__elasticsearch__.create_index! force: true

          MyNamespace::Article.create! title: 'Test'

          MyNamespace::Article.__elasticsearch__.refresh_index!
        end

        should "have proper index name and document type" do
          assert_equal "my_namespace-articles", MyNamespace::Article.index_name
          assert_equal "article",               MyNamespace::Article.document_type
        end

        should "save document into index on save and find it" do
          response = MyNamespace::Article.search 'title:test'

          assert       response.any?, "No results returned: #{response.inspect}"
          assert_equal 1, response.size

          assert_equal 'Test', response.results.first.title
        end
      end

    end
  end
end
