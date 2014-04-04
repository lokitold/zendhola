<?php

class Application_Form_Post extends Zend_Form {

    public function init() {
        $this->addElement(
                'text', 'title', array(
            'label' => 'Titulo',
            'required' => true
                )
        );
        $this->addElement(
                'textarea', 'full_text', array(
            'label' => 'Contenido'
                )
        );
        $this->addElement(
                'submit', 'Guardar', array()
        );
    }

}
