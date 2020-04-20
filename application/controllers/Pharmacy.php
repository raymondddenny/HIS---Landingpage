<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Pharmacy extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        check_login();
    }

    public function reqlist()
    {
        $data['title'] = "Request List";
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

        $data['report_type'] = $this->db->get('report_list')->result_array();

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('pharmacy/reqlist', $data);
        $this->load->view('templates/footer');
    }

    public function reqreports()
    {
        $data['title'] = "Inventory Report";
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();

        $data['report_type'] = $this->db->get('report_list')->result_array();

        $this->form_validation->set_rules('report', 'Report', 'required');

        if ($this->form_validation->run() == false) {
            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('pharmacy/reqreports', $data);
            $this->load->view('templates/footer');
        } else {
            $data = [
                'date_issued' => time(),
                'report_type' => htmlspecialchars($this->input->post('report_type', true)),
                'drug_name' => htmlspecialchars($this->input->post('drug_name', true)),
                'drug_qty' => htmlspecialchars($this->input->post('qty', true)),
                'issued_to' => htmlspecialchars($this->input->post('issuedTo', true)),
                'issued_by' => htmlspecialchars($this->input->post('issuedBy', true)),
                'note' => htmlspecialchars($this->input->post('note', true))
            ];
            $this->db->insert('report_list', ['pharmacy' => $this->input->post('pharmacy')]);
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"> Menu added succesfully! </div>');
            redirect('pharmacy');
        }
    }
}
