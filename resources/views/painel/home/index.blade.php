@extends('painel.templates.template')

@section('content')

	<div class="relatorios">
		<div class="container">
			<ul class="relatorios">
				<li class="col-md-6 text-center">
					<a href="/painel/posts">
						<img src="{{url('assets/painel/img/noticias-acl.png')}}" alt="Estilos" class="img-menu">
						<h1>{{$totalPosts}}</h1>
					</a>
				</li>
				<li class="col-md-6 text-center">
					<a href="">
						<img src="{{url('assets/painel/img/funcao-acl.png')}}" alt="Albuns" class="img-menu">
						<h1>{{$totalRoles}}</h1>
					</a>
				</li>
				<li class="col-md-6 text-center">
					<a href="">
						<img src="{{url('assets/painel/img/permissao-acl.png')}}" alt="Musicas" class="img-menu">
						<h1>{{$totalPermissions}}</h1>
					</a>
				</li>
				<li class="col-md-6 text-center">
					<a href="">
						<img src="{{url('assets/painel/img/perfil-acl.png')}}" alt="Meu Perfil" class="img-menu">
						<h1>{{$totalUsers}}</h1>
					</a>
				</li>
			</ul>
		</div>
	</div><!--Relatorios-->

@endsection