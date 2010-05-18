<%@include file="./_taglibs.jsp" %>
<div class="hierarchyContainer">

<h2>Story hierarchy</h2>

<div class="storyTreeContainer">
  <div class="tree">
    <ul>
      <aef:storyTreeNode node="${topmostStory}" forceOpen="true"/>
    </ul>
  </div>
</div>

<h2>Backlog hierarchy</h2>

<c:set var="backlog" value="${story.backlog}"/>

<ul>
<c:choose>
  <c:when test="${aef:isIteration(backlog)}">
    <li style="list-style-image: url('static/img/hierarchy_arrow.png');">
    <a href="editBacklog.action?backlogId=${backlog.parent.parent.id}">
      <c:out value="${backlog.parent.parent.name}" />
    </a>
    </li>
    
    <li style="margin-left: 1em; list-style-image: url('static/img/hierarchy_arrow.png');">
    <a href="editBacklog.action?backlogId=${backlog.parent.id}">
      <c:out value="${backlog.parent.name}" />
    </a>
    </li> 
    
    <li style="margin-left: 2em; list-style-image: url('static/img/hierarchy_arrow.png');">
      <a href="editBacklog.action?backlogId=${backlog.id}">
        <c:out value="${backlog.name}" />
      </a>
    </li>
  </c:when>
  
  <c:when test="${aef:isProject(backlog)}">   
    <li style="list-style-image: url('static/img/hierarchy_arrow.png');">
    <a href="editBacklog.action?backlogId=${backlog.parent.id}">
      <c:out value="${backlog.parent.name}" />
    </a>
    </li> 
    
    <li style="margin-left: 1em; list-style-image: url('static/img/hierarchy_arrow.png');">
      <a href="editBacklog.action?backlogId=${backlog.id}">
        <c:out value="${backlog.name}" />
      </a>
    </li>
  </c:when>
  
  <c:when test="${aef:isProduct(backlog)}">
    <li style="list-style-image: url('static/img/hierarchy_arrow.png');">
      <a href="editBacklog.action?backlogId=${backlog.id}">
        <c:out value="${backlog.name}" />
      </a>
    </li>
  </c:when>
</c:choose>
</ul>

</div>