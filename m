Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA86C61DA7
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Jan 2023 20:43:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235962AbjAYUnF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Jan 2023 15:43:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235659AbjAYUnE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Jan 2023 15:43:04 -0500
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2054.outbound.protection.outlook.com [40.107.100.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255BE233F8;
        Wed, 25 Jan 2023 12:42:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bt+LOHcZa5iqkfpH5kGaHe0V/Rk+3E+hh2y1LgUSR0hffRtsI0rtv5RdJol3VNQS4l4HaxyVrVBamzmq/cQxJLPc1DnfJDRx3T6WYTn+uYs1Yp7EED+YUC6WghUxmH7MFR70NlFM/LmSLzsvGiHMMXRFjd7vip/8dP6ZvFrJMPQ6RMSYK70zjUgkgQVZAKOrQXJUY9iF2PEX16fqApBNZibmSPqex4IGwQ7RZkmE4BtlPON1F0DdhC66PXNehV7bey6TnxAdVpJqkqF8cjpsGWOBZTpv9775Iq68ONQ1DnOJW4HxCOUvk414nFp180c3eeiVnTQhwsQdPebvpXNeBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bidzI66cbB6DoXtWFIKdOsJxkrXh4QQkHF7fmoY/pEg=;
 b=P590kYeWiihakDFNAUSkOO8u9UTPxkN1M7FgOgVpWTQlTuHOC1Tmzw7SicxfzYQZVDw5rH8EOxze91UMdE8nJMJB8YDaSF7TYA5IfoVH8Pw9/B36YWPCp97N0AanJAsvBOv09ZID567WJb8v1JZq/AR8i/CNcwLx4jdjcQuo7JNTHo2Y/2EE098fTrwFe09lF9yQZMmacFR9SGU2HOLCJvQDqWAQaKMGGcLpLlfCy9AADdYqfqNfrdlLekB3wJSNf08tKQrclw1x7DjDMHqXpJpFcyXE259/5UUzH+pCZZurMBsLtg5MzJEQJXIAMku3wtxeKL1zHkdhBWOPo6FgWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bidzI66cbB6DoXtWFIKdOsJxkrXh4QQkHF7fmoY/pEg=;
 b=Jw+tmWjN6jWkpWtvt9PnkWp097FtmMTQgqObF61/UGJvyJh+SIeo4ncP/BjaSzr7ksh1lQN4MDUgfVaaqV55oQUETPcBqi9e4qkj5+7oGq+uYuahrCzhE42lpcj3foHuQPMHh/8K1+SSLk2/AolC+Pw9Bcm+j4zmiiuUBaQhc6VrUypNEvf5oOrz+mW8RThWbqA3iPgQYBBBLtzJupGq8gp/0iFtJZi+tsTRBwKnsmzGEfMyYiCU9ejoA8x1BMKDhV3GuDAZKbEliBPayYHNRfkFTfK+5rCKCO5lMtgrxlHGBCrlw1aymY8p46SBchAwVqG+U68Fzr4dE/EWAn6mWg==
Received: from BN9PR03CA0506.namprd03.prod.outlook.com (2603:10b6:408:130::31)
 by SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 20:42:49 +0000
Received: from BN8NAM11FT115.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:130:cafe::73) by BN9PR03CA0506.outlook.office365.com
 (2603:10b6:408:130::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.20 via Frontend
 Transport; Wed, 25 Jan 2023 20:42:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN8NAM11FT115.mail.protection.outlook.com (10.13.177.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.21 via Frontend Transport; Wed, 25 Jan 2023 20:42:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 25 Jan
 2023 12:42:32 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 25 Jan
 2023 12:42:31 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Wed, 25 Jan 2023 12:42:29 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V8 3/6] usb: typec: ucsi_ccg: Add OF support
Date:   Wed, 25 Jan 2023 20:42:08 +0000
Message-ID: <20230125204211.63680-4-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125204211.63680-1-jonathanh@nvidia.com>
References: <20230125204211.63680-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT115:EE_|SN7PR12MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: 178e380c-1e46-41d6-0a30-08daff14b8c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qD8jHxv87tI9LsGqfvBOQeqKzlblVfy04uTESdJuYrQA/w1ng5P0vwJkGDEjYOMpyWI17s98KXGZkFDeqdSRivf0jn4n6BFIsOCYxE0YG4rrZk2b/IqbjrogPfTU0ZR0IduOR+a3CuHRGhgcv0X9lBPm3caW3YBXi8n/dDliGIZartumKzkz2K/UAKUlrGa4Mzo00H0OrmWWN5KnnyBnAgnBOkbIcGlpUj/xqoFR9Gr8ypaZSi/bLam86bSyuoYO1iN5A2vgZLNbun2D+2NQZudUxZMMQqvctCwo5z6h0dgyMNpVUfAD/wsKKx51cAzXwEKJZHb2FvbJ+23SLL5qArOPiu+nDiUHbSDnAlpFE8WV78+IPFmOh/CTtsiXwy7mT57gLtzfT3Axj8SbzdQTmyCkfylaVDMOcCdg/g2yRK7iyb+vz3hlKDXhqOqbV7Yr3Y6A1ztjw5g0igASXE7QvBDSEO339LFt/9La+VaIx4JTEz3JZKFGTdUfUCeQuILIG5ZxUKretpyG9CveB+1J209UGIZyZstu3QqEU90Xzp3IkDNa8Ur4BlEMM8h8BVCcsEFDlAt99/XmjzsRfi+MmPOrLiKteVn2DARiupeu0nMmCpFfsx7+T3arDoLKJCgc+FWeAsFJKhdJAAx9Z0svAPyRJMTNRZMI/8PZvHE4ZwTT/y3HSPJW2Jjny7wKoCbZvUoKdfQPGpUexQALZa6EWw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199018)(40470700004)(36840700001)(46966006)(83380400001)(36860700001)(4326008)(70586007)(336012)(426003)(70206006)(26005)(107886003)(47076005)(1076003)(7636003)(110136005)(478600001)(54906003)(2616005)(7696005)(36756003)(186003)(316002)(356005)(2906002)(41300700001)(5660300002)(8936002)(82740400003)(86362001)(6666004)(40460700003)(40480700001)(8676002)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 20:42:48.8468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 178e380c-1e46-41d6-0a30-08daff14b8c2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT115.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930
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

