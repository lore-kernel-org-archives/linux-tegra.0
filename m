Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9571AC61DB3
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Jan 2023 15:11:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234193AbjA0PLR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Jan 2023 10:11:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbjA0PLQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Jan 2023 10:11:16 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196BC834BF;
        Fri, 27 Jan 2023 07:11:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUw3rIAQW+OMUGrJOzMpNmmBNHtt8D8Gu5T8UPN6EbLOCqYlPVuMQcIVYGwtvx8O2KpvodcjyRI8+GjaAWKx+/kBy1P8GcUuzk7ZpjrbiIT17OHdprSo3fWnYqr1LBH7WDbr6NPU/MOx2zSEFv5CQs4+YmzoxM2o+40BGilDXVMc04puBVrRmjcN2aqVwRYpHs2vrM9i7QCvmb+T6KoNjw+bFZ68GEmrzC7uqXVnsPKhSqXuTuNwzM61TroX4pCMC/Po6O/1cDVt7VovYqfVejfNH4Q91m8Lj2bWtHxidLY0zdCM/BWFaUaQ7IFneMx+o+447aSb88m0t51Llm67uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqVoWf99XP1WfyBig8oIheyNY++nzLv6t2l+6SYlLL8=;
 b=QwoB0H5qjsdmeBnKS5roKG5Rg60QI4CbGkc6jJ/kxTJ1ivyO0TJRq4HZFn9VMsBqalMogzf1YdNaJMsbVZwu3KspNPRH+GHP4GIvaS1jsx1lX5FwC/BZ+NAd/x5YEoUCEEix9pgClLbh7ww1FtRpepcXeGW2hjWAB2evRkXTlcqTesFs7l7F8dXE7h6W0V9wN0QSFzrDrpIAoTqRbcEmw1KcY4oZJ8vdi/i5jIafRBzMU8Jn3L02wgxSFOfkUFuTMVmvfGFdjmlpHo77xl+JCxCX6Cn+W6i8rN53XShWnqkGLAxgG1fkgrUIYfIXaTiFWxqrR1AwdaihrqQilBehUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqVoWf99XP1WfyBig8oIheyNY++nzLv6t2l+6SYlLL8=;
 b=WBiBwIi3xPpmHez+j8RdIeGVyoYxPpxefUxhOGiQcCbv4Dj7TDnd50752KleBJCaSRAA9wgPka+EFAxq6oi4ozowlTL4c5g3cVxxoKQNbGbN3MuO7E6yIJSXpDHch9wuKyDushLXDx4velchb3srFyZTjUDy2LW+i6W/oe9bePI2DLslNiR+ypXBkmwUciUhGmcCZndmW0g9VZgsfD6PJ3OO1zRpwkUg/PtLt9Uo3hzzxlqDSWcJhIqQU0/Fdgeg7b5XUSJ/IJbfWOx5ztomMyQNDnO0eOYDSkqQ/b5aYpsp42REkdMmvwVGmRI3A66VxpBUWWTHYwh/UXoOJzHvQQ==
