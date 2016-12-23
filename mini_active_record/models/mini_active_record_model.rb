module MiniActiveRecord
  class InvalidAttributeError < StandardError; end
  class NotConnectedError < StandardError; end

  class Model

    def self.all(this, string)
    MiniActiveRecord::Model.execute("SELECT * FROM #{string}").map do |row|
      this.new(row)
      end
    end

    def self.create(attributes, this)
      record = this.new(attributes)
      record.save
      record
    end

    def self.where(query, *args, this, string)
    MiniActiveRecord::Model.execute("SELECT * FROM #{string} WHERE #{query}", *args).map do |row|
      this.new(row)
      end
    end

    def self.find(pk,this)
      this.where('id = ?', pk).first
    end

    def initialize(attributes = {},attribute_names)
      attributes.symbolize_keys!
      raise_error_if_invalid_attribute!(attributes.keys)

      @attributes = {}

      attribute_names.each do |name|
      @attributes[name] = attributes[name]
      end
      @old_attributes = @attributes.dup
    end

    def save
      if new_record?
        results = insert!
      else
        results = update!
      end

      @old_attributes = @attributes.dup

      results
    end

    def [](attribute)
      raise_error_if_invalid_attribute!(attribute)

      @attributes[attribute]
    end

    def []=(attribute, value)
      raise_error_if_invalid_attribute!(attribute)
      @attributes[attribute] = value
    end

    def new_record?(this)
      this[:id].nil?
    end
  

    def self.inherited(klass)
    end

    def self.database=(filename)
      @filename = filename
      @connection = SQLite3::Database.new(@filename)

      # Return the results as a Hash of field/value pairs
      # instead of an Array of values
      @connection.results_as_hash  = true

      # Automatically translate data from database into
      # reasonably appropriate Ruby objects
      @connection.type_translation = true
    end

    def self.filename
      @filename
    end

    def self.connection
      @connection
    end

    def self.execute(query, *args)
      raise NotConnectedError, "You are not connected to a database." unless connected?

      prepared_args = args.map { |arg| prepare_value(arg) }
      MiniActiveRecord::Model.connection.execute(query, *prepared_args)
    end

    def self.connected?
      !self.connection.nil?
    end

    def self.attribute_names
      @attribute_names
    end

    def self.attribute_names=(attribute_names)
      @attribute_names = attribute_names
    end

    def self.last_insert_row_id
      MiniActiveRecord::Model.connection.last_insert_row_id
    end

    def valid_attribute?(attribute)
      self.class.attribute_names.include? attribute
    end

    def raise_error_if_invalid_attribute!(attributes)
      # This guarantees that attributes is an array, so we can call both:
      #   raise_error_if_invalid_attribute!("id")
      # and
      #   raise_error_if_invalid_attribute!(["id", "name"])
      Array(attributes).each do |attribute|
        unless valid_attribute?(attribute)
          raise InvalidAttributeError, "Invalid attribute for #{self.class}: #{attribute}"
        end
      end
    end

    def to_s
      attribute_str = self.attributes.map { |key, val| "#{key}: #{val.inspect}" }.join(', ')
      "#<#{self.class} #{attribute_str}>"
    end


    private

    def self.prepare_value(value)
      case value
      when Time, DateTime, Date
        value.to_s
      else
        value
      end
    end
  #probado
    def insert!(this,string)
      this[:created_at] = DateTime.now
      this[:updated_at] = DateTime.now

      fields = this.attributes.keys
      values = this.attributes.values
      marks  = Array.new(fields.length) { '?' }.join(',')

      insert_sql = "INSERT INTO #{string} (#{fields.join(',')}) VALUES (#{marks})"

      results = MiniActiveRecord::Model.execute(insert_sql, *values)

      # This fetches the new primary key and updates this instance
      this[:id] = MiniActiveRecord::Model.last_insert_row_id
      results
    end
  #probado
    def update!(this,string)
      this[:updated_at] = DateTime.now

      fields = this.attributes.keys
      values = this.attributes.values

      update_clause = fields.map { |field| "#{field} = ?" }.join(',')
      update_sql = "UPDATE #{string} SET #{update_clause} WHERE id = ?"

      # We have to use the (potentially) old ID attribute in case the user has re-set it.
      MiniActiveRecord::Model.execute(update_sql, *values, this.old_attributes[:id])
    end

  end

end