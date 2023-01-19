Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A36D1C6379F
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 12:17:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbjASMRb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 07:17:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbjASMRY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 07:17:24 -0500
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2067.outbound.protection.outlook.com [40.107.102.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2386D78A82;
        Thu, 19 Jan 2023 04:17:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hP0r1LQT/r62gBR59H1B3sbc+A8HJnVsXtEz+CQir1bZUeyz6+AaeNHRWL6o5s9xJltMMTHnhJI85i4XeoaMKWiJ4k2uVDKrCYY5tvB6W/dvzfV6qyu7iR+STRVw3xTy+Y0tkMbrrb9eML9hGiao7yWHsamoehfw0tKSH8c7tMmsjZpGAgw1wC7EWjma/55Cd0M0ct4EjEHbws72RqYR2pv8God9eGtXKNkE1bn3HNVSGpjQM8ESN/fgK8nHhdv6OWW30JT7MbqK9HZOYXtXHaaGipOkpFCj7XWYyXg0/2s2kQOLiPQUHy07WHpnZGA8oR8FvJxnrVt4zKLwvVzz4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHJLuSETTWWZXDkwN9dipH3LRur1S5TD9bKqRsnOyEU=;
 b=H9dRTA2kjXZuIIqLEe10geeEq9EO/mNdQ1uwWNMzZExAOKnt2b2NP2TIM9cBix7GelAhl6BVEwSodh9tnti0lf1ugapQWWi3UInWUU9rzqj34k3uaFkgkAtIvBzQVm6fqGQ6KFJFvE3SWL2TcWgrAOwwedUw120ESsyjVSNP9vtFl7TdwrACtf0BA2ZFmMByTIWE4fiOFxTkqSIfhWqdM9z5RNREi8NNdUgZoOST7A4mzTJhAd/8s+4mGl5SICRRJaU21qBXaZX+x56ziV7PT4U7nstuX9DzhYr2ZIYVnoi7a6656LYTGOXejEUtmu7XErbH0RcPI/uqAOwUx56Vcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHJLuSETTWWZXDkwN9dipH3LRur1S5TD9bKqRsnOyEU=;
 b=d7ThYrBIe+Aomj153JonGbgVdfH/0TWegaVMt1jaE7dXjXSdTgN6a6d73t5VWHwM8UbAwOQZp7U47JLImli6DSIvijf3VTwTKLzvDm26piPetzNX6f9veRiS9wcUNCsW7AR20UXftwC1AXmRb2Wb1K22HYlbYK1WcGscOGTfPyT6LIH0Bl9DBqVDGspw6Xl+xYXd8WZaUDsVMRya72kf1nwQmal6g+Z5OXdYXKg26gFRK3/9ks5MHofEOXRmZK8Eoy8pyY0J0i9/2b+8ug0RoP0cwlF0kfWWb2ovfnwyBP8bi0oOTG/dT2Bk7ClHN138i0LD+pK4kvFZoWn+gwNImw==
Received: from DM6PR07CA0090.namprd07.prod.outlook.com (2603:10b6:5:337::23)
 by CY8PR12MB7241.namprd12.prod.outlook.com (2603:10b6:930:5a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Thu, 19 Jan
 2023 12:17:10 +0000
Received: from DS1PEPF0000E657.namprd02.prod.outlook.com
 (2603:10b6:5:337:cafe::c8) by DM6PR07CA0090.outlook.office365.com
 (2603:10b6:5:337::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26 via Frontend
 Transport; Thu, 19 Jan 2023 12:17:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF0000E657.mail.protection.outlook.com (10.167.18.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 19 Jan 2023 12:17:10 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 04:17:06 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 19 Jan 2023 04:17:06 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Thu, 19 Jan 2023 04:17:04 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V6 5/6] usb: typec: ucsi_ccg: Remove ccgx,firmware-build property
Date:   Thu, 19 Jan 2023 12:16:38 +0000
Message-ID: <20230119121639.226729-6-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119121639.226729-1-jonathanh@nvidia.com>
References: <20230119121639.226729-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E657:EE_|CY8PR12MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: f32f6337-5c46-4464-3de6-08dafa17173a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yD4ZrCEqMdEPkMm8HHoySq2ihm0qxRvaUoZN6tfJJf1dpoDVDyOl9NriNwf6LSJkIKBsQCFJes9BPc0NyTURi2O+fbfsJKboug7ps8AciLOuZOAfys1AqV9FRKUOSZDuIkUc5tfNmcDiCKp3lPjVuOIFkO8JJiZoch87zfzjNEkx4w8OupwGR6KCsy43vlqI1eHbFJKRjN5cB9EAjGljeiJsb5y6OJSNNqVYjZvIqs3pPgoqM57eZc4Ev37NyvYlpvd4K5KXy+ZVxdesx4ME8L9eub2W+n8nJxpSogNtxHRGMScZ5CL6uas/Ylyhs5iMEQfyBy7RfYnMblTeKtApq1Zm+UuhY6Nh9t3xRx2wX4qnhiib7aqB/Szk2W6lf23s9f9+mQhyZxFY6bW+ShUI8+F+6dLgwVM+n4SPtVY+TGzMEFoHUbB9oD5Zwk/yUmtuTfUwT/xWpBXa+FoGu+vjbCLjI4Lxo7m/vmuMQiu5m8WMRnpHuXGktddkkGTr3GM99XVIQjwcVn0kdjlFEhbk4nzhI6d01fL6Kc37ATJf9Q7PIfMmri2anqc/piSc6Umdr402/FytDUt0z30Ew2v8ssiYq3kjNo21C2poa+cqs9JziCBjjLIwWzmCRBuNbczw9vpi8okOCaVTvXTyR3X6f5BpPe6aNMESVf/fXFwjSfYKAiCECxMFuSAeZaDUPfAU5T5J91zvlSt0XCPBN2XPCQ==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199015)(46966006)(40470700004)(36840700001)(356005)(82310400005)(107886003)(6666004)(40480700001)(36860700001)(478600001)(7696005)(336012)(86362001)(2906002)(110136005)(54906003)(4326008)(1076003)(5660300002)(2616005)(82740400003)(316002)(7636003)(70586007)(70206006)(8676002)(40460700003)(83380400001)(47076005)(8936002)(426003)(41300700001)(26005)(186003)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 12:17:10.5825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f32f6337-5c46-4464-3de6-08dafa17173a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E657.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7241
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

Remove the property 'ccgx,firmware-build' now we have migrated devices
to using the 'firmware-name' property.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Co-developed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V6: fixed compilation
V5: Added this patch from V3

 drivers/usb/typec/ucsi/ucsi_ccg.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 661a3988b39d..8f5ad2094f26 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1358,17 +1358,13 @@ static int ucsi_ccg_probe(struct i2c_client *client)
 	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
 
 	/* Only fail FW flashing when FW build information is not provided */
-	status = device_property_read_u16(dev, "ccgx,firmware-build",
-					  &uc->fw_build);
-	if (status) {
-		status = device_property_read_string(dev, "firmware-name",
-						     &fw_name);
-		if (!status) {
-			if (!strcmp(fw_name, "nvidia,jetson-agx-xavier"))
-				uc->fw_build = CCG_FW_BUILD_NVIDIA_TEGRA;
-			else if (!strcmp(fw_name, "nvidia,gpu"))
-				uc->fw_build = CCG_FW_BUILD_NVIDIA;
-		}
+	status = device_property_read_string(dev, "firmware-name",
+					     &fw_name);
+	if (!status) {
+		if (!strcmp(fw_name, "nvidia,jetson-agx-xavier"))
+			uc->fw_build = CCG_FW_BUILD_NVIDIA_TEGRA;
+		else if (!strcmp(fw_name, "nvidia,gpu"))
+			uc->fw_build = CCG_FW_BUILD_NVIDIA;
 	}
 
 	if (!uc->fw_build)
-- 
2.25.1

