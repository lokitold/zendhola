<?php
class PostsController extends Zend_Controller_Action {
    
    public function listarAction(){
        $model = new Application_Model_Posts();
        $posts = $model->getAll();
        Zend_View_Helper_PaginationControl::setDefaultViewPartial('paginator/items.phtml');
        $paginator=Zend_Paginator::factory($posts);
        if($this->_hasParam('page')){
            $paginator->setCurrentPageNumber($this->_getParam('page'));
        }
        
        $this->view->paginator=$paginator;
    }
    
    public function agregarAction(){
        $form =new Application_Form_Post();
        $form->setAttrib('id', 'login');
        $form->setAttrib('class', 'form-horizontal');
        $form->setAttrib('role', 'form');
        $this->view->form = $form;
        if($this->getRequest()->isPost()){
            if($form->isvalid($this->_getAllParams())){
                $model = new Application_Model_Posts();
                $model->save($form->getValues());
                return $this->_redirect('/posts/listar');
            }
        }
    }
    
    public function updateAction(){
        if(!$this->_hasParam('id')){
            return $this->_redirect('/posts/listar'); 
        }
        
        $form =new Application_Form_Post();
        $posts = new Application_Model_Posts();
        
        $form->setAttrib('id', 'login');
        $form->setAttrib('class', 'form-horizontal');
        $form->setAttrib('role', 'form');
        
        
        if($this->getRequest()->isPost()){
            if($form->isvalid($this->_getAllParams())){
                $model = new Application_Model_Posts();
                $model->save($form->getValues(),$this->_getParam('id'));
                return $this->_redirect('/posts/listar');
            }
        }else{
            $row = $posts->getRow($this->_getParam('id'));
            if($row){
                $form->populate($row->toArray());
            }
        }
        
        $this->view->form = $form;
    }
    public function deleteAction(){
        if(!$this->_hasParam('id')){
            return $this->_redirect('/posts/listar'); 
        }
        $model = new Application_Model_Posts();
        $row = $model->getRow($this->_getParam('id'));
        if($row){
                $row->delete();
            }
        return $this->_redirect('/posts/listar'); 
    }
     

}

