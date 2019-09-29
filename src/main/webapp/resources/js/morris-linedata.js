$(function() {
  // Area Chart
    Morris.Area({
        element: 'morris-area-chart',
        data: [{
            period: '2017 Q1',
            Passed : 120,
            Failed : 100,
            Aborted : 50
        }, {
            period: '2017 Q2',
            Passed : 200,
            Failed : 50,
            Aborted : 10
           
        }, {
            period: '2017 Q3',
            Passed : 10,
            Failed :2,
            Aborted : 3
          
        }, {
            period: '2017 Q4',
            Passed : null,
            Failed : null,
            Aborted : null
           
       
        }],
        xkey: 'period',
        ykeys: ['Passed', 'Failed', 'Aborted'],
        labels: ['Passed', 'Failed', 'Aborted'],
        pointSize: 2,
        hideHover: 'auto',
        resize: true
    }); 
    });
