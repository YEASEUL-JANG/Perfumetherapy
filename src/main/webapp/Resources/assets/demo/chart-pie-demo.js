// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: ["머스크/앰버", "플로럴", "바닐라", "시트러스/그린","우디/베티버","웜스파이시"],
    datasets: [{
      data: [28.8, 23.4, 19.6, 12.2, 10.5, 5.5],
      backgroundColor: ['#EEE4E2', '#F1CCE2', '#F1DBBA', '#C1E1A8','#BA976F','#E5A79C'],
    }],
  },
});
