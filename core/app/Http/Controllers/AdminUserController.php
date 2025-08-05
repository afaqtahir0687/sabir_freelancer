<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Modules\CountryManage\Entities\City;
use Modules\CountryManage\Entities\State;
use Modules\Service\Entities\SubCategory;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
class AdminUserController extends Controller
{
    // get state
    public function createBankAccountsTable()
    {
        if (!Schema::hasTable('bank_accounts')) {
            Schema::create('bank_accounts', function (Blueprint $table) {
                $table->id();
                $table->foreignId('user_id')->constrained()->onDelete('cascade');
                $table->foreignId('country_id')->nullable()->constrained()->onDelete('set null');
                $table->string('account_title');
                $table->string('bank_name');
                $table->string('iban_number')->nullable();
                $table->string('account_number')->nullable();
                $table->string('swis_code')->nullable();
                $table->timestamps();
            });

            return "bank_accounts table created successfully.";
        }

        return "Table already exists.";
    }
    public function get_country_state(Request $request)
    {
        $states = State::where('country_id', $request->country)->where('status', 1)->get();
        return response()->json([
            'status' => 'success',
            'states' => $states,
        ]);
    }

    // get city
    public function get_state_city(Request $request)
    {
        $cities = City::where('state_id', $request->state)->where('status', 1)->get();
        return response()->json([
            'status' => 'success',
            'cities' => $cities,
        ]);
    }

    // get subcategory
    public function get_subcategory(Request $request)
    {
        $subcategories = SubCategory::where('category_id', $request->category)->where('status', 1)->get();
        return response()->json([
            'status' => 'success',
            'subcategories' => $subcategories,
        ]);
    }


}
