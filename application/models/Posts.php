<?php

class Application_Model_Posts extends Zend_Db_Table_Abstract {

    protected $_name = 'posts';
    protected $_primary = 'id';

    public function getAll() {
        return $this->fetchAll();
    }

    public function save($bind) {
//        echo "<pre>";
//        print_r($bind);
//        echo "</pre>";
        $row = $this->createRow();
//         $row->title = $bind['title'];
//         $row->full_text = $bind['full_text'];
        $row->setFromArray($bind);
        return $row->save();
    }

}
