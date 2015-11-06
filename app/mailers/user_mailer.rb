class UserMailer <ApplicationMailer
  def repair_request repair
    @repair = repair
    User.where(admin:true).each do |manager|

      mail(to: manager.email, subject: "#{@repair.user.aptnum} repair request: #{@repair.name}" , body: "#{@repair.repair_description}")
    end
  end

  def complete_repair repair
    @repair = repair
    mail(to: @repair.user.email, subject: "Your repair request has been completed", body: "Your repair request for #{@repair.name} has been completed")
  end

  def send_alert user
    @user = user
      mail(to: @user.email, subject: "Message from manager", body: "This is an alert")
    end
  end
