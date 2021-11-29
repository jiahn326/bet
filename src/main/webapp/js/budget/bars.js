/* ------------------------------------------------------------------------------
 *
 *  # Echarts - Stacked clustered bar example
 *
 *  Demo JS code for stacked clustered bar chart [light theme]
 *
 * ---------------------------------------------------------------------------- */


// Setup module
// ------------------------------

var EchartsBarsStackedClusteredLight = function() {
    console.log('BARS_STACKED_CLUSTERED.JS FILE OPEN')


    //
    // Setup module components
    //

    // Stacked clustered bar chart
    var _barsStackedClusteredLightExample = function() {
        if (typeof echarts == 'undefined') {
            console.warn('Warning - echarts.min.js is not loaded.');
            return;
        }

        // Define element
        var bars_clustered_element = document.getElementById('bars_stacked_clustered');


        //
        // Charts configuration
        //

        if (bars_clustered_element) {

            // Initialize chart
            var bars_clustered = echarts.init(bars_clustered_element);


            //
            // Chart config
            //

            // Options
            bars_clustered.setOption({

                // Global text styles
                textStyle: {
                    fontFamily: 'Roboto, Arial, Verdana, sans-serif',
                    fontSize: 13
                },

                // Chart animation duration
                animationDuration: 750,

                // Setup grid
                grid: {
                    left: 0,
                    right: 5,
                    top: 55,
                    bottom: 0,
                    containLabel: true
                },

                // Add legend
                legend: {
                    data: [
                        'Wants Goal','Needs Goal','Savings Goal','',
                        'Wants Status','Needs Status','SavingsStatus'
                    ],
                    itemHeight: 2,
                    itemGap: 8,
                    textStyle: {
                        padding: [0, 10]
                    }
                },

                // Add tooltip
                tooltip: {
                    trigger: 'axis',
                    backgroundColor: 'rgba(0,0,0,0.75)',
                    padding: [10, 15],
                    textStyle: {
                        fontSize: 13,
                        fontFamily: 'Roboto, sans-serif'
                    },
                    axisPointer: {
                        type: 'shadow',
                        shadowStyle: {
                            color: 'rgba(0,0,0,0.025)'
                        }
                    }
                },

                // Horizontal axis
                xAxis: [{
                    type: 'value',
                    axisLabel: {
                        color: '#333',
                        formatter: '$ {value}'
                    },
                    axisLine: {
                        lineStyle: {
                            color: '#999'
                        }
                    },
                    splitLine: {
                        lineStyle: {
                            color: '#eee',
                            type: 'dashed'
                        }
                    }
                }],

                // Vertical axis
                yAxis: [
                    {
                        type: 'category',
                        data: ['Category'],
                        axisLabel: {
                            color: '#333'
                        },
                        axisLine: {
                            lineStyle: {
                                color: '#999'
                            }
                        },
                        splitLine: {
                            show: true,
                            lineStyle: {
                                color: '#eee'
                            }
                        },
                        splitArea: {
                            show: true,
                            areaStyle: {
                                color: ['rgba(250,250,250,0.1)', 'rgba(0,0,0,0.015)']
                            }
                        }
                    },
                    {
                        type: 'category',
                        axisLine: {show:false},
                        axisTick: {show:false},
                        axisLabel: {show:false},
                        splitArea: {show:false},
                        splitLine: {show:false},
                        data: ['Category']
                    }
                ],

                // Add series
                series: [
                    {
                        name: 'Wants Status',
                        type: 'bar',
                        z: 2,
                        yAxisIndex: 1,
                        itemStyle: {
                            normal: {
                                color: '#F44336',
                                label: {
                                    show: true,
                                    padding: 5,
                                    position: 'right',
                                    textStyle: {
                                        color: '#fff',
                                        fontSize: 11
                                    }
                                }
                            }
                        },
                        data: [5000]
                    },
                    {
                        name: 'Needs Status',
                        type: 'bar',
                        z: 2,
                        yAxisIndex: 1,
                        itemStyle: {
                            normal: {
                                color: '#4CAF50',
                                label: {
                                    show: true,
                                    padding: 5,
                                    position: 'right',
                                    textStyle: {
                                        color: '#fff',
                                        fontSize: 11
                                    }
                                }
                            }
                        },
                        data: [3000]
                    },
                    {
                        name: 'Savings Status',
                        type: 'bar',
                        z: 2,
                        yAxisIndex: 1,
                        itemStyle: {
                            normal: {
                                color: '#2196F3',
                                label: {
                                    show: true,
                                    padding: 5,
                                    position: 'right',
                                    textStyle: {
                                        color: '#fff',
                                        fontSize: 11
                                    }
                                }
                            }
                        },
                        data: [2000]
                    },
                    {
                        name: 'Wants Goal',
                        type: 'bar',
                        z: 1,
                        itemStyle: {
                            normal: {
                                color: '#E57373',
                                label: {
                                    show: true,
                                    padding: 5,
                                    position: 'right',
                                    textStyle: {
                                        fontSize: 11
                                    }
                                }
                            }
                        },
                        data: [10000]
                    },
                    {
                        name: 'Needs Goal',
                        type: 'bar',
                        z: 1,
                        itemStyle: {
                            normal: {
                                color: '#81C784',
                                label: {
                                    show: true,
                                    padding: 5,
                                    position: 'right',
                                    textStyle: {
                                        fontSize: 11
                                    }
                                }
                            }
                        },
                        data: [5000]
                    },
                    {
                        name: 'Savings Goal',
                        type: 'bar',
                        z: 1,
                        itemStyle: {
                            normal: {
                                color: '#64B5F6',
                                label: {
                                    show: true,
                                    padding: 5,
                                    position: 'right',
                                    textStyle: {
                                        fontSize: 11
                                    }
                                }
                            }
                        },
                        data: [5000]
                    }
                ]
            });
        }


        //
        // Resize charts
        //

        // Resize function
        var triggerChartResize = function() {
            bars_clustered_element && bars_clustered.resize();
        };

        // On sidebar width change
        var sidebarToggle = document.querySelector('.sidebar-control');
        sidebarToggle && sidebarToggle.addEventListener('click', triggerChartResize);

        // On window resize
        var resizeCharts;
        window.addEventListener('resize', function() {
            clearTimeout(resizeCharts);
            resizeCharts = setTimeout(function () {
                triggerChartResize();
            }, 200);
        });
    };


    //
    // Return objects assigned to module
    //

    return {
        init: function() {
            _barsStackedClusteredLightExample();
        }
    }
}();


// Initialize module
// ------------------------------

document.addEventListener('DOMContentLoaded', function() {
    EchartsBarsStackedClusteredLight.init();
});
