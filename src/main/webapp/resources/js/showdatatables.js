var editor; // use a global for the submit and return data rendering in the examples
 
$(document).ready(function() {
    editor = new $.fn.dataTable.Editor( {
       
        table: '#example',
        fields: [ {
                label: 'First name:',
                name:  'first_name'
            }, {
                label: 'Last name:',
                name:  'last_name'
            }, {
                label: 'Email:',
                name:  'email',
                
            }, {
                label: 'Roleid:',
                name:  'roleid',
                type:  'datetime',
               
            },{
                label: 'Username:',
                name:  'username'
            },{
                label: 'ContactNo:',
                name:  'contactno'
            },{
                label: 'Date of Birth:',
                name:  'dob',
                 def:   function () { return new Date(); }
            },{
                label: 'Qualification:',
                name:  'qualification'
            },{
                label: 'Gender:',
                name:  'gender'
            },{
                label: 'AddressLine1:',
                name:  'addr1'
            },{
                label: 'City:',
                name:  'city'
            },{
                label: 'District:',
                name:  'district'
            },{
                label: 'State:',
                name:  'state'
            },{
                label: 'Country:',
                name:  'country'
            },{
                label: 'Pincode:',
                name:  'pincode'
            },{
                label: 'Bank Name:',
                name:  'bankname'
            },{
                label: 'Bank Account Number:',
                name:  ''
            },{
                label: 'IFSC Code:',
                name:  'ifsccode'
            },{
                label: 'Aadhar Number:',
                name:  'aadharnumber'
            },{
                label: 'Pancard Number:',
                name:  'pannumber'
            },{
                label: 'Votercard Number:',
                name:  'voternumber'
            },{
                label: 'Referral Code:',
                name:  'referralcode'
            },{
                label: 'Latitude:',
                name:  'latitude'
            },{
                label: 'Longitude:',
                name:  'longitude'
            },{
                label: 'isActivated',
                name:  'isActivated'
            }
        ]
    } );
 
    $('#example').DataTable( {
        dom: 'Bfrtip',
      
        columns: [
            { data: 'isActivated' }
            
        ],
        select: true,
        buttons: [
            { extend: 'create', editor: editor },
            { extend: 'edit',   editor: editor },
            { extend: 'remove', editor: editor }
        ]
    } );
} );