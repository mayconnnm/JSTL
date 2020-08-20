<%@page import="br.com.caelum.produtos.modelo.Produto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		function removeProduto(id){
			$("#mensagem").load('<c:url value="/produto/remove"/>' + '?produto.id=' + id);
			$("#produto" + id).remove();
		}
	</script>

	<h1>Produtos</h1>
	<h2><fmt:message key="mensagem.bemVindo"/> </h2>
	<div id="mensagem"></div>
	<table width="100%">
		<tr>
			<td width="20%">Nome</td>
			<td>Preco</td>
			<td>Descricao</td>
			<td>Data de Inicio da Venda</td>
			<td>Usado?</td>
			<td width="20%">Remover?</td>
		</tr>
		
		<!-- Define uma variável -->
		<%-- <c:set var="nome" value="Maycon" /> --%>
		
		<!-- Imprime o conteúdo da variável -->
		<%-- <c:out value="${nome}" /> --%>
		
		<!-- varStatus informa em que número está a iteração -->
		<c:forEach var="p" items="${produtoList}" varStatus="st"> 
			<tr id="produto${p.id}">
				<%-- <td>${st.count}</td> --%>
				
				<!-- Em Expression Language podemos invocar métodos dos objetos que estamos manipulando -->
				<td>${p.nome.toUpperCase()}</td>
				
				<!-- Formatando o número utilizando o type, ele possui um padrão pré definido, currency é do tipo dinheiro -->
				<td><fmt:formatNumber value="${p.preco}" type="currency"/></td>
				<td>${p.descricao}</td>
				
				<!-- Formatando a data utilizando o pattern, nele é preciso definir um padrão -->
				<td><fmt:formatDate value="${p.dataInicioVenda.time}" pattern="EEEE, dd' de 'MMMM' de 'yyyy"/></td>
				
				<c:if test="${p.usado}">
				<td>Sim</td>
				</c:if>
				
				<!-- Pode ser usado assim também -->
				
				<%-- <c:if test="${!p.usado}"> --%>
				<c:if test="${not p.usado}">
				<td>Não</td>
				</c:if>	
				
				<!-- O if em JSTL não possui o "else", porém, o "choose" funcioma 
				como o switch no java e dentro de choose possui o "otherwise" -->
				
				<!-- Switch "choose", Case "When", Default "otherwise"-->
				
				<!-- <c:choose> 
					<c:when test="${p.usado}">
						<td>Sim</td>
					</c:when>
					<c:otherwise>
						<td>Não</td>
					</c:otherwise>
				</c:choose>	-->
					
				<td><a href="#" onclick="return removeProduto(${p.id})">Remover</a></td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- Utilizando o c:url podemos aproveitar o "context root", ou seja, 
	a primeira parte do url, a raíz onde a aplicação começa a responder  -->
	
	<!-- ex: /produtos/produto/formulario, produtos seria o context root -->
	
	<%-- <c:url value="/produto/formulario" var="urlFormulario"></c:url> --%>
	<%-- <a href="${urlFormulario}">Adicionar um produto</a> --%>

	<!-- Caso não queira declarar uma variável para a url, pode usá-la diretamente no href -->
	<%-- <a href="<c:url value="/produto/formulario"></c:url>">Adicionar um produto</a> --%>

	<!-- Utilizando a internacionalização do JSTL -->
	<a href="/produtos/produto/formulario"><fmt:message key="mensagem.novoProduto"/></a>

	<!-- Reutilizando página -->
	<c:import url="../comum/rodape.jsp"></c:import>
</body>
</html>