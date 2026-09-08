# Amazon GuardDuty

## Overview

Amazon GuardDuty is a threat detection service that continuously monitors your AWS accounts, workloads, and data for malicious activity. With GuardDuty, you can use machine learning, anomaly detection, and integrated threat intelligence to identify unexpected and potentially unauthorized activity with in your AWS environment.
GuardDuty uses threat intelligence feeds, such as lists of malicious IP addresses and domains, file hashes, and machine learning (ML) models to identify suspicious and potentially malicious activity.

## AWS Management Console GuardDuty

### Demo GuardDuty

1. Navigate to the AWS Management Console. In the console search bar, enter GuardDuty. Choose **GuardDuty**.
2. On the GuardDuty welcome page, review the service information. Choose **Get Started**.
3. Keep the default settings with all protection plans enabled.
4. Review the service permissions and protection plan information.
5. Choose **Enable GuardDuty**.
6. Wait for the service to initialize. This process may take a few minutes. A success alert will appear.
7. From the GuardDuty Summary page, view the **overview and findings** sections. The sections will remain blank or show **0** until findings are generated. In the navigation pane, select **Settings**.
8. In the Settings page, locate the **Sample Findings** section.
9. Under Sample Findings, choose **Generate sample findings**.
10. Wait a few moments for the sample findings to be generated. A success alert will appear confirming that sample findings have been created.
11. From the GuardDuty Summary page appears **service dashboard** will appear.
12. Review the **Overview** section which displays the current protection status of your account.
13. Examine the **Findings** section which presents the total number of current findings. Findings represent potential security threats or suspicious activities that GuardDuty has detected in your environment.
14. In the Most Common Finding Types section, observe which security findings occur most frequently.
15. Review the Findings by **Severity** section, Resources with most findings section, and Least occurring findings section to understand the overall security status of your environment.
16. From the GuardDuty Summary page navigation pane, select **Findings**.
17. GuardDuty Findings are potential security issues or suspicious activities detected in your AWS environment.
18. Locate the Filter findings search bar and examine the **Status and Threat type dropdown** filters.
19. Review the **table columns: Severity, Finding type, Resource, Count, Account ID, and Last seen**. These columns can be adjusted using the sort arrows.
20. Select a finding from the table to view its details.
21. In the finding details panel, each finding will have specific information aligned to it. This page provides an Overview section which includes the **Finding ID, Type, Severity, Region, Count, Account ID, Resource ID, and timing information**. Examine the additional information provided, such as the **Resource affected** details and any recommended actions.
22. Return to the findings table. Next, to archive a finding that you have reviewed or resolved, select the checkbox next to the finding and choose Archive from the Actions menu.
23. A success alert will appear. To view archived findings, select the **Status** dropdown and choose **Archived**.
24. You are now on the **Archived Findings** page, where you can review previously archived items.
25. To return to current findings, select **Current** from the Status dropdown.
26. From the GuardDuty Summary page navigation pane, select **Settings*.
27. Scroll to the end of the page and locate the Suspend GuardDuty section.
28. To suspend GuardDuty monitoring of your AWS environment, choose **Suspend GuardDuty**.
29. In the confirmation dialog, choose **Suspend** to verify your action and complete the process.
30. GuardDuty is now suspended. Any existing findings will be retained for 90 days. To re-enable the service in the future, you can return to this page and select **Enable**.
