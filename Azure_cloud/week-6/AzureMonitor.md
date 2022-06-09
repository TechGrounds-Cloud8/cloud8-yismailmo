# Azure Monitor

Helps you understand how your applications are performing and proactively identify issues affecting them and the resources they depend on. In order to maximize the availability and performance of a company's applications and services.


### Key terminologies

- Metric

Metrics are numerical data that define properties like CPU usage, memory usage, network usage, etc. These are real-time measurements stored in intervals.

![metrics](../../00_includes/AZMonitor-metrics.png)



- Logs;

Events, performance data, traces, etc. related to specific applications are stored in Azure Monitor logs.

![Logs](../../00_includes/AZMonitorLogs.png)

Log data collected by Azure Monitor can be analyzed with queries to quickly retrieve, consolidate, and analyze collected data.

Azure Monitor uses a version of the Kusto query language (suitable for simple log queries).



### How do you use Monitor and what information does it collect?

1. Experiences, Visualize, Analyze, Response and Integration;

A good monitoring service should also be able to respond to critical situations. Azure Monitor can analyze, visualize and also send alerts.

![azmonitor](../../00_includes/AZMonitorusecase.svg)


It collects the following information:

- Data about the performance and functionality of the code you have written.

- Guest OS monitoring data. 

- Azure resource monitoring data.

- Azure subscription monitoring data and also data about the health and operation of Azure itself.

- Azure tenant monitoring data: Data about the Azure Active Directory.

- Data about changes within your Azure resource and how to address it.



In the Azure Load Balancer (ALB) & Auto Scaling assignment I also used the Azure Monitor to see the metrics of the CPU ussage of my instances.

![Azuremonitorcpu](../../00_includes/AZ11-loadtest02.png)




# Sources

https://docs.microsoft.com/en-au/azure/azure-monitor/overview

https://intellipaat.com/blog/what-is-azure-monitor/
