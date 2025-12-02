/// Created using the page template: Default
Class GlobalMonitor.Page.Chart Extends %ZEN.Component.page [ Language = objectscript ]
{

/// The class name of the application to which this page belongs.
Parameter APPLICATION;

/// The name of the displayed page.
Parameter PAGENAME = "Chart";

/// Domain used for localization.
Parameter DOMAIN;

Property DBNAME [ InitialExpression = "ENSLIB" ];

/// This style block contains page specific CSS style definitions.
XData Style
{
<style type="text/css">

</style>
}

/// This XML block defines the content of this page
XData Contents [ XMLNamespace = "http://www.intersystems.com/zen" ]
{
<page xmlns="http://www.intersystems.com/zen" title="Global Data Monitoring Dashboard">
	<html id="description"  OnDrawContent="DrawContent"/>
</page>
}

Method GlobalName(Name As %String = "") As %String [ ZenMethod ]
{
  Set arr=##class(GlobalMonitor.Operations.GlobalInfo).GlobalName(Name)

	
	Quit arr.%ToJSON()
}

Method chatinfo(dataType As %String = "", dataSubtype As %String = "", startTime As %String = "", endTime As %String = "") As %String [ ZenMethod ]
{
	Set obj=##class(GlobalMonitor.Operations.GlobalInfo).GetChartByDBandName(dataType, dataSubtype, startTime, endTime)
	
	Quit obj.%ToJSON()
}

Method DrawContent(pSeed As %String) As %Status
{
	

	Set ObjectString = ##class(GlobalMonitor.Operations.GlobalInfo).DBName().%ToJSON()

	
	&html<
  <!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <script src="../user/chart.js"></script>
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2ecc71;
            --accent-color: #e74c3c;
            --background-color: #f8f9fa;
            --card-bg: #ffffff;
            --text-color: #2c3e50;
            --border-color: #e0e0e0;
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
            color: var(--text-color);
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            background: var(--card-bg);
            padding: 30px;
            border-radius: 20px;
            box-shadow: var(--shadow);
            backdrop-filter: blur(10px);
        }

        .header {
            text-align: center;
            margin-bottom: 40px;
            padding-bottom: 20px;
            border-bottom: 2px solid var(--border-color);
        }

        .header h1 {
            color: var(--primary-color);
            font-size: 2.5em;
            margin-bottom: 10px;
            background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .header p {
            color: #7f8c8d;
            font-size: 1.1em;
        }

        .controls {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin-bottom: 40px;
            padding: 25px;
            background: var(--background-color);
            border-radius: 15px;
            border: 1px solid var(--border-color);
        }

        .control-group {
            display: flex;
            flex-direction: column;
        }

        .control-group label {
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--text-color);
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .control-group label i {
            color: var(--primary-color);
        }

        select, input {
            padding: 12px 15px;
            border: 2px solid var(--border-color);
            border-radius: 10px;
            font-size: 14px;
            transition: all 0.3s ease;
            background: white;
        }

        select:focus, input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
        }

        select:disabled {
            background-color: #f8f9fa;
            color: #6c757d;
        }

        .time-range {
            display: flex;
            gap: 15px;
            align-items: end;
        }

        .time-input {
            flex: 1;
        }

        .chart-container {
            position: relative;
            height: 600px;
            width: 100%;
            background: white;
            border-radius: 15px;
            padding: 20px;
            box-shadow: var(--shadow);
            border: 1px solid var(--border-color);
        }

        .loading {
            text-align: center;
            padding: 40px;
            color: #666;
            font-size: 1.1em;
        }

        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: var(--shadow);
        }

        .stat-card h3 {
            font-size: 0.9em;
            opacity: 0.9;
            margin-bottom: 10px;
        }

        .stat-card .value {
            font-size: 2em;
            font-weight: bold;
        }

        .btn {
            padding: 12px 25px;
            background: var(--primary-color);
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 600;
        }

        .btn:hover {
            background: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(52, 152, 219, 0.3);
        }

        @media (max-width: 768px) {
            .controls {
                grid-template-columns: 1fr;
            }
            
            .time-range {
                flex-direction: column;
            }
            
            .chart-container {
                height: 400px;
            }
            
            .header h1 {
                font-size: 2em;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Global Data Monitoring Dashboard</h1>
            
        </div>
        
        <div class="stats">
            <div class="stat-card">
                <h3>Databases</h3>
                <div class="value" id="currentDataType">-</div>
            </div>
            <div class="stat-card">
                <h3>Number of Global</h3>
                <div class="value" id="subtypeCount">0</div>
            </div>
            <div class="stat-card">
                <h3>Number of Data Points</h3>
                <div class="value" id="dataPointCount">0</div>
            </div>
            <div class="stat-card">
                <h3>Refresh Time</h3>
                <div class="value" id="lastUpdate">-</div>
            </div>
        </div>
        
        <div class="controls">
            <div class="control-group">
                <label for="dataType">Databases :</label>
                <select id="dataType">
                    <option value="">Please select the database</option>
                </select>
            </div>
            
            <div class="control-group">
                <label for="dataSubtype">Global :</label>
                <select id="dataSubtype" disabled>
                    <option value="">Please select the Global</option>
                </select>
            </div>
            
            <div class="control-group time-range">
                <div class="time-input">
                    <label for="startTime">Start Time :</label>
                    <input type="datetime-local" id="startTime">
                </div>
                <div class="time-input">
                    <label for="endTime"> End Time :</label>
                    <input type="datetime-local" id="endTime">
                </div>
                <button class="btn" id="refreshBtn">Refresh</button>
            </div>
        </div>
        
        <div class="chart-container">
            <canvas id="lineChart"></canvas>
        </div>
    </div>

    <script type="text/javascript">
        
        class DataService {
            
            static async getDataTypes() {
                return new Promise(resolve => {
                    setTimeout(() => {
	                		var ObjectString='#(ObjectString)#'
	        				var arr =JSON.parse(ObjectString)
	        				console.log(arr)
							resolve(arr);
                    }, 300);
                });
            }

            
            static async getDataSubtypes(dataType) {
							console.log(dataType)
                return new Promise(resolve => {
                    setTimeout(() => {
	                   
	                    	var ArrString = zenPage.GlobalName(dataType)
	                    	
							var subtypes =JSON.parse(ArrString)
							console.log(subtypes)
                        resolve(subtypes);
                    }, 200);
                });
            }

            // Get line chart data
            static async getChartData(dataType, dataSubtype, startTime, endTime) {
	            
	            console.log(dataType)
	            console.log(dataSubtype)
	            console.log(startTime)
	            console.log(endTime)
                return new Promise(resolve => {
                    setTimeout(() => {
	                    if (dataSubtype=='all') { dataSubtype=""}
	                    console.log(dataSubtype)

	                    var objString = zenPage.chatinfo(dataType, dataSubtype, startTime, endTime)
	                    console.log(objString)
                        const baseData =JSON.parse(objString)


                        
                        const subtypeMapping = {
                        };

                        if (dataSubtype && dataSubtype !== 'all') {
                            const targetName = subtypeMapping[dataSubtype];
                            if (targetName) {
                                const subtypeIndex = baseData.Y.findIndex(item => 
                                    item[0].Name === targetName
                                );
                                if (subtypeIndex !== -1) {
                                    resolve({
                                        X: baseData.X,
                                        Y: [baseData.Y[subtypeIndex]]
                                    });
                                    return;
                                }
                            }
                        }

                        resolve(baseData);
                    }, 500);
                });
            }
        }

        class AppState {
            constructor() {
                this.dataType = '';
                this.dataSubtype = 'all';
                this.startTime = '';
                this.endTime = '';
                this.chart = null;
                this.allData = null;
            }

            updateDataType(type) {
                this.dataType = type;
                document.getElementById('currentDataType').textContent = type || '-';
                this.updateSubtypes();
            }

            updateDataSubtype(subtype) {
                this.dataSubtype = subtype;
                this.updateChart();
            }

            updateTimeRange(startTime, endTime) {
                this.startTime = startTime;
                this.endTime = endTime;
                this.updateChart();
            }

            async updateSubtypes() {
                const subtypeSelect = document.getElementById('dataSubtype');
                subtypeSelect.disabled = true;
                subtypeSelect.innerHTML = '<option value="">Loading...</option>';

                try {
                    const subtypes = await DataService.getDataSubtypes(this.dataType);
                    subtypeSelect.innerHTML = '<option value="all">top 10</option>';
                    subtypes.forEach(subtype => {
                        const option = document.createElement('option');
                        option.value = subtype;
                        option.textContent = subtype;
                        subtypeSelect.appendChild(option);
                    });
                    subtypeSelect.disabled = false;
                    
                    // Default selection Show all 
                    subtypeSelect.value = 'all';
                    this.dataSubtype = 'all';
                    document.getElementById('subtypeCount').textContent = subtypes.length;
                    this.updateChart();
                } catch (error) {
                    subtypeSelect.innerHTML = '<option value="">Loading failed</option>';
                    console.error('Failed to get Global:', error);
                }
            }

            async updateChart() {
                const canvas = document.getElementById('lineChart');
                const ctx = canvas.getContext('2d');

                // Clear existing chart
                if (this.chart) {
                    this.chart.destroy();
                }

                // Show loading status
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                ctx.fillStyle = '#f0f0f0';
                ctx.fillRect(0, 0, canvas.width, canvas.height);
                ctx.fillStyle = '#666';
                ctx.font = '16px Arial';
                ctx.textAlign = 'center';
                ctx.fillText('Loading data...', canvas.width / 2, canvas.height / 2);

                try {
                    const chartData = await DataService.getChartData(
                        this.dataType, 
                        this.dataSubtype,
                        this.startTime, 
                        this.endTime
                    );

                    this.allData = chartData;
                    this.renderChart(chartData);
                    this.updateStats(chartData);
                } catch (error) {
                    console.error('Failed to load chart data:', error);
                    ctx.fillText('Data loading failed, please try again', canvas.width / 2, canvas.height / 2);
                }
            }

            renderChart(chartData) {
                const canvas = document.getElementById('lineChart');
                const ctx = canvas.getContext('2d');
                
                const colors = [
                    'rgb(75, 192, 192)',
                    'rgb(255, 99, 132)',
                    'rgb(255, 159, 64)',
                    'rgb(255, 205, 86)',
                    'rgb(54, 162, 235)',
                    'rgb(153, 102, 255)',
                    'rgb(201, 203, 207)'
                ];

                const datasets = chartData.Y.map((subtypeData, index) => {
                    const color = colors[index % colors.length];
                    return {
                        label: subtypeData[0].Name,
                        data: subtypeData.map(item => item.UseSize),
                        borderColor: color,
                        backgroundColor: color.replace('rgb', 'rgba').replace(')', ', 0.1)'),
                        borderWidth: 2,
                        fill: true,
                        tension: 0.1
                    };
                });

                this.chart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: chartData.X,
                        datasets: datasets
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        scales: {
                            x: {
                                title: {
                                    display: true,
                                    text: 'time',
                                    color: '#666',
                                    font: {
                                        size: 14,
                                        weight: 'bold'
                                    }
                                },
                                ticks: {
                                    maxTicksLimit: 6,
                                    color: '#666',
                                    callback: function(value) {
                                        return chartData.X[value].split(' ')[1];
                                    }
                                },
                                grid: {
                                    color: 'rgba(0,0,0,0.1)'
                                }
                            },
                            y: {
                                title: {
                                    display: true,
                                    text: 'UseSize',
                                    color: '#666',
                                    font: {
                                        size: 14,
                                        weight: 'bold'
                                    }
                                },
                                beginAtZero: true,
                                ticks: {
                                    color: '#666'
                                },
                                grid: {
                                    color: 'rgba(0,0,0,0.1)'
                                }
                            }
                        },
                        plugins: {
                            legend: {
                                position: 'top',
                                labels: {
                                    color: '#666',
                                    font: {
                                        size: 12
                                    }
                                }
                            },
                            tooltip: {
                                mode: 'index',
                                intersect: false,
                                backgroundColor: 'rgba(0,0,0,0.8)',
                                titleColor: '#fff',
                                bodyColor: '#fff',
                                callbacks: {
                                    label: function(context) {
                                        return `${context.dataset.label}: ${context.parsed.y}`;
                                    }
                                }
                            }
                        },
                        interaction: {
                            mode: 'nearest',
                            axis: 'x',
                            intersect: false
                        },
                        animations: {
                            tension: {
                                duration: 1000,
                                easing: 'linear'
                            }
                        }
                    }
                });
            }

            updateStats(chartData) {
                document.getElementById('dataPointCount').textContent = 
                    chartData.X.length * chartData.Y.length;
                document.getElementById('lastUpdate').textContent = 
                    new Date().toLocaleTimeString();
            }
        }

        document.addEventListener('DOMContentLoaded', async function() {
            const appState = new AppState();
            
            // Set default time range (last 24 hours)
            const endTime = new Date();
            const startTime = new Date(endTime);
            startTime.setHours(startTime.getHours() - 24);
            
            document.getElementById('startTime').value = startTime.toISOString().slice(0, 16);
            document.getElementById('endTime').value = endTime.toISOString().slice(0, 16);

            // Initialize data type dropdown
            try {
                const dataTypes = await DataService.getDataTypes();
                const dataTypeSelect = document.getElementById('dataType');
                
                dataTypes.forEach(type => {
                    const option = document.createElement('option');
                    option.value = type;
                    option.textContent = type;
                    dataTypeSelect.appendChild(option);
                });

//                // Default to selecting the first data type
//                if (dataTypes.length > 0) {
//                    dataTypeSelect.value = dataTypes[0];
//                    appState.updateDataType(dataTypes[0]);
//                }
            } catch (error) {
                console.error('Failed to initialize data type:', error);
            }

            // Bind event listener
            document.getElementById('dataType').addEventListener('change', function(e) {
                appState.updateDataType(e.target.value);
            });

            document.getElementById('dataSubtype').addEventListener('change', function(e) {
                appState.updateDataSubtype(e.target.value);
            });

            document.getElementById('refreshBtn').addEventListener('click', function() {
                const startTime = document.getElementById('startTime').value;
                const endTime = document.getElementById('endTime').value;
                appState.updateTimeRange(startTime, endTime);
            });

            // Add a change event to the time picker
            document.getElementById('startTime').addEventListener('change', function() {
                const startTime = document.getElementById('startTime').value;
                const endTime = document.getElementById('endTime').value;
                appState.updateTimeRange(startTime, endTime);
            });

            document.getElementById('endTime').addEventListener('change', function() {
                const startTime = document.getElementById('startTime').value;
                const endTime = document.getElementById('endTime').value;
                appState.updateTimeRange(startTime, endTime);
            });

            // Initial chart loading
            appState.updateTimeRange(
                document.getElementById('startTime').value,
                document.getElementById('endTime').value
            );
        });
    </script>
</body>
</html>


	>
	Quit $$$OK
}

}
