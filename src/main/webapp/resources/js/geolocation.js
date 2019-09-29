  function GetLocation() {
            var geocoder = new google.maps.Geocoder();
            var address = document.getElementById('autocomplete').value;
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    var latitude = results[0].geometry.location.lat();
                    var longitude = results[0].geometry.location.lng();
                    document.getElementById('latitude').value = latitude;
                    document.getElementById('longitude').value = longitude;
                 
                }
                
            });
        };
            
      
      
