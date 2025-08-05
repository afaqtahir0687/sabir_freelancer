<?php

namespace Modules\Wallet\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class BankAccount extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'country_id',
        'account_title',
        'bank_name',
        'iban_number',
        'account_number',
        'swis_code',
    ];

    public function user()
    {
        return $this->belongsTo(\App\Models\User::class);
    }

    public function country()
    {
        return $this->belongsTo(\Modules\CountryManage\Entities\Country::class);
    }
}