Received: from MW4PR04CA0173.namprd04.prod.outlook.com (2603:10b6:303:85::28)
 by SJ0PR12MB5634.namprd12.prod.outlook.com (2603:10b6:a03:429::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Fri, 27 Jan
 2023 15:11:12 +0000
Received: from CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::b1) by MW4PR04CA0173.outlook.office365.com
 (2603:10b6:303:85::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23 via Frontend
 Transport; Fri, 27 Jan 2023 15:11:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT006.mail.protection.outlook.com (10.13.174.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.25 via Frontend Transport; Fri, 27 Jan 2023 15:11:12 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 27 Jan
 2023 07:10:59 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 27 Jan
 2023 07:10:58 -0800
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Fri, 27 Jan
 2023 07:10:56 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V9 3/6] usb: typec: ucsi_ccg: Add OF support
Date:   Fri, 27 Jan 2023 15:10:38 +0000
Message-ID: <20230127151041.65751-4-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127151041.65751-1-jonathanh@nvidia.com>
References: <20230127151041.65751-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT006:EE_|SJ0PR12MB5634:EE_
X-MS-Office365-Filtering-Correlation-Id: a659a804-98a2-41ce-ba0c-08db0078ba23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n5sKpLtG8eVfzcBui1lJwZVRxt0jVuF+EZmJkAq8tF+i8HSza43JPYOsKlAJZajPRxL9VRO6DXSGq4mbXAsQYG0heUc/+h/K/m3q7pVXUu/oyhOPsDYiZEmnWQa+Wh2MNTgoH6S/f4QuVvCq9O9d2IYCRM4pJwTgH0kh8jnza22XUYMNx1EX1WbY8z7SC9GBSwfZPhk68m9GjwUN+idJkGrCsJBkK4CUbxDLHEWLJJNH9nAdPu122frk0bVCN2etLAAbRnhn4vzP8Lb3EjI4kMRW/6MXTsmg8c0N4xqA/sXhJD6lyaRvvUB6HfqW7hhOXr8JnJJEy9R6lNVqDFaN34AzMfFc96JH2s+d5zqdh1Zqsa5pXJS+1FKXsba8SrVaiK28eUBYoxRfj4NGS9jXcy2nhNo4sLN86fVihlNXZG5Ve/YJgoNeFxxcBsw2oHHCwazCPfMm/QYSt42vFsD5igqFajbQpLIEU1gTe1EFM9n/lm2lDK6pUUkwc053HtytghpYtHCbWtVe2aBuCQqd6c3AEcGn9jBQQsC9WXQmYYI8UtIIDGdwpDXnOXUXczX2E7aD/7vJgNI9yVkCt8m81aT9P1x5rdcu/EMDRvIIEAHXno2UDYDV91Rqp8G55ixpa5S1H3GuFAf37YVtx1l3MXB4IPoghGnQ5rVS6NTn3foXVgjreu97sqBUDPPqJrJ0bN9KesHRLNa0+rW7QS9FyA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199018)(36840700001)(46966006)(40470700004)(5660300002)(2906002)(70586007)(186003)(8676002)(4326008)(70206006)(8936002)(41300700001)(83380400001)(107886003)(426003)(478600001)(336012)(6666004)(1076003)(2616005)(26005)(316002)(82310400005)(47076005)(110136005)(82740400003)(7636003)(54906003)(356005)(86362001)(40460700003)(40480700001)(36860700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 15:11:12.1098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a659a804-98a2-41ce-ba0c-08db0078ba23
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5634
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

Add device-tree support for the Cypress CCG UCSI driver. The device-tree
binding for the Cypress CCG device uses the standard device-tree
'firmware-name' string property to indicate the firmware build that is
used.

The NVIDIA GPU I2C driver has been updated to use an ACPI string
property that is also named 'firmware-build' and given that this was the
only users of the 'ccgx,firmware-build' property, we can now remove
support for this legacy property.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Co-developed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
V9: no changes
V8: Add Heikki's reviewed-by and fixed unnecessary line wrapping
V7: removed 'ccgx,firmware-build' property
V6: fixed compilation
V5: add support for 'firmware-name'
V1 -> V4: nothing has changed

 drivers/usb/typec/ucsi/ucsi_ccg.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 46441f1477f2..e0ed465bd518 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -643,7 +643,7 @@ static int ccg_request_irq(struct ucsi_ccg *uc)
 {
 	unsigned long flags = IRQF_ONESHOT;
 
-	if (!has_acpi_companion(uc->dev))
+	if (!dev_fwnode(uc->dev))
 		flags |= IRQF_TRIGGER_HIGH;
 
 	return request_threaded_irq(uc->irq, NULL, ccg_irq_handler, flags, dev_name(uc->dev), uc);
@@ -1342,6 +1342,7 @@ static int ucsi_ccg_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct ucsi_ccg *uc;
+	const char *fw_name;
 	int status;
 
 	uc = devm_kzalloc(dev, sizeof(*uc), GFP_KERNEL);
@@ -1357,9 +1358,15 @@ static int ucsi_ccg_probe(struct i2c_client *client)
 	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
 
 	/* Only fail FW flashing when FW build information is not provided */
-	status = device_property_read_u16(dev, "ccgx,firmware-build",
-					  &uc->fw_build);
-	if (status)
+	status = device_property_read_string(dev, "firmware-name", &fw_name);
+	if (!status) {
+		if (!strcmp(fw_name, "nvidia,jetson-agx-xavier"))
+			uc->fw_build = CCG_FW_BUILD_NVIDIA_TEGRA;
+		else if (!strcmp(fw_name, "nvidia,gpu"))
+			uc->fw_build = CCG_FW_BUILD_NVIDIA;
+	}
+
+	if (!uc->fw_build)
 		dev_err(uc->dev, "failed to get FW build information\n");
 
 	/* reset ccg device and initialize ucsi */
@@ -1426,6 +1433,12 @@ static void ucsi_ccg_remove(struct i2c_client *client)
 	free_irq(uc->irq, uc);
 }
 
+static const struct of_device_id ucsi_ccg_of_match_table[] = {
+		{ .compatible = "cypress,cypd4226", },
+		{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
+
 static const struct i2c_device_id ucsi_ccg_device_id[] = {
 	{"ccgx-ucsi", 0},
 	{}
@@ -1480,6 +1493,7 @@ static struct i2c_driver ucsi_ccg_driver = {
 		.pm = &ucsi_ccg_pm,
 		.dev_groups = ucsi_ccg_groups,
 		.acpi_match_table = amd_i2c_ucsi_match,
+		.of_match_table = ucsi_ccg_of_match_table,
 	},
 	.probe_new = ucsi_ccg_probe,
 	.remove = ucsi_ccg_remove,
-- 
2.25.1

