Sequel.migration do 
  change do

    create_table :views do
      primary_key :id
      String :url
      String :referrer
      String :hash
      DateTime :created_at
    end

  end
end