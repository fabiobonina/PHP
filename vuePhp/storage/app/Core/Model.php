<?php

namespace App\Core;

use App\Traits\toJson;

abstract class Model{

    use toJson;

    public $ID;

    public $created_at;

    public $updated_at;

    public $hash; //for security when updating records

    /**
     * @return array
     */
    abstract public function get_validation();

    abstract public function getRequiredFields();

    /**
     * Runs another set of method on create, need to pass through all the data from storage to see current data
     * @param  array $allData
     * @return void
     */
    abstract public function getCreateFunction(array $allData);

    abstract public function getUpdateFunction();

    /**
     * @return string
     */
    abstract public function getModelName();

    public function properties(){
        return array_keys(get_object_vars($this));
    }
}