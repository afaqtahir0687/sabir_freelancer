<div class="modal fade" id="timeModal{{$history->id}}" tabindex="-1" aria-labelledby="timeModalLabel{{$history->id}}" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="timeModalLabel{{$history->id}}">{{ __('Work Hour') }}</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="{{ route('client.order.work.history.update',$history->id) }}" method="post">
                @csrf
                <div class="modal-body">
                    <strong>{{ __('info: time format must be 00:00:00') }}</strong>
                    <input name="manual_time" class="form-control" value="{{ $history->hours_worked }}" placeholder="{{ __('Enter time') }}">
                </div>
                <div class="modal-footer flex-column">
                    <div>
                        <button type="button" class="btn-profile btn-outline-gray btn-hover-danger" data-bs-dismiss="modal">{{ __('Close') }}</button>
                        <button type="submit" class="btn-profile btn-bg-1">{{ __('Submit') }}</button>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
