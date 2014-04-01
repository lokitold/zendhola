<?php
class PostsController extends Zend_Controller_Action {
    public function listarAction(){
        $model = new Application_Model_Posts();
        $this->view->posts = $model->getAll();
    }
    public function agregarAction(){
        $form =new Application_Form_Post();
        $this->view->form = $form;
        if($this->getRequest()->isPost()){
            echo "<pre>";
            print_r($this->_getAllParams());
            echo "</pre>";
            if($form->valid($this->_getAllParams())){
                echo "El formulario es valido";
            }
            else{
                echo "El formulario no es valido";
            } 
                
        	
        }
    }
     public function testexpAction(){
        
        $url = 'http://e.elcomercio.pe/elcomercio/impresa/ima/2013/05/19/AP/ECAP19051324.jpg';
        /////
        $parse_url=parse_url($url);
        $path=trim($parse_url['path'],'/');
        echo "<pre>";
        print_r($path);
        echo "</pre>";
        $path = explode('/', $url);
        echo $domain=$path[0];
        echo "<br>";
        echo $date=$path[3]."-".$path[4]."-".$path[5];
        echo "<br>";
        echo $section=$path[6];
        echo "<br>";
        
        exit();
    }

}

