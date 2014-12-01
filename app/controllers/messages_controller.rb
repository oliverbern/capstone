class MessagesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :get_mailbox

end