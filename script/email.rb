require 'logger'

class Email
  def self.process(message)
    file = File.open(File.join(__dir__, '../log/mailman.log'), File::WRONLY | File::APPEND)
    logger = Logger.new(file)

    logger.info "METHODS >>> #{message.methods}"
    logger.info '<<<< PROCESSING EMAIL >>>>'
    logger.info "EMAIL TITLE: #{message.subject}"
    logger.info "EMAIL MESSAGE: \n\n#{message.body}"
    logger.info "EMAIL ATTACHMENTS:  \n\n#{message.attachments}"
    logger.close
  end
end
