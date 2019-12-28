<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCartHistoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cart_histories', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->dateTime('date');

            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('courier_id');

            $table->foreign('user_id')->references('id')->on('users')->onUpdate('cascade');
            $table->foreign('courier_id')->references('id')->on('couriers')->onUpdate('cascade');
            $table->integer('total_price');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cart_histories');
    }
}
