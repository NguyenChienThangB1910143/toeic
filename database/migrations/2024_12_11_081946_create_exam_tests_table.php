<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
{
    Schema::create('exam_tests', function (Blueprint $table) {
        $table->id();
        $table->foreignId('exam_id')->constrained('exams')->onDelete('cascade');
        $table->integer('part1_test_id')->nullable();
        $table->integer('part2_test_id')->nullable();
        $table->integer('part3_test_id')->nullable();
        $table->integer('part4_test_id')->nullable();
        $table->integer('part5_test_id')->nullable();
        $table->integer('part6_test_id')->nullable();
        $table->integer('part7_test_id')->nullable();
        $table->timestamps();
    });
}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('exam_tests');
    }
};
