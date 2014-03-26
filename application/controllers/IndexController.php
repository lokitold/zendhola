<?php

class IndexController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }
    public function indexAction()
    {
        
    }
    public function blankpageAction()
    {
        
    }
    public function bootstrapelementsAction()
    {
        
    } 
    public function bootstrapgridAction()
    {
        
    }
    public function chartsAction()
    {
        
    }
    public function formsAction()
    {
        
    }
     public function tablesAction()
    {
        
    }
     public function typographyAction()
    {
        
    }
    public function formvisorAction()
    {
     //echo $this->baseUrl('public/images/mifoto.jpg');   
        $this->_helper->layout->disableLayout();
    }
    public function testAction()
    {
        $this->_helper->layout->disableLayout();
    }
    


}

