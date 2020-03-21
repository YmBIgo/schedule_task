class TaskCollection

    include ActiveModel::Conversion
    extend ActiveModel::Naming
    extend ActiveModel::Translation
    include ActiveModel::AttributeMethods
    include ActiveModel::Validations
    attr_accessor :collection  # ここに作成したユーザーモデルが格納される

    attr_accessor :collection

    def initialize(attributes = [])
        if attributes.present?
            self.collection = attributes.map do |value|
                Task.new(
                    :t_name         => value['t_name'],
                    :start_date     => value['start_date'],
                    :end_date       => value['end_date'],
                    :role           => value['role'],
                    :parent_task_id => value['parent_task_id'],
                    :t_number       => value['t_number'],
                    :person_id      => value['person_id'],
                    :before_date    => value['before_date'],
                    :date_duration  => value['date_duration'],
                    :reference_url  => value['reference_url'],
                    :reference_text => value['reference_text'],
                    :reference_image => value['reference_image']
                )
            end
        else
            self.collection = 30.times.map{ Task.new }
        end
    end

    def save(w_id)
        is_success = true
        before_id = 0
        ActiveRecord::Base.transaction do 
            collection.each do |result|
                # 
                result.person_id = 1; result.following_task_id = before_id;
                result.work_id = w_id;
                is_success = false unless result.save
                before_id = result.id
            end
            raise ActiveRecord::RecordInvalid unless is_success
        end
        rescue
            p "Error..."
        ensure
            return is_success
    end

    def persisted?
        false
    end

end