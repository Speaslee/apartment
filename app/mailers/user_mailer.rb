class UserMailer <ApplicationMailer
  def repair_request repair
    @repair = repair
    User.where(admin:true).each do |manager|

      mail(to: manager.email, subject: "#{@repair.user.aptnum} repair request: #{@repair.name}" )
  end

  def complete_alert repair
    @repair = repair
    mail(to: @repair.user.email, subject: "Your repair request has been completed")
  end

  def send_alert
    @users = Users.all
    @users.each do |alert|
      mail(to: alert.email, subject: "Message from manager")
  end
