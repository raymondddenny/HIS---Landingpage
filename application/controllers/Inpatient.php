<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Inpatient extends CI_Controller
{
    public function index()
    {
        $data['title'] = "View Inpatient";
        // get user session
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
        $data['inpatient'] = $this->db->get('inpatient')->result_array();

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('inpatient/index', $data);
        $this->load->view('templates/footer');
    }

    public function room()
    {
        $data['title'] = "Rooms";
        // get user session
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
        // $data['bed'] = $this->db->get('bed')->result_array();
        $this->load->model('Room_model', 'room');
        $data['beds'] = $this->room->getBedRoom();

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('inpatient/room', $data);
        $this->load->view('templates/footer');
    }

    public function deletePatient($bed_id)
    {
        // $data['bed'] = $this->db->get_where('bed', ['bed_id' => $bed_id])->row_array();
        $this->db->where('bed_id', $bed_id);
        $data = [
            'bed_availability' => '1',
            'inpatient_id' => '0'
        ];
        $this->db->update('bed', $data);
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"> Patient delete sucessfully! </div>');
        redirect('inpatient/room');
    }

    public function view($patientMedicalRecord_id)
    {

        $data['title'] = "Inpatient EMR";
        // get user session
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
        //get menu by patient medical record id
        $data['inpatient'] = $this->db->get_where('inpatient', ['patientMedicalRecord_id' => $patientMedicalRecord_id])->row_array();
        $data['treatment'] = $this->db->get_where('inpatient_treatment', ['patientMedicalRecord_id' => $patientMedicalRecord_id])->row_array();
        $data['patient'] = $this->db->get_where('patient', ['patientMedicalRecord_id' => $patientMedicalRecord_id])->row_array();
        // $data['doctor'] = $this->db->get_where('doctor');
        $data['treat'] = $this->db->get_where('inpatient_treatment', ['patientMedicalRecord_id' => $patientMedicalRecord_id])->result_array();

        $this->load->model('Doctor_model', 'doctor');

        $data['doctor'] = $this->doctor->getDoctor();


        $this->load->model('Room_model', 'room');
        $data['beds'] = $this->room->getBedRoom();

        $this->load->model('Nurse_model', 'nurse');
        $data['nurse'] = $this->nurse->getNurse();

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('inpatient/view', $data);
        $this->load->view('templates/footer');
    }

    public function lab_pic($lab_pic)
    {
    }

    public function edit($patientMedicalRecord_id)
    {
        $data['title'] = "Edit EMR";
        // get user session
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
        //get menu by patient medical record id
        $data['inpatient'] = $this->db->get_where('inpatient', ['patientMedicalRecord_id' => $patientMedicalRecord_id])->row_array();
        $data['treatment'] = $this->db->get_where('inpatient_treatment', ['patientMedicalRecord_id' => $patientMedicalRecord_id])->row_array();
        $data['patient'] = $this->db->get_where('patient', ['patientMedicalRecord_id' => $patientMedicalRecord_id])->row_array();
        $data['nurse_id'] = $this->db->get('nurse')->result_array();
        $data['room'] = $this->db->get_where('room', ['room_id' => $patientMedicalRecord_id . 'room_id'])->result_array();

        $this->load->model('Room_model', 'bed');
        $data['beds'] = $this->bed->getBedroom();


        $this->form_validation->set_rules('patientMedicalRecord_id', 'parientMedicalRecord_id', 'required');

        if ($this->form_validation->run() == false) {
            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('inpatient/edit', $data);
            $this->load->view('templates/footer');
        } else {
            // if there is a picture upload

            $upload_image = $_FILES['lab_pic']['name'];

            if ($upload_image) {
                $config['allowed_types'] = 'jpg|png';
                $config['max_size']     = '2048';
                $config['upload_path'] = './assets/img/labresult';

                $this->load->library('upload', $config);
                if ($this->upload->do_upload('lab_pic')) {
                    $new_img = $this->upload->data('file_name');
                    $this->db->set('lab_pic', $new_img);
                } else {
                    $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">' . $this->upload->display_errors() . '</div>');
                }
            }
            $data = [
                'date_out' => $this->input->post('date_out'),
                'bed_id' => $this->input->post('bed_id'),
                'nurse_id' => $this->input->post('nurse_id'),
                'inpatient_status' => $this->input->post('inpatient_status'),
                'payment_total' => $this->input->post('payment_total'),
                'payment_status' => $this->input->post('payment_status'),
                'room_grade' => $this->input->post('room_grade')
            ];

            $treatment = [

                'patientMedicalRecord_id' => $this->input->post('patientMedicalRecord_id'),
                'diagnose' => $this->input->post('diagnose'),
                'lab_schedule' => $this->input->post('lab_schedule'),
                'lab_pic' => $this->input->post('lab_pic'),
                'lab_result' => $this->input->post('lab_result'),
                'visit_schedule' => $this->input->post('visit_schedule'),
                'prescription' => $this->input->post('prescription'),
                'date_added' => time()
            ];

            $this->db->where('patientMedicalRecord_id', $patientMedicalRecord_id);
            $this->db->update('inpatient', $data);
            $this->db->insert('inpatient_treatment', $treatment);

            $this->db->where('bed_id', 'bed_id');
            $update = [
                'bed_availability' => '2',
                'inpatient_id' => $this->input->post('inpatient_id')
            ];
            $this->db->update('bed', $update);

            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"> EMR has been updated!</div>');
            redirect('inpatient/view/' . $patientMedicalRecord_id);
        }
    }
}
