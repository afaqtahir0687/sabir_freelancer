<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('ads', function (Blueprint $table) {
            $table->unsignedBigInteger('user_id')->after('id');
            $table->float('ppq', 6, 4)->after('quantity')->comment('Price per quantity');
            $table->string('gateway_slug')->nullable()->after('ppq');
            $table->string('gateway_trx_id')->nullable()->after('gateway_slug');
            $table->string('status')->default('pending')->after('gateway_trx_id');

            $table->index('user_id');
            $table->index(['is_paid', 'status']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {

    }
};
