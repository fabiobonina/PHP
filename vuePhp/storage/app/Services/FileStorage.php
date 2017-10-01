<?php

namespace  App\Services;

use App\Core\Model;
use App\Core\Storage;
use App\Interfaces\iStorage;

class FileStorage extends Storage implements iStorage{


    /**
     * @return \App\Core\ApiResponse
     */
    public function index()
    {
        $this->getAllData();

        return $this->returnSuccessResponse($this->data);
    }

    public function save($create = false)
    {
        if($create){
            $this->setCreateFields();
            $this->runCreateCalcFunctions();
        } else{
            $this->setUpdateFields();
        }

        $json = json_encode($this->model);
        file_put_contents($this->getModelFolder().$this->model->ID.'.json',$json);
        return $this->returnSuccessResponse($this->model);
    }

    public function find()
    {
        $file = $this->getModelFolder().$this->model->ID.'.json';


        if(file_exists($file)){
            $data =  $this->returnObject($file);

            return $this->returnSuccessResponse($data);
        }

        return $this->returnNotFoundResponse();

    }

    public function delete()
    {
        $file = $this->getModelFolder().$this->model->ID.'.json';
        $current_file_obj = $this->returnObject($file);

        if($current_file_obj->hash != $this->model->hash){
            return $this->returnUnauthorizedDelete();
        }

        if(file_exists($file)){
            unlink($file);
            return $this->returnSuccessResponse($current_file_obj);
        }

        return $this->returnNotFoundResponse();
    }

    private function getModelFolder(){
        return STORE_DATA.strtolower($this->model->getModelName()).DS;
    }

    private function openFile($file){
        return file_get_contents($file);
    }

    private function mapData($decode_data){

        $model = $this->getInstanceOfNewModel();

        foreach ($this->properties as $property){
            $model->{$property} = isset($decode_data[$property]) ? $decode_data[$property] : null;
        }

        return $model;
    }

    public function getAllData(){
        $files = glob($this->getModelFolder().'*.json');

        foreach($files as $file){
            $mapped_data = $this->returnObject($file);
            $this->data[$mapped_data->ID] = $mapped_data;
        }

        return $this->data;
    }

    private function returnObject($file): Model
    {
        $read_file = $this->openFile($file);
        $decode_data = (array)json_decode($read_file);
        $mapped_data = $this->mapData($decode_data);
        return $mapped_data;
    }

    public function getNextAvailableID(){
        $allData = $this->getAllData();
        if(empty($allData)) return 1;
       return (max(array_keys($allData)))+1;

    }

    public function runCreateCalcFunctions()
    {
        $this->model->ID            = $this->getNextAvailableID();
        $this->model->getCreateFunction($this->getAllData());
    }


}