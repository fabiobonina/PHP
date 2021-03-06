<?php
require_once '_crud.php';

class Fabricantes extends Crud{
	
	protected $table = 'tb_fabricante';
	private $oat;
	private $descricao;
	private $ativo;

	public function setOat($oat){
		$this->oat = $oat;
	}
	public function setDescricao($descricao){
		$this->descricao = $descricao;
	}
	public function getDescricao(){
		return $this->descricao;
	}
	public function setAtivo($ativo){
		$this->ativo = $ativo;
	}

	public function insert(){
		try{
		$sql  = "INSERT INTO $this->table (oat, descricao) ";
		$sql .= "VALUES (:oat, :descricao)";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(':oat',$this->oat);
		$stmt->bindParam(':descricao',$this->descricao);

		$stmt->execute();

			$res['error'] = false;
			$res['message'] = "OK, processo da OS alterado com sucesso";
		} catch(PDOException $e) {
			echo 'ERROR: ' . $e->getMessage();
		}

	}

	public function update($id){
		try{

		$sql  = "UPDATE $this->table SET oat = :oat, descricao = :descricao  WHERE id = :id ";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(':oat',$this->oat);
		$stmt->bindParam(':descricao', $this->descricao);
		$stmt->bindParam(':id', $id);
		$stmt->execute();

			$res['error'] = false;
			$res['message'] = "OK, processo da OS alterado com sucesso";
		} catch(PDOException $e) {
			echo 'ERROR: ' . $e->getMessage();
		}
		
	}

	public function findDesc($Cod){
		try{
		$sql  = "SELECT * FROM $this->table WHERE id = :id";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(':id', $Cod, PDO::PARAM_INT);
		$stmt->execute();
		return $stmt->fetch();
		} catch(PDOException $e) {
			echo 'ERROR: ' . $e->getMessage();
		}
	}

}