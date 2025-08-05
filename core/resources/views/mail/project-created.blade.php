// resources/views/emails/project-created.blade.php
<div style="font-family: Open Sans, sans-serif; background-color: #f2f2f2; padding: 30px; text-align: center;">
    <h2 style="color: #333;">🎉 Congratulations!</h2>
    <p style="font-size: 16px; color: #555;">Your project <strong>{{ $title }}</strong> has been successfully created and is now live.</p>
    <p style="margin-top: 20px; font-size: 14px; color: #666;">
        You can manage or share your project from the link below.
    </p>
    <a href="{{ $link }}" style="display: inline-block; margin-top: 30px; padding: 12px 24px; background-color: {{ $color }}; color: white; text-decoration: none; font-weight: bold; border-radius: 5px;">View Project</a>
</div>
