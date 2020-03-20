class TaskCollection
    include ActiveModel::Conversion
    extend ActiveModel::Naming
    extend ActiveModel::Translation
    include ActiveModel::AttributeMethods
    include ActiveModel::Validations
    attr_accessor :collection  # ここに作成したユーザーモデルが格納される

    def initialize(attributes = [])
        if attributes.present?
            self.collection = attributes.map do |value|
                Task.new(
                    :t_name         => value['name'],
                    :start_date     => value['start_date'],
                    :end_date       => value['end_date'],
                    :role           => value['role'],
                    :parent_task_id => value['parent_task_id'],
                    :t_number       => value['t_number'],
                    :person_id      => value['person_id'],
                    :before_date    => value['before_date'],
                    :date_duration  => value['date_duration']
                )
            end
        end
    end

    def persisted?
        false
    end

end