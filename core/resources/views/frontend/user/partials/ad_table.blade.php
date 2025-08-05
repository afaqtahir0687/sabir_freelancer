@php($isFreelancer = $isFreelancer ?? false)
<table>
    <thead>
    <tr>
        <th>{{ __('Title') }}</th>
        <th>{{ __('Company Name') }}</th>
        <th>{{ __('Type') }}</th>
        <th>{{ __('Quantity') }}</th>
        <th>{{ __('Payable Amount') }}</th>
        <th>{{ __('Status') }}</th>
        <th>{{ __('Action') }}</th>
    </tr>
    </thead>
    <tbody>
    @forelse($ads as $ad)
        <tr>
            <td>{{$ad->title}}</td>
            <td>{{$ad->company}}</td>
            <td>{{$ad->optimize_for}}</td>
            <td>{{$ad->quantity}}</td>
            <td>${{$ad->quantity*$ad->ppq}}</td>
            <td>{{$ad->status}}</td>
            <td>
                @if(!$ad->is_paid)
                    <form method="post" action="{{$isFreelancer ? route('freelancer.ad.pay') : route('client.ad.pay')}}">
                        @csrf
                        <input type="hidden" value="{{$ad->id}}" name="id">
                        <button class="btn-profile btn-bg-1">Pay Now</button>
                    </form>
                @endif
            </td>
        </tr>
    @empty
        <tr>
            <td colspan="6" class="text-center">No Ads Found</td>
        </tr>
    @endforelse
    </tbody>
</table>