// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: ["2021.06", "2021.07", "2021.08", "2021.09", "2021.10", "2021.11", "2021.12","2022.01", "2022.02", "2022.03", "2022.04", "2022.05", "2022.09"],
    datasets: [{
      label: "판매수익",
      lineTension: 0.3,
      backgroundColor: "#F3E7D5",
      borderColor: "#F1BB70",
      pointRadius: 5,
      pointBackgroundColor: "#EDAA4D",
      pointBorderColor: "#EDAA4D",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "#FB9404",
      pointHitRadius: 50,
      pointBorderWidth: 2,
      data: [765000, 1240000, 3150000, 2900800, 3012000, 4653000, 3568000, 4525000, 3123000, 4825000, 6215200, 5231000, 2756000],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 10000000,
          maxTicksLimit: 5
        },
        gridLines: {
          color: "rgba(0, 0, 0, .125)",
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
