Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE3FC46467
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 11:18:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbjASLSg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 06:18:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbjASLSb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 06:18:31 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE562717BF;
        Thu, 19 Jan 2023 03:18:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pux6cAfUFNjJWdx8PURYzk/td8GVVpVZvEAKBXYVGEMn1djZeJSOgiQAjSqWy0Q+5txCSx6Use9jVCrxXuDn3RHLbeLcu12rN0dghAwpYFa7toorT1uhDxXl2gjh6sobeHf33kqZcslGb7zEQq13H4gsr6x27zI1kEAPrHrK9lOMkJK9TcaiVM0s3WZftEZH1jsq+kCZh2YAM78QgLBwVOqmnNTS+jwZwS0hkVfi4mXK0sld5JsuTm9vlDSL8NS1rNi6m2sJwQj09Uf4ThFrTapJ1afd99umjgYWu/NjisNUQjtHu5Rdls10IqWCnZnj7hzb2dVF4/CNQ3q3QlFH8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOa4Hrd0m6WE/V7pPGGtZPravUu1oemhysnaPzxV+iY=;
 b=bVfKjPcSmS1PddNls1VDiTNa1W6mIUhvOhMbiRfyxq5zTza5rK+/44vsvnnquddom5P9zl/t1umh31zyPCsoC7iJPK6goTRiHw4W43mkx8CRe0d9cNTVV0CY3Ddka6q12CjZ/BbUL/DNoXM/RMbscANRozgtM+8kO6WPHORJUAlrlsOyMqTEgz+qnyNuqsvGckq42Z4qPTGxOxjzZd+k4dZDl0SaaVKmsUZKaVdi7GRPvsprixLDOHqz5g2jyn9zDyJJEixoXtDkK9wS2+gNLBPckZE5ecQYoOwp4SVr0YjVJbH8iz1Vi1mN+7qON8Xk90XIw9JI+v3E3RzNSUjIdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOa4Hrd0m6WE/V7pPGGtZPravUu1oemhysnaPzxV+iY=;
 b=mySIHqOzHZ+3edDiAe0vO4fa2mQOxvTsouhSpmcA53toZ+fThI1PHzYT/jBqoHQsbh7QVS3OzlRd9C0t3vDx/G/4Pl2y13bGvcjNvo1JyKFXCRr2g6lsblXFd1SdPQVbKjtbPDMFev53dd2+uWTv60Pp2JogYdEW+gh4yDWFZ37at9+URRpZCMIDv7uloo4B53p7o6I4wQhIIIJTQhuoKuVhlbV4+KlD/dt3gtzEL9sVndrLaOcsc06u0MQ0Auk3egH3hKKKZFfCu6WGhEpGP2jr7vf4fAhuUx0Zhz/b7NCqZGVN71B5JpaPJaMeg3tH8RH4maOyYr7yLtYlwdbuRA==
Received: from DS7PR06CA0013.namprd06.prod.outlook.com (2603:10b6:8:2a::13) by
 PH7PR12MB6933.namprd12.prod.outlook.com (2603:10b6:510:1b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 11:18:17 +0000
Received: from DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2a:cafe::10) by DS7PR06CA0013.outlook.office365.com
 (2603:10b6:8:2a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25 via Frontend
 Transport; Thu, 19 Jan 2023 11:18:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT065.mail.protection.outlook.com (10.13.172.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Thu, 19 Jan 2023 11:18:16 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 03:18:05 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 03:18:05 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Thu, 19 Jan 2023 03:18:03 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V5 5/6] usb: typec: ucsi_ccg: Remove ccgx,firmware-build property
Date:   Thu, 19 Jan 2023 11:17:40 +0000
Message-ID: <20230119111741.33901-6-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119111741.33901-1-jonathanh@nvidia.com>
References: <20230119111741.33901-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT065:EE_|PH7PR12MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: e964f827-04fb-4ec9-e983-08dafa0edc92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Lmmb1M2Y2rHPB9lPAQbKVr+sqBWPSna8AdXg5aV6N81TMaCn8F3DhEVH6OZFMiEKMHTKjmUFDOjJ2M7SfToMXdedzxPRESXlE6q43T4W//NTxDBGyMnpB+Xs2IF+OqzsLo7rR/pixhi7Il7lhWHXeTHYYfDP2wO6hzFOjmJtQCsemWUxNOdX6tLUIIOeJNUmF5zjxXK2uxXzrNq0GagqnolZe33gtxE4zHXKhPwd6hCigL9SaY4Hlw5nzHmldRPIVEDv3+/1AQ3U4/Av7oYSnQfghK4eCrw8IGAfZVhmGXf1WKtjI2Gy9y6MxqerBMK2hf3Eus/8abKLDdFRD1RMFK/BLp6i+6GMSGbT/KGE9FCi5BxrVY1mWxLLJuudSK8pmV2M5DglDVfpGhIDRp1rWy/OSSRQOotf2JeLaDYsO7zXlEcUN086p0egWTNsFAYN0lebgDMDsMKFAz78yA9PrAKr8a58OgP5qTFDOboh/oobz5js4BOLJJ9zkIflIODRUPRLcKp3rn4AdP/JbaKM5WPXCrG9xIfxi0i1IAHaztkM3wkUD1hyn9lCYJ5FkSZLa4fp6f1zIVKZHHG/CsCHxvNv1JCR64IrD6Er9bkQgKxyWB3RQkVy335I2R/Wi67F2A3+MkxhzYYJ20sGvLJR/Bmn1DyDdO6Lm3xyuivK2xiU5MA5OHq9HQHLRSN3GAvIjx7+GPkqPJ9yslBYOxUmw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(36860700001)(82740400003)(83380400001)(7636003)(356005)(4326008)(2906002)(5660300002)(70206006)(8936002)(8676002)(70586007)(41300700001)(40480700001)(186003)(26005)(336012)(47076005)(1076003)(2616005)(426003)(40460700003)(6666004)(107886003)(7696005)(54906003)(110136005)(316002)(86362001)(82310400005)(478600001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 11:18:16.2042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e964f827-04fb-4ec9-e983-08dafa0edc92
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6933
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
V5: Added this patch from V3

 drivers/usb/typec/ucsi/ucsi_ccg.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 889a831e251d..0f18b32df8e6 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1358,16 +1358,13 @@ static int ucsi_ccg_probe(struct i2c_client *client)
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
+	status = device_property_read_string(dev, "firmware-name",
+					     &fw_name);
+	if (!status) {
+		if (!strcmp(fw_name, "nvidia,jetson-agx-xavier"))
+			uc->fw_build = CCG_FW_BUILD_NVIDIA_TEGRA;
+		else if (!strcmp(fw_name, "nvidia,gpu"))
+			uc->fw_build = CCG_FW_BUILD_NVIDIA;
 		}
 	}
 
-- 
2.25.1

