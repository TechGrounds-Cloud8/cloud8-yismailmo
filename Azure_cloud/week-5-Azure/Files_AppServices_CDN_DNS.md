# Files,AppServices,CDN,DNS, Database:

# Study:

1. App Service 

    - What is App Service for?

        Is Platform as a Service (PaaS) that enables you to build and host web apps, mobile back ends, and RESTful APIs in the programming language of your choice without managing infrastructure.

    -   How does App Service fit / replace App Service in a classic setting?

        - Azure app service is different from hosting on your own on-premise server(classic setting). Because with on-premise web hosting, you or your organisation is reponsible for managing pretty much everything (from storage to networking equipment). 

        - While in Azure app service everything else is managed by Azure. You don't have to worry about any of the things like, managing the network or underlying infrastructure.

        - Meet rigorous, enterprise-grade performance, security, and compliance requirements by using the fully managed platform for your operational and monitoring tasks.

        - Cloud Services(classic) is now deprecated for new customers and will retire on August 31st, 2024 for all customers. Cloud Services (extended support) with Azure Resource Manager is the recommended replacement.


    -   How can I combine App Service with other services?

        - Authenticate users with Azure Active Directory or any of the external authentication providers like Google, Facebook, Twitter, or Microsoft.

        - Also host a custom Windows or Linux container in App Service. So, if you want to, you can dockerize your app and host it in App Service. You can also run multi-container apps with Docker Compose.

        - With App Service you can still access data on your on-premise servers using Hybrid Connections and Azure Virtual Networks.


    -    What is the difference between App Service and other similar services?

            - Elastic beanstalk; Quickly deploy and manage applications in the AWS cloud. According to reviewers(g2.com), they found that AWS Elastic Beanstalk was easier to use and do business with overall. However, reviewers preferred the ease of set up with Azure App Service, along with administration.

            - Google App engine; Build web applications on the same scalable systems that power Google applications. When assessing the two solutions, reviewers found Azure App Service easier to use and set up. However, Google App Engine is easier to administer. Reviewers felt that Azure App Service meets the needs of their business better than Google App Engine.

            - Heroku;  Heroku is a service that enables companies to spend their time developing and deploying apps. When assessing the two solutions, reviewers found Salesforce Heroku easier to use, administer, and do business with overall. However, reviewers preferred the ease of set up with Azure App Service.

2. Content Delivery Network (CDN) 

    - What is CDN ?

        - It puts stuff like blobs and other static content in a cache(increase the speed of cloud services). The process involves placing the data at strategically chosen locations and caching it. As a result, it provides maximum bandwidth for its delivery to users. 

        - 
            

        How does CDN / replace CDN in a classic setting?

        -   

        How can I combine CDN with other services?


        -   

        What is the difference between CDN and other similar services?

        -   

3. Azure DNS 

    -   What is Azure DNS for?


        -   

    -   How does Azure DNS / replace Azure DNS in a classic setting?

        -   

    -   How can I combine Azure DNS with other services?

        -   

    -   What is the difference between Azure DNS and other similar services?

        -   




# Task:

1. Azure Files / EFS(AWS)

        Where can I find this service in the console?


        How do I enable this service?


        How can I link this service to other resources?


2. Azure Database (+ managed instance) / RDS, Aurora(AWS)

        Where can I find this service in the console?


        How do I enable this service?


        How can I link this service to other resources?


 # Sources
     

 https://www.pragimtech.com/blog/azure/what-is-azure-app-service/

 https://www.g2.com/compare/aws-elastic-beanstalk-vs-azure-app-service

 https://www.g2.com/compare/azure-app-service-vs-google-app-engine-vs-salesforce-heroku

 https://www.heroku.com/what#:~:text=Heroku%20is%20part%20of%20the,enables%20full%2Dcycle%20CRM%20engagement

 https://www.g2.com/compare/azure-app-service-vs-salesforce-heroku


 https://docs.microsoft.com/en-us/azure/cdn/

https://www.tutorialspoint.com/microsoft_azure/microsoft_azure_cdn.htm








  https://docs.microsoft.com/en-us/azure/storage/files/storage-files-introduction#why-azure-files-is-useful  