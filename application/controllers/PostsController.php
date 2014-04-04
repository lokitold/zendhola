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
            if($form->isvalid($this->_getAllParams())){
                $model = new Application_Model_Posts();
                $model->save($form->getValues());
                return $this->_redirect('/posts/listar');
            }
        }
    }
     

}

