package com.Policy.PolicyManagement;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Nominee {

        private String nominee_ID;
        private String nominee_name;
        private String relationship;
        private String purpose_of_changed;
        private double percentage;
    	
        public Nominee(String nominee_name, String relationship, String purpose_of_changed, double percentage)
        {
            this.nominee_ID = "nominee_seq.nextval";
            this.nominee_name = nominee_name;
            this.relationship = relationship;
            this.purpose_of_changed = purpose_of_changed;
            this.percentage = percentage; 
        }
        
        public String getNominee_ID() {
            return nominee_ID;
        }
        
        public String getnominee_name() {
            return nominee_name;
        }
        
        public String getrelationship() {
            return relationship;
        }
        
        public String getpurpose_of_changed() {
            return purpose_of_changed;
        }
        
        public double getpercentage() {
            return percentage;
        }

        public void setnominee_ID(String nominee_name) {
            this.nominee_ID = nominee_name;
         }        
        
        public void setnominee_name(String nominee_name) {
               this.nominee_name = nominee_name;
            }
        
        public void setrelationship(String relationship) {
               this.relationship = relationship;
            }
        
        public void setpurpose_of_changed(String purpose_of_changed) {
               this.purpose_of_changed = purpose_of_changed;
            }
        
        public void setpercentage(double percentage) {
               this.percentage = percentage;
            }
        

      
        
        //number of nominees for polciy
        //get all nominees for policy
        
        
        //insert new Nominee in DB
        //insert new into nominee map
        
        //delete fron nominee map
        //delete from nominee 

}