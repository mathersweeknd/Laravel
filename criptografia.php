<?php

$senha = "1234";

$hash = password_hash($senha, PASSWORD_DEFAULT);

password_verify($senha, $hash);