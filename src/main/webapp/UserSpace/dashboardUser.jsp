    <div class="container-fluid position-relative d-flex p-0">
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar navbar-dark">
                <a href="#" class="navbar-brand mx-4 mb-3">
                    <h3><i class="fa-sharp fa-solid fa-store"></i>PetStore</h3>
                </a>
				<a href="Login?action=profile" class="nav-item nav-link">
                <div class="user-account">
                    <i class="fa-solid fa-user"></i>
                    <div class="user">
                        <h6><%= session.getAttribute("loginU")%></h6>
                        <span class="type-user"><%= session.getAttribute("typeU")%></span>
                    </div>
                </div>
                </a>
                <div class="navbar-nav w-100">
                   <div class="nav-item dropdown">
                        <a id="res" href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa-solid fa-cart-shopping"></i>R�servation</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a id="allRes" href="Reserv?action=showRes&cin=<%= session.getAttribute("cinU")%>" class="dropdown-item">Mes r�servations</a>
                            <a id="addRes" href="Pets?action=searchPet" class="dropdown-item">Faire une r�servation</a>
                        </div>
                    </div>
                    <a href="Login?action=out" class="nav-item nav-link"><i class="fa-sharp fa-solid fa-arrow-right-from-bracket"></i>Log out</a>
                    
                </div>
            </nav>

        </div>
        <div class="content">
            <nav class="navbar navbar-expand  sticky-top px-4 py-2" id="supNav">
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa-sharp fa-solid fa-bars"></i>
                </a>

                <div class="navbar-nav align-items-center ms-auto">
                    <div class="nav-item dropdown">
                            <a href="#" style="text-decoration: none; color:#E3FFFB;" class="user-accountNav dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fa-solid fa-user"></i>
                                <div class="user">
                                    <h6><%= session.getAttribute("loginU")%></h6>
                                </div>
                            </a>
                        <div class="dropdown-menu dropdown-menu-end  bg-transparent border-0 rounded-0 rounded-bottom m-0" >
                            <a href="Login?action=profile" class="dropdown-item">Mon profile</a>
                            
                            <form action="Login?action=out" method="post">
					 			<input  class="dropdown-item" type="submit" value="Se d�connecter">
				 			</form>
                        </div>
                    </div>
                </div>
            </nav>