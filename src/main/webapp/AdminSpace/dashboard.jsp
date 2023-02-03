    <div class="container-fluid position-relative d-flex p-0">
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar navbar-dark">
                <a href="#" class="navbar-brand mx-4 mb-3">
                    <h3><i class="fa-sharp fa-solid fa-store"></i>UrPet</h3>
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
                        <a id="petsL" href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa-sharp fa-solid fa-cat"></i>Animaux</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a id="allPets" href="Pets" class="dropdown-item">Liste</a>
                            <a id="addPet" href="Pets?action=addForm" class="dropdown-item">Ajouter</a>
                        </div>
                    </div>
                
                    <a id="clients" href="Login?action=clients" class="nav-item nav-link"><i class="fa-solid fa-users"></i>Clients</a>
                    <a id="allRes" href="Reserv?action=showResAdmin" class="nav-item nav-link"><i class="fa-solid fa-cart-shopping"></i>Réservations</a>
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
					 			<input  class="dropdown-item" type="submit" value="Se déconnecter">
				 			</form>
                        </div>
                    </div>
                </div>
            </nav>