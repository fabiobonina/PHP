<?php
require_once '_crud.php';

class Tipos extends Crud{
	
	protected $table = 'tb_tipo';
	private $cod;
	private $descricao;
	private $ativo;

	public function setCod($cod){
		$cod = iconv('UTF-8', 'ASCII//TRANSLIT', $cod);
		$this->cod = strtoupper ($cod);
	}
	public function setDescricao($descricao){
		$descricao = iconv('UTF-8', 'ASCII//TRANSLIT', $descricao);
		$this->descricao = strtoupper ($descricao);
	}
	public function getDescricao(){
		return $this->descricao;
	}
	public function setAtivo($ativo){
		$this->ativo = $ativo;
	}

	public function insert(){
		try{
		$sql  = "INSERT INTO $this->table (id, descricao, ativo) ";
		$sql .= "VALUES (:id, :descricao, :ativo)";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(':id',$this->cod);
		$stmt->bindParam(':descricao',$this->descricao);
		$stmt->bindParam(':ativo',$this->ativo);

		return $stmt->execute();
		} catch(PDOException $e) {
			echo 'ERROR: ' . $e->getMessage();
		}

	}

	public function update($id){
		try{
		$sql  = "UPDATE $this->table SET descricao = :descricao, ativo = :ativo WHERE id = :id ";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(':descricao', $this->descricao);
		$stmt->bindParam(':ativo',$this->ativo);
		$stmt->bindParam(':id', $id);
		return $stmt->execute();
		} catch(PDOException $e) {
			echo 'ERROR: ' . $e->getMessage();
		}
		
	}


}