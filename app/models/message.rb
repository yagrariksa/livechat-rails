class Message < ApplicationRecord
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

    def to_render
        return {
            owner: self.sender,
            message: self.body,
            time: self.msg_time,
            pc: self.pc
        }
    end
end
