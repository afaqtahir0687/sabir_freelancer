<script>
    //accept and pay
    $(document).on('click','.accept_and_pay',function(e){
        e.preventDefault();
        Swal.fire({
            title: '{{__("End Contract ?")}}',
            text: '{{__("If you end the contract freelancer will get the current work duration amount and you will not be able to change it.")}}',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: "{{__('Yes, end it!')}}"
        }).then((result) => {
            if (result.isConfirmed) {
                $(this).next().find('.swal_form_submit_btn').trigger('click');
            }
        });
    });
</script>