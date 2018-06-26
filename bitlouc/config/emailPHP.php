<?php
/* Recuperar os Dados do Formulário de Envio*/

/* Extender a classe do phpmailer para envio do email*/
require_once("PHPMailer_/class.phpmailer.php");
class Email {

	public function smtpmailer($para, $de, $nomeDestinatario, $assunto, $corpo) {

		/* Definir Usuário e Senha do Gmail de onde partirá os emails*/
		define('GUSER', 'bit.louc@gmail.com');
		define('GPWD', 'b1tl0uc@');

		global $error;
		$mail = new PHPMailer();
		/* Montando o Email*/
		$mail->IsSMTP(); /* Ativar SMTP*/
		$mail->SMTPDebug = 1; /* Debugar: 1 = erros e mensagens, 2 = mensagens apenas*/
		$mail->Debugoutput = 'html';
		$mail->SMTPAuth = true; /* Autenticação ativada */
		$mail->SMTPSecure = 'ssl'; /* TLS REQUERIDO pelo GMail*/
		$mail->Host = 'smtp.gmail.com'; /* SMTP utilizado*/
		$mail->Port = 465; /* A porta 587 deverá estar aberta em seu servidor*/
		$mail->Username = GUSER;
		$mail->Password = GPWD;
		$mail->SetFrom($de, $nomeDestinatario);
		$mail->Subject = $assunto;
		$mail->Body = $corpo;
		foreach ($para as $user){
			$mail->AddAddress($user['email'] , $user['userNick']);		
		}
		$mail->AddAddress('fabio.bonina@gruposabara.com', 'Fabio Bonina');		
		$mail->AddAddress('alexandre.melo@gruposabara.com', 'Alexandre Melo');
		$mail->AddAddress('ailton.silva@gruposabara.com', 'Ailton Silva');
		$mail->AddAddress('thonpson.carvalho@gruposabara.com', 'Thonpson Carvalho');
		$mail->IsHTML(true);
		
		/* Função Responsável por Enviar o Email*/
		if(!$mail->Send()) {
			//$error = "<font color='red'><b>Mail error: </b></font> houve erros: ".$mail->ErrorInfo."\n";
			return false;
		} else {
			//$error = "<font color='blue'><b>Mensagem enviada com Sucesso!</b></font>";
			return true;
		}
	}
}

?>