<?php
require_once '_crud.php';

try {
class CilTipo extends Crud{
	

	
	protected $table = 'tb_cil_capacidade';
	private $cliente;
	private $localida;
	private $plaqueta;

	public function setCliente($cliente){
		$this->cliente = $cliente;
	}
	public function setLocalidade($localidade){
		$this->localidade = $localidade;
	}
	public function setPlaqueta($plaqueta){
		$plaqueta = iconv('UTF-8', 'ASCII//TRANSLIT', $plaqueta);
		$this->plaqueta = strtoupper ($plaqueta);
	}
	public function getPlaqueta(){
		return $this->plaqueta;
	}
	public function setData($data){
		$this->data = $data;
	}


	public function insert(){
		try{
		$sql  = "INSERT INTO $this->table (cliente, localidade, plaqueta, data) ";
		$sql .= "VALUES (:cliente, :localidade, :plaqueta, :data)";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(':cliente',$this->cliente);
		$stmt->bindParam(':localidade',$this->localidade);
		$stmt->bindParam(':plaqueta',$this->plaqueta);
		$stmt->bindParam(':data',$this->data);

		$stmt->execute();

			$res['error'] = false;
			$res['message'] = "OK, processo da OS alterado com sucesso";
		} catch(PDOException $e) {
			echo 'ERROR: ' . $e->getMessage();
		}

	}

	public function update($id){
		try{
		$sql  = "UPDATE $this->table SET cliente = :cliente, localidade = :localidade, plaqueta = :plaqueta, data = :data WHERE id = :id ";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(':cliente',$this->cliente);
		$stmt->bindParam(':localidade', $this->localidade);
		$stmt->bindParam(':plaqueta',$this->plaqueta);
		$stmt->bindParam(':data',$this->data);
		$stmt->bindParam(':id', $id);
		$stmt->execute();

			$res['error'] = false;
			$res['message'] = "OK, processo da OS alterado com sucesso";
		} catch(PDOException $e) {
			echo 'ERROR: ' . $e->getMessage();
		}
		
	}

	public function findCapacidade($capacidade){
		try{
		$sql  = "SELECT * FROM $this->table WHERE capacidade = :capacidade";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(':capacidade', $capacidade);
		$stmt->execute();
		return $stmt->fetch();
		} catch(PDOException $e) {
			echo 'ERROR: ' . $e->getMessage();
		}
	}


	


}
}catch( Exception $e ) {

    echo $e->getMessage();
    return false;

}