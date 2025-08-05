new Morris.Area({
    element: 'chart2',
    data: [
      {period: '2010 Q1', likes: 2666, share: null, comments: 2647},
      {period: '2010 Q2', likes: 2778, share: 2294, comments: 2441},
      {period: '2010 Q3', likes: 4912, share: 1969, comments: 2501},
      {period: '2010 Q4', likes: 3767, share: 3597, comments: 5689},
      {period: '2011 Q1', likes: 6810, share: 1914, comments: 2293},
      {period: '2011 Q2', likes: 5670, share: 4293, comments: 1881},
      {period: '2011 Q3', likes: 4820, share: 3795, comments: 1588},
      {period: '2011 Q4', likes: 15073, share: 5967, comments: 5175},
      {period: '2012 Q1', likes: 10687, share: 4460, comments: 2028},
      {period: '2012 Q2', likes: 8432, share: 5713, comments: 1791}
    ],
    xkey: 'period',
    ykeys: ['likes', 'share', 'comments'],
    labels: ['Likes', 'Share', 'Comments'],
    pointSize: 2,
    hideHover: 'auto',
    resize: true
  });
  
new Morris.Donut({
    element: 'chart3',
    data: [
      {label: 'Jam', value: 25 },
      {label: 'Frosted', value: 40 },
      {label: 'Custard', value: 25 },
      {label: 'Sugar', value: 10 }
    ],
    formatter: function (y) { return y + "%" }
  });
  
new Morris.Bar({
    element: 'chart4',
    data: [
      {device: 'Option 1', geekbench: 136},
      {device: 'Option 2', geekbench: 137},
      {device: 'Option 3', geekbench: 275},
      {device: 'Option 4', geekbench: 380},
      {device: 'Option 6', geekbench: 655},
      {device: 'Option 7', geekbench: 1571}
    ],
    xkey: 'device',
    ykeys: ['geekbench'],
    labels: ['Geekbench'],
    barRatio: 0.4,
    xLabelAngle: 35,
    hideHover: 'auto',
    resize: true
  });