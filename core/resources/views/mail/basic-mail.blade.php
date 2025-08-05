<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{get_static_option('site_title').' '. __('Mail')}}</title>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        *{
            font-family: 'Open Sans', sans-serif;
        }
        .mail-container {
            max-width: 650px;
            margin: 0 auto;
            text-align: center;
            background-color: #f2f2f2;
            padding: 0 0;
        }
        .inner-wrap {
            background-color: #fff;
            margin: 40px;
            padding: 30px 20px;
            text-align: left;
            box-shadow: 0 0 20px 0 rgba(0,0,0,0.01);
        }
        .inner-wrap p {
            font-size: 16px;
            line-height: 26px;
            color: #656565;
            margin: 0;
        }
        .message-wrap {
            background-color: #f2f2f2;
            padding: 30px;
            margin-top: 40px;
        }

        .message-wrap p {
            font-size: 14px;
            line-height: 26px;
        }
        .btn-wrap {
            text-align: center;
        }

        .btn-wrap .anchor-btn {
            background-color: {{get_static_option('site_color')}};
            color: #fff;
            font-size: 14px;
            line-height: 26px;
            font-weight: 500;
            text-transform: capitalize;
            text-decoration: none;
            padding: 8px 20px;
            display: inline-block;
            margin-top: 40px;
            border-radius: 5px;
            transition: all 300ms;
        }

        .btn-wrap .anchor-btn:hover {
            opacity: .8;
        }
        .verify-code{
            background-color:#f2f2f2;
            color:#333;
            padding: 10px 15px;
            border-radius: 3px;
            display: inline-block;
            margin: 20px;
        }
        table {
            margin: 0 auto;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }

        table td, table th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        table tr:nth-child(even){background-color: #f2f2f2;}

        table tr:hover {background-color: #ddd;}

        table th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #111d5c;
            color: white;
        }
        .logo-wrapper img{
            max-width: 200px;
        }

        .footer-copyright-wrapper{
            background-color: #17274a;
            padding: 16px 0;
            color: #7f7f7f;
        }

        .footer-copyright-wrapper a{
            color: #5080dd;
            text-decoration: none;
        }

        .footer-body-wrapper{
            overflow: hidden;
        }

        .footer-body-wrapper img{
            width: 273px;
        }

        .footer-body-wrapper table:hover, .footer-body-wrapper table tr:hover, .footer-body-wrapper table td:hover{
            background-color: inherit;
        }

        .footer-body-wrapper table, .footer-body-wrapper table tr, .footer-body-wrapper table td{
            border: none;
        }

        .banner-container img{
            width: 100%;
        }

    </style>
</head>
<body>

<div class="mail-container">
    <!-- <div class="logo-wrapper">
        <a href="{{url('/')}}">
            {!! render_image_markup_by_attachment_id(get_static_option('site_logo')) !!}
        </a>
    </div> -->
    <div class="banner-container">
        <img src="{{asset('assets/static/img/mail_banner.jpg')}}" alt="Mail Banner">
    </div>
    <div class="inner-wrap">
        {!! $data['message'] !!}
    </div>
    <footer>
        <div class="footer-body-wrapper">
           <table>
               <tr>
                   <td style="width: 50%">
                       <a href="">
                           {!! render_image_markup_by_attachment_id(get_static_option('site_logo')) !!}
                       </a>
                   </td>
                   <td style="width: 50%; text-align: left">
                       <span style="color: #858484">Regards</span>
                       <br>
                       <span style="font-size: 24px; color: black">Right Freelancer</span>
                       <br><span style="color: #858484">Your Work Partner</span>
                       <br><span><a href="{{url('/')}}">{{url('/')}}</a></span>
                   </td>
               </tr>
           </table>
        </div>
        <div class="footer-copyright-wrapper">
            Right Freelancer LLC.
            <br>
            <a target="_blank" href="{{url('/')}}">Hire Freelancers for any job, online.</a>
        </div>
    </footer>
</div>

</body>
</html>
