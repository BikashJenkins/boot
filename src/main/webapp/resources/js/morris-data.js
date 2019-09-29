// Morris.js Charts sample data for SB Admin template

$(function() {
  // Area Chart
   /* Morris.Area({
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
    }); */

    // Donut Chart
    Morris.Donut({
        element: 'morris-donut-chart',
        data: [{
            label: "Passed",
            value: 12
        }, {
            label: "Failed",
            value: 30
        }, {
            label: "Aborted",
            value: 20
        },
        {
            label: "Aborted",
            value: 20
        },
        {
            label: "Aborted",
            value: 20
        },
        {
            label: "Aborted",
            value: 20
        },
        {
            label: "Aborted",
            value: 20
        },
        {
            label: "Aborted",
            value: 20
        },
        
        
        ],
        resize: true
    });

   

    // Bar Chart
    Morris.Bar({
        element: 'morris-bar-chart',
        data: [{
            device: 'Dell-Samsung',
            geekbench: 136
        }, {
            device: 'Sony-Seagate',
            geekbench: 137
        }, {
            device: 'Transcend',
            geekbench: 275
        }, {
            device: 'Samsung',
            geekbench: 380
       
        }],
        xkey: 'device',
        ykeys: ['geekbench'],
        labels: ['Geekbench'],
        barRatio: 0.4,
        xLabelAngle: 35,
        hideHover: 'auto',
        resize: true
    });


});
