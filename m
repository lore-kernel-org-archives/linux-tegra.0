Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06CD6C46467
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 11:18:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbjASLSR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 06:18:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbjASLSP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 06:18:15 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C17264DA1;
        Thu, 19 Jan 2023 03:18:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRtj7dzWbT4uQnP8MIjQKh4xB2HW5qfIpn21ojQl6brjK2LBxxMmLEI6WNRFkrcTSEk3ui5e6FJENuv6XC5wMU0baPV+MP5oV/skCXOjL1r2o2wz0D+P8+sYO92oueuk1a5GDvQ6yzR1m/w/mVefjZWCllfr9wvTIV5yFWz4C6h2FCSpRtc6cj9NhKZU+ZoGkB7x2SAa298lOLlxoLnJlNKPHC8/PgJDVn1EvYRM2bYMvQIpwDj7Q/BpFtyTVBslamPfZbzD2s945qyAPjhWOUw7tO5CauOxFM4exEYywuGm3WHqhxD+i1Hm+8YQb93HCO/9ysjmXzjcwmuA6u7GVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLvPUqJ6dpucCPyjMFiIuIipinXHm/UXkny6KCqxp3o=;
 b=jhYLpbKvBSGx57wo3tST7KrhexSbfxZalfVOx4uNkom+6PPYVQvaO3ierTlcYGhyw+paZiD6KVxEyU4YbknDccGoaoacS1UQBydGQ8AjRma+T21qSQrnWSBBKXn45Vpup0+D6hkpcApj0+a09c/gYGLl3NVjbBsMgRsc824btk4OQ0UKhTteVtBke3lCJwMUyg40ojRQQJrXCoFn19LFSWW+EtOeRElwZKXoIOxYWKfY9Rlty+2ax5AfTL6AB7cIZS++145rKmEWy/RaN4Rhl//hP6oOt+D6OsFsxIOnyNbdPfa/u6P/dU711Oi+a9xYniu8cyoDAToAivGgHq8Iag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLvPUqJ6dpucCPyjMFiIuIipinXHm/UXkny6KCqxp3o=;
 b=K8mJnZ3ID1c9SgaRzzB4eZ2mPsPbhUNE9mCZTmfjKprHIy3+T3Xa13vlDxCFYhI589Mhsa7PqBIJYoHPsFY0PsO+MvJLf+28u3t7dRqqE/d3XGGMwqBVcpCL3q8LZCDFpT0RHQL0yC6HD7LC9He1JiSPBZvXyCKT3SutgwSgKAnwvKyV1vZa+agPdej8iw/D0fN8klGJ6yn8hhLYGXfLUl/6hC8onxZm9keASncXnPzqSTv8cN5SQwk1ZIujJe9QGl2c4qHIXM1INTJyNaObJk9CwHvuuX5dl8uWsGEAVEZ0/tEas1S4P1GYOWIvUfe2hLaV2P89J0YlTt4iGdBjWw==
Received: from DM6PR12CA0025.namprd12.prod.outlook.com (2603:10b6:5:1c0::38)
 by PH7PR12MB5950.namprd12.prod.outlook.com (2603:10b6:510:1d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 11:18:12 +0000
Received: from DS1PEPF0000E637.namprd02.prod.outlook.com
 (2603:10b6:5:1c0:cafe::23) by DM6PR12CA0025.outlook.office365.com
 (2603:10b6:5:1c0::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26 via Frontend
 Transport; Thu, 19 Jan 2023 11:18:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0000E637.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 19 Jan 2023 11:18:11 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 03:18:00 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 03:18:00 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Thu, 19 Jan 2023 03:17:57 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V5 3/6] usb: typec: ucsi_ccg: Add OF support
Date:   Thu, 19 Jan 2023 11:17:38 +0000
Message-ID: <20230119111741.33901-4-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119111741.33901-1-jonathanh@nvidia.com>
References: <20230119111741.33901-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E637:EE_|PH7PR12MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: a29a2d19-f5fe-4123-7cda-08dafa0ed9f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z894Cg+OOuDAdY0ZturhOUIDODuMGUBiRwhXyWuMYpc/Y1P/VZzwEvkxKbX2MlD6W2HJcN6TfVdaUGAkCypmXbc266JIBgqLX26OabtGhJ/QUHetlMZXxzmqopYa5hppLL0hsnYe+mqR+L9s3UmLFN1C2JhI6DB5Q3jJhNrQcLMTPchbC5ZEliYZtm59+Nb9gBNw2lAYTHGLEcn67KEgVilAS0xDousy+N+nJq8JFCmiZmWOhScNebxVLKYKHGV/Ug+3Q9S1q9nfsSjB7jv3KE51iwfOEIsAfooa/mPVgWhG5tAtu0GAWyl9+z8srjZvyK3u++Hrc9LkVctihlGqcWjK6M+PS+qiewP9YPDRJNBkM2Z3cywXc4LJ9kvvqamuTm04VwFAYzPvjpHiqX2+F77Zi9fpU7R5VXmfdNpB6iTN7dWZze1hWOjt6iqlW15L79Q+FpxbujsWfDEbeRL6FqXmTeFQB/+QANEm+PdB+5i6/wzua5v16mb8EV5EuhIQu29cNmAcTyf+ylHky22zK11g+vIlta+oFbFGa67SUPtkToNSiwljnpPVzwmWlOQbaBQMfj5MENE5kBrt3DgdWUhkUzpiHtzBZGVblwAiVi+czaGTCOpjQr6LFqkQGqtxfCTpzo+R0oVTkxrcJPRnc+IW0s2EqK3T1oBEjfsh7CIJ0ygcztgrBeN0800zgALPFeNvTZm+PdhjHgTbmZtxdA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(82740400003)(83380400001)(7636003)(316002)(356005)(86362001)(8936002)(2906002)(4326008)(36860700001)(70586007)(5660300002)(70206006)(8676002)(41300700001)(82310400005)(40480700001)(426003)(107886003)(2616005)(186003)(47076005)(26005)(1076003)(336012)(54906003)(6666004)(7696005)(40460700003)(110136005)(478600001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 11:18:11.8145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a29a2d19-f5fe-4123-7cda-08dafa0ed9f7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E637.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5950
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

Add device-tree support for the Cypress CCG UCSI driver. The device-tree
binding for the Cypress CCG device uses the standard device-tree
'firmware-name' string property to indicate the firmware build that is
used. For ACPI a 16-bit property named 'ccgx,firmware-build' is used and
if this is not found fall back to the 'firmware-name' property.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Co-developed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V4 -> V5: add support for 'firmware-name'
V1 -> V4: nothing has changed

 drivers/usb/typec/ucsi/ucsi_ccg.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 46441f1477f2..889a831e251d 100644
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
@@ -1359,7 +1360,18 @@ static int ucsi_ccg_probe(struct i2c_client *client)
 	/* Only fail FW flashing when FW build information is not provided */
 	status = device_property_read_u16(dev, "ccgx,firmware-build",
 					  &uc->fw_build);
-	if (status)
+	if (status) {
+		status = device_property_read_string(dev, "firmware-name",
+						     &fw_name);
+		if (!status) {
+			if (!strcmp(fw_name, "nvidia,jetson-agx-xavier"))
+				uc->fw_build = CCG_FW_BUILD_NVIDIA_TEGRA;
+			else if (!strcmp(fw_name, "nvidia,gpu"))
+				uc->fw_build = CCG_FW_BUILD_NVIDIA;
+		}
+	}
+
+	if (!uc->fw_build)
 		dev_err(uc->dev, "failed to get FW build information\n");
 
 	/* reset ccg device and initialize ucsi */
@@ -1426,6 +1438,12 @@ static void ucsi_ccg_remove(struct i2c_client *client)
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
@@ -1480,6 +1498,7 @@ static struct i2c_driver ucsi_ccg_driver = {
 		.pm = &ucsi_ccg_pm,
 		.dev_groups = ucsi_ccg_groups,
 		.acpi_match_table = amd_i2c_ucsi_match,
++		.of_match_table = ucsi_ccg_of_match_table,
 	},
 	.probe_new = ucsi_ccg_probe,
 	.remove = ucsi_ccg_remove,
-- 
2.25.1

