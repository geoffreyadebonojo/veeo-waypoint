class User::NotesController < User::ApplicationController
  def create
    source = Source.find(note_params[:source_id])
    if source.user == current_user
      Note.create(note_params)
    end
    redirect_to request.referrer
  end

  private

  def note_params
    params.require(:note).permit(:text).merge(params.permit(:source_id))
  end

end
