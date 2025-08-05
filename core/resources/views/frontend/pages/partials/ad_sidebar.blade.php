@if(isset($ads) && is_array($ads) && array_key_exists('sidebar', $ads))
    @forelse($ads['sidebar'] as $ad)
        <div class="single-shop-left bg-white radius-10 mt-4">
            <div class="single-shop-left-title open flex-column">
                <h4>{{$ad->title}}</h4>
                <a href="{{$ad->url}}" target="_blank">
                    <img src="{{"/assets/uploads/ads/".$ad->cover_image}}" alt="ad">
                </a>
                <div>{{$ad->company}}</div>
                <div>{{$ad->description}}</div>
            </div>
        </div>
    @empty
    @endforelse
@endif