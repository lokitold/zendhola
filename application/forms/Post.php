<?php

class Application_Form_Post extends Zend_Form {

    public function init() {
        $this->addElement(
                'text', 'title', array(
            'label' => 'Titulo',
            'required' => true,
            'class' => 'form-control',
            'placeholder' => "Titulo"
                )
        );
        $this->addElement(
                'textarea', 'full_text', array(
            'label' => 'Contenido',
            'class' => 'form-control',
            'placeholder' => 'Contenido del post'
                )
        );
        $this->addElement(
                'submit', 'Guardar', array(
            'class' => 'btn btn-default'
                )
        );
    }

}
