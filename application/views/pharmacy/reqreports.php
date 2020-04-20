<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="row mb-5">
        <div class="col d-sm-flex align-items-center justify-content-between">
            <h1 class="h3 mb-0 text-gray-800 "><?= $title; ?></h1>
        </div>
    </div>

    <!-- // ! start coding the content here -->


    <div class="row">
        <div class="col-lg-12">

            <a href="" class="btn btn-primary mb-3" data-toggle="modal" data-target="#newReportModal">Add New Report</a>
            <?php if (validation_errors()) : ?>
                <div class="alert alert-danger" role="alert">
                    <?= validation_errors() ?>
                </div>
            <?php endif; ?>

            <?= $this->session->flashdata('message'); ?>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">

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

<!-- Modal -->
<div class="modal fade" id="newReportModal" tabindex="-1" role="dialog" aria-labelledby="newReportModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newReportModalLabel">Add New Report</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<?= base_url('pharmacy/reqreports'); ?>" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <input class="form-control" type="date" value="2011-08-19" id="date_issued" name="Date_issued" placeholder="Date Issued">
                    </div>
                    <div class="form-group">
                        <select name="report_type" id="report_type" class="form-control">
                            <option value="">Report Type</option>
                            <?php foreach ($report_type as $p) : ?>
                                <option value="<? $p['id'] ?>"><?= $p['report_type'] ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <select name="drug_name" id="drug_name" class="form-control">
                            <option value="">Drug Name</option>
                            <?php foreach ($report_type as $p) : ?>
                                <option value="<? $p['id'] ?>"><?= $p['drug_name'] ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="drug_qty" name="Drug_ty" placeholder="Quantity">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="issued_to" name="Issued_to" placeholder="Issued To">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="issued_by" name="Issued_by" placeholder="Issued By">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="note" name="Note" placeholder="Note">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Add Report</button>
                </div>
            </form>
        </div>
    </div>
</div>