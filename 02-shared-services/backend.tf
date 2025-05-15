terraform { 
  cloud { 
    
    organization = "VTI-EXV" 

    workspaces { 
      name = "edion-net-02" 
    } 
  } 
}