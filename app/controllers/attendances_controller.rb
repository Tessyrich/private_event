class AttendancesController < ApplicationController
  before_action :authenticate_user!
  def create
    event = Event.find(params[:event_id])
    current_user.attended_events << event unless current_user.attended_events.include?(event)
    redirect_to event
  end

  def destroy
    attendance = current_user.attendances.find_by(attended_event_id: params[:event_id])
    attendance.destroy if attendance
    redirect_to event_path(params[:event_id])
  end
end
