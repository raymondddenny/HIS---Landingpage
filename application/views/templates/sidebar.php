<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon">
            <i class="fas fa-user-md"></i>
        </div>
        <div class="sidebar-brand-text mx-3">MedicGo </div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Administrator
    </div>

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
        <a class="nav-link" href="<?= base_url('admin') ?>">
            <i class="fas fa-fw fa-user-cog"></i>
            <span>Dashboard</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Menu
    </div>

    <!-- Nav Item - Patient Menu-->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMenu1" aria-expanded="true" aria-controls="collapseMenu1">
            <i class="fas fa-fw fa-user-injured"></i>
            <span>Patient</span>
        </a>
        <div id="collapseMenu1" class="collapse" aria-labelledby="headingMenu1" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="text-wrap collapse-item" href="newpatientform.html">Add New Patient</a>
                <a class="text-wrap collapse-item" href="viewpatientlist.html">View Patient List</a>

            </div>
        </div>
    </li>

    <!-- Nav Item - Doctor Menu-->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMenu2" aria-expanded="true" aria-controls="collapseMenu1">
            <i class="fas fa-fw fa-user-nurse"></i>
            <span>Doctors</span>
        </a>
        <div id="collapseMenu2" class="collapse" aria-labelledby="headingMenu1" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="text-wrap collapse-item" href="viewdoctor.html">All doctor</a>
                <a class="text-wrap collapse-item" href="#">Doctor profile</a>
            </div>
        </div>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Profile
    </div>

    <!-- Nav Item - Charts -->
    <li class="nav-item">
        <a class="nav-link" href=" ">
            <i class="fas fa-fw fa-user"></i>
            <span>Edit Profile</span></a>
    </li>

    <!-- Nav Item - Tables -->
    <li class="nav-item">
        <a class="nav-link" href="<?= base_url('auth/logout') ?>">
            <i class="fas fa-fw fa-sign-out-alt"></i>
            <span>Logout</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>
<!-- End of Sidebar -->