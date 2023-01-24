Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB91DC61D9D
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Jan 2023 11:43:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233951AbjAXLnu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Jan 2023 06:43:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233950AbjAXLnt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Jan 2023 06:43:49 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B08C3B652;
        Tue, 24 Jan 2023 03:43:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mlZA266BZ2AsR6DM1ilzVf+Rmj6jp8fyyje3NEGTq2sL6AaHW1y3N0N5IDNmWax8lwLuLS40wdW1S6SSjiS3SmKM8jLM5UhftxeTyTQsJz0E0iqCcrhrfpKsvE5dKZX0hCjTDU/R594f69vZZfeA0ORb0MmXJVbr+hyZSlTAXyY80dbpcoO/ECSeii+OM2PM/DZcfMqqTGKW2z3ok7fsUwAXCNUAPtjSzTLfkZyKGwWn6m2eCRJL5EHCTkRa9QcyYbFbjAd+uRro06HT99BYOsMDIPHPZtAc4yrKyTmDYV23Svj3pmTKWt+h8L/+8U4NzCZzoxPAq1fl6z9WkJaAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtHf8adUMNw6lM8YkGQR+mIt8DhNt8JLe3H/Yppqq7Y=;
 b=BSN6SCQfvfU7zLOLN6Ijvh1bm2cmdhEATbGMyAwRofhO7k6jT8SrCzqo9Sj184HiQ/luX91DPbIq9MdJU+A0WPJrbJFyOKgWBaY5bSu3gJ8IPB8v5BEZO3ksUrXs7WZR2Hi4zpem2OvBcv1wj0CKXuFc3mXsZkYcT+isnHV1qx4xBKwlBusI8qgmSSAUGR6rGziywLHmgoBihaEA/rwL5kIyOd4qXzLWWU7dYmRRlRWto1LRhTSr1fIhfA0U61jdzEa8n0JNdxpTTOh8o+6zoM87z+Q+laJfSA8sMyiedzNgTIobIi1jo1vjtdXVSHSGmSq2C+lMOSb1kZ6phoDm/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtHf8adUMNw6lM8YkGQR+mIt8DhNt8JLe3H/Yppqq7Y=;
 b=pDt/kaPWFJrdtTWgFJW/eRZx9ttnjN7F9o1oAVdhX2zy42AHwf+BhC5W4zMflwGsdgySCBczBFG7sKkdhjXq85aflGi5SVWhL9OsfANiLFS6yTbEOY+uL8TNCUl2qHn6epkmteZvvuPaOBkeEYPbZg7uh4vm+GIOd3UUy5BsyJlqjhExno48lHv9WIgy4F79I+yYFT2Bd3quihtdmo+t9IlPRJGJJqD8CYWOYezDAK8NeLKXxGH6I553lkCuyYWFRBmbho8MMqwL2yoa0Qga+L5qZLLyGCTiAGACTWSIkk9PgKG7ByVVcNBPlOYhwuaryM1Bx95VUmKQTBDD5DCzAQ==
Received: from DS7PR03CA0165.namprd03.prod.outlook.com (2603:10b6:5:3b2::20)
 by CH2PR12MB4293.namprd12.prod.outlook.com (2603:10b6:610:7e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 11:43:46 +0000
Received: from DM6NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::6c) by DS7PR03CA0165.outlook.office365.com
 (2603:10b6:5:3b2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Tue, 24 Jan 2023 11:43:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT073.mail.protection.outlook.com (10.13.173.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.17 via Frontend Transport; Tue, 24 Jan 2023 11:43:46 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 24 Jan
 2023 03:43:32 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 24 Jan
 2023 03:43:32 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Tue, 24 Jan 2023 03:43:30 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V7 3/6] usb: typec: ucsi_ccg: Add OF support
Date:   Tue, 24 Jan 2023 11:43:15 +0000
Message-ID: <20230124114318.18345-4-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230124114318.18345-1-jonathanh@nvidia.com>
References: <20230124114318.18345-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT073:EE_|CH2PR12MB4293:EE_
X-MS-Office365-Filtering-Correlation-Id: cc90a498-507c-48c0-648c-08dafe004095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m0ZPXSHD9g3LB6LKB+TiGS9ariU2TbzAEfrdTJ1r8HL7vt5z/F7rgcICzTXJ3pMQ0kmNkD3Lq9VjyFT31s9Y3D1XjQz+9kROiVauBAA5Nmp5pP1Nxib7GdoEfqtix6RpaZKP67tOIFlsdsfUbyR0rkuPBbYi4HeFrgkjGvFUvxHxmMhRU8yMuRO14ru0DpVq+NIAQepI6o3Mc0lcXKziP4d5aqcZV+xmb+2R7E1imXR9w1AXLyBLa8rg3RaF4VO7PI1v0wRGy4BjJkk3+hasFAe/NywgAQ2RRgPAzO+GcYsVHewh678EBg4uFp62Pp8SVKaQeUpqTldcD94xSHyiAvU3mWhi7US5hmpyma53itNlFvejgvdKOsMipQEagnLGbnqxe7J7+nKztLYZxL/CTzQ69IfUIXfitZOTnl2Ga4KM5d50ZNP+WEBx8ALSz7V5YeRpQXoUaEG0GPcS5zpbFXZoPq6kMfFMuGn/YFznLn6Hw0A6haIxX/Peu7CULIEckMAcoejuCQD35pgoTS9MPeSSSs2iKVn1eWPFjlLS717a9JW1VEUz4LjzVF3kFurACiu6baoSDBLLYHd1OsrUflMH0s24UNJYrlym0XvUFOSyZGzR+HrcSGx41lZxDGQfkcPfGImBOUBXRGcSwhcLevovwbznQUEKxs4EsmZZjF8bdNDO26CQGeXHvAREctvTtvRWTHmaPMk4zTjqMkLKpQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(36756003)(41300700001)(86362001)(356005)(7636003)(82740400003)(8936002)(5660300002)(4326008)(82310400005)(2906002)(83380400001)(36860700001)(478600001)(110136005)(7696005)(26005)(186003)(8676002)(40460700003)(316002)(40480700001)(70206006)(70586007)(54906003)(2616005)(1076003)(107886003)(6666004)(336012)(426003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 11:43:46.1927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc90a498-507c-48c0-648c-08dafe004095
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4293
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
---
V6 -> V7: removed 'ccgx,firmware-build' property
V5 -> V6: fixed compilation
V4 -> V5: add support for 'firmware-name'
V1 -> V4: nothing has changed

 drivers/usb/typec/ucsi/ucsi_ccg.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 46441f1477f2..8f5ad2094f26 100644
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
@@ -1357,9 +1358,16 @@ static int ucsi_ccg_probe(struct i2c_client *client)
 	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
 
 	/* Only fail FW flashing when FW build information is not provided */
-	status = device_property_read_u16(dev, "ccgx,firmware-build",
-					  &uc->fw_build);
-	if (status)
+	status = device_property_read_string(dev, "firmware-name",
+					     &fw_name);
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
@@ -1426,6 +1434,12 @@ static void ucsi_ccg_remove(struct i2c_client *client)
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
@@ -1480,6 +1494,7 @@ static struct i2c_driver ucsi_ccg_driver = {
 		.pm = &ucsi_ccg_pm,
 		.dev_groups = ucsi_ccg_groups,
 		.acpi_match_table = amd_i2c_ucsi_match,
+		.of_match_table = ucsi_ccg_of_match_table,
 	},
 	.probe_new = ucsi_ccg_probe,
 	.remove = ucsi_ccg_remove,
-- 
2.25.1

