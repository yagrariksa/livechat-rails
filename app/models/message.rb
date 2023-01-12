class Message < ApplicationRecord
    after_create_commit { broadcast_append_to "messages"}

    def time
        return created_at.strftime("%H:%M")
    end

    def day
        if created_at.today?
            return "Today"
        elsif created_at.to_date.yesterday?
            return "Yesterday"
        else
            return created_at.strftime("%d %b")
        end
    end

    def msg_time
        return day + ", " + time
    end
end
