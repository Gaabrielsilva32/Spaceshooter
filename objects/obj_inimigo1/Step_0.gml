//função atirar
atirar();


//se a não estou em uma seq
//(a seq acabou)
//e a minha instancia estava na seq
if (!in_sequence && na_sequencia)
{
	instance_destroy();
}

//contador ef mola
fim_ef_mola(0.3)