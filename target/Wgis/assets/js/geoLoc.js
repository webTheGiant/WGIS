  
var geolocation = new ol.Geolocation({
        projection: view.getProjection()
      });

      function el(id) {
        return document.getElementById(id);
      }

      el('track').addEventListener('change', function() {
        geolocation.setTracking(this.checked);

      });
      
      map.on('moveend', function(){ 
    	  
    	  el('resolution').innerText = view.getResolution()+ ' [px]';
    	  
      });
      
     

      geolocation.on('change', function() {
        el('accuracy').innerText = geolocation.getAccuracy() + ' [m]';
        el('altitude').innerText = geolocation.getAltitude() + ' [m]';
        el('altitudeAccuracy').innerText = geolocation.getAltitudeAccuracy() + ' [m]';
        el('heading').innerText = geolocation.getHeading() + ' [rad]';
        el('speed').innerText = geolocation.getSpeed() + ' [m/s]';
        
      });


      // handle geolocation error.
      geolocation.on('error', function(error) {
        var info = document.getElementById('info');
        info.innerHTML = error.message;
        info.style.display = '';
      });

      var accuracyFeature = new ol.Feature();
      geolocation.on('change:accuracyGeometry', function() {
        accuracyFeature.setGeometry(geolocation.getAccuracyGeometry());
      });


       //indicatore della posizione sulla mappa
      var positionFeature = new ol.Feature();
      positionFeature.setStyle(new ol.style.Style({
        image: new ol.style.Circle({
          radius: 6,
          fill: new ol.style.Fill({
            color: '#3399CC'
          }),
          stroke: new ol.style.Stroke({
            color: '#fff',
            width: 2
          })
        })
      }));

      geolocation.on('change:position', function() {
        var coordinates = geolocation.getPosition();
        positionFeature.setGeometry(coordinates ?
            new ol.geom.Point(coordinates) : null);
      });

    var pos= new ol.layer.Vector({
        map: map,
        source: new ol.source.Vector({
        features: [accuracyFeature, positionFeature]
        })
      });

    $('#track').click(function(){

          if(el('track').checked)
            pos.setVisible(true)
          else
            pos.setVisible(false)
      });

    
    



