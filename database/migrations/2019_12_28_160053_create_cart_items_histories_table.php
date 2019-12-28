<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCartItemsHistoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cart_items_histories', function (Blueprint $table) {
            $table->bigIncrements('id');

            $table->unsignedBigInteger('cart_history_id');
            $table->unsignedBigInteger('flower_id');

            $table->foreign('cart_history_id')->references('id')->on('cart_histories')->onUpdate('cascade');
            $table->foreign('flower_id')->references('id')->on('flowers')->onUpdate('cascade');
            $table->integer('quantity');

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
        Schema::dropIfExists('cart_items_histories');
    }
}
