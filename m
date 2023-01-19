Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15274C004D4
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 12:17:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbjASMRO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 07:17:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231185AbjASMRK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 07:17:10 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A2D471F17;
        Thu, 19 Jan 2023 04:17:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsHShYcPVdwvNBubcl3FSyhm9mfPjv8vEx0MP1P62D3la+2E6TnTfQqPFEvuv9W3Tt9oZjaPGDc4j0fOMPhvPK54Dutf7pAT7u6x1tso2X6PL/OUQpc6+g9jRb325e4HtgY/ngNLcG6iM3EJRPW9aFVLLz33fklvstya10Iize/885cwjhoZ9tkZSE64l6a1Hqr2crWErbxoGncwvRufjVDsbKFoOWMHcV3+HTUzL9PP2a+6Nu8gXgUGnKdQTGLig/xuMqUlZ+xObGbJkwnTWVwtoIWihTI3Q7lKbpPt6rJHsoFO6BlCQn5OgwNmVpijEMwp2GW0MNQaJNd9Eacz9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCocK6ysoJTl6U7TqKdW+kMqgPkCDQepU1aFe2gYM7I=;
 b=kQvB4HW69Cxb0ixyGChI5L8Uo2ixR7Kh4FCH4OyjKB9rGyMaHaxuYsUl1sf3i9upNXAmjPmGzLlD7Rmez0ZtQwdsBNz9hWmclZPP2XbwBGaFDpqBWws9tUuFloCjXIrbAGeXEcBi0tE/LFUs60Qpf9y1rSLy530hHlgW9LynhJXdTFA1nYhZX+jX0bZ7Ont9ByxV/yT4nH5Qx7mlUmWA3Nv47Jz9ZlYRZokPYHm8a+BDqgemY0M4k7+UiBU6SyfY+7TltAF6eWe+yLI5JRSzII7Rg9uaRG2r/k0Gpoat3B2GnaXZVt6hlXSy0ywA/6zF2kaPvlSM2WSswSn7VqnfQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCocK6ysoJTl6U7TqKdW+kMqgPkCDQepU1aFe2gYM7I=;
 b=cYtNWg+LqXKt9DMzQ7iq0DeID+lgnJLWwbURNyBvlCfp43w4ZFfQf8IkI6i3hurgnl8Th04P3TjG4lgPC/cfpi43focQWs3uMwahpRszgrIvuB2bUKWsS2WLBzGpzCGBOv8+LafvKBqOZo/JhV5OLqfKzbR964YLOtssQG+GjQ3rHMUL6sOCJgYb/+qeDrbWHPsLgeJOmkfq3Dx2XpvhN+jMRsmW5qQFoEN10rkAhiyluWD7Kpd6ELaOXVIVyNwv98OvPx1Smn098d547ulLT+oz+Tt2URp3jh37VQTomS7tOy6mUiHuYdKROdiLo6ho9r/MU+mdQgvgKmZcACj2pg==
Received: from DM6PR07CA0079.namprd07.prod.outlook.com (2603:10b6:5:337::12)
 by SJ1PR12MB6098.namprd12.prod.outlook.com (2603:10b6:a03:45f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 12:17:06 +0000
Received: from DS1PEPF0000E657.namprd02.prod.outlook.com
 (2603:10b6:5:337:cafe::36) by DM6PR07CA0079.outlook.office365.com
 (2603:10b6:5:337::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25 via Frontend
 Transport; Thu, 19 Jan 2023 12:17:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF0000E657.mail.protection.outlook.com (10.167.18.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 19 Jan 2023 12:17:06 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 04:17:02 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 19 Jan 2023 04:17:01 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Thu, 19 Jan 2023 04:16:59 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V6 3/6] usb: typec: ucsi_ccg: Add OF support
Date:   Thu, 19 Jan 2023 12:16:36 +0000
Message-ID: <20230119121639.226729-4-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119121639.226729-1-jonathanh@nvidia.com>
References: <20230119121639.226729-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E657:EE_|SJ1PR12MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: a20964f8-348d-4495-368c-08dafa1714c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CFhrb2k0RqJOtjg0lei85+OAoUsPwWHeB7/uxVLzqACz9prwT0ojoq5P2znT+6husFRaZ6gcsNC3EDdBOAaANP4WYc2p8gQ18VOgEye+msdmJUl853VJ1vUxE4KEMQnOT/ts2MeiwYgG8OfVvn3dJyCykqLF4MIBAyaJUBbYtQg+3COL6Kg45UW1zcr726F6m3fT10aqlevOoWTQdxrjtJNCXvZCZOidbCshxcnBPRG1s63w22kQl0ofezoizQPI6pcJmF3xHDEZIVDsiQcdKz0Qyxwn1qPgUPXdjynl1dey1fxe8RL64bBSOLOOJUzm6JCWFybRVacQEQQ3S0V1EudYEm/AEmdgRZMmdebmIltCwGUi5BErvTZSNMjeDKhp/oeuFVfR4UGZV3EAwrWSd0BzFrZLAXnseKnHx535PkBkSFMBC7eG/hsOsL5B21+LzJT8J0Z/p+qGJ3XoeO+PxZXaeN2JjLbxhEyeqGvS5qVjPZc6perLal4JUy2UAZ3JriwbnZGNr7TJ8ZydYVjQZM+/G55bVrqpjWDvUZcSdm36D2FE5RZVOefBw+S/vF1ARN+L8C3jZ2330oa5fwgznqPRRiCOSE8gEmojLcyi93izpbFoKQNBdnqQ0if1UFyQpNonYYxVqPX8J5/8rHxDcKsyMvemQHczApwZekqqWhveGnwrMkdBUWHCdhrkm/vTStkrkBMujcy061HViiRnwQ==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199015)(36840700001)(40470700004)(46966006)(7636003)(70586007)(36860700001)(356005)(86362001)(5660300002)(8936002)(2906002)(82740400003)(70206006)(4326008)(8676002)(40480700001)(41300700001)(82310400005)(40460700003)(336012)(2616005)(186003)(1076003)(26005)(83380400001)(47076005)(7696005)(54906003)(107886003)(426003)(316002)(6666004)(110136005)(478600001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 12:17:06.4732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a20964f8-348d-4495-368c-08dafa1714c7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E657.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6098
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
V5 -> V6: fixed compilation
V4 -> V5: add support for 'firmware-name'
V1 -> V4: nothing has changed

 drivers/usb/typec/ucsi/ucsi_ccg.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 46441f1477f2..661a3988b39d 100644
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
+		.of_match_table = ucsi_ccg_of_match_table,
 	},
 	.probe_new = ucsi_ccg_probe,
 	.remove = ucsi_ccg_remove,
-- 
2.25.1

