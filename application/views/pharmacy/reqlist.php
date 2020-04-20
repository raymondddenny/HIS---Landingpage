<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="row mb-5">
        <div class="col d-sm-flex align-items-center justify-content-between">
            <h1 class="h3 mb-0 text-gray-800 "><?= $title; ?></h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
        </div>
    </div>

    <!-- // ! start coding the content here -->

    <div class="row">
        <div class="col-lg">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Date</th>
                        <th scope="col">Report Type</th>
                        <th scope="col">Drug Name</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Issued To</th>
                        <th scope="col">Issued By</th>
                        <th scope="col">Note</th>
                        <!-- <th scope="col">Action</th> -->
                    </tr>
                </thead>
                <tbody>
                    <?php $i = 1; ?>
                    <?php foreach ($report_type as $p) : ?>
                        <tr>
                            <th scope="row"><?= $i; ?></th>
                            <td><?= date('d F Y', $p['date_issued']) ?></td>
                            <td><?= $p['report_type']; ?></td>
                            <td><?= $p['drug_name']; ?></td>
                            <td><?= $p['drug_qty']; ?></td>
                            <td><?= $p['issued_to']; ?></td>
                            <td><?= $p['issued_by']; ?></td>
                            <td><?= $p['note']; ?></td>

                        </tr>
                        <?php $i++; ?>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>



</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->