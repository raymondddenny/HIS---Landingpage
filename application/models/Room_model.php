<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Room_model extends CI_Model
{
    public function getBedRoom()
    {
        $query = "SELECT `bed`.*, `room`.`room_grade`
                  FROM `bed` JOIN `room` 
                  ON `bed`.`room_id` = `room`.`room_id`
                  ";
        return $this->db->query($query)->result_array();
    }


    public function updateBed($data)
    {
        $this->db->where('bed_id', $this->input->post('inpatient_id'));
        $query = $this->db->update('bed', $data);
    }
}
