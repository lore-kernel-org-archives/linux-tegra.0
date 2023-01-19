Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73A4C004D4
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 11:18:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbjASLSW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 06:18:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjASLSQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 06:18:16 -0500
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2086.outbound.protection.outlook.com [40.107.212.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19876FFA7;
        Thu, 19 Jan 2023 03:18:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1cuWPSIVa0ruOT23ERLS+Dk0EyfhqcaU4OPyS2IJ+8XeqkF/s6SnIIcmS/vv/wVlWY+EonJ4BUN/QK4JS3Tm218r/+yaXfYIRmpRJaqrKZM7IpzpQJa5t57DTwl3Hxddy5/lORBHuvnoCCPcNKUN4sDfR7opsAq+ncZxACVkizi+aInBZU/AITfex1xMYXO+Xxy/e1RoBHaczUJwkqtm0ZXvXB794u0m7jPnuemV7Az9+Cjwi+fCdQv76b8wvKt9uUNLV/TAdnQW3HmqnFyuNREQxnHV2dNtpDmi0n//p4IT6jLiDh/tujYrI4bGdNGTUYlbuVmXA0uHayR/tVwMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/NawScKYp4/SMypnRWuYjLbfu7LDY71IjBnr6J9xKo=;
 b=aVFK9lZrQBeMlGDc741C3rWRobb6cMQpN9/7t7zh9UBbTMcvAt4G5yOnzk92TUEeDtu7jzBcU6gK8USz+bwNzDN+QlTY5MaEVB8tEOnAE33+vaEsH/C7SWZ+nU4bWykmplkczhF/cs+1IMmtfZwB+vlUA8wHhm+uJGSbHxhUUVusTtIL+Y6ui9z1Fjtl+GZPuA8dW0x2dDq3uteLfxMIN5GqyLpetzf6GqYYZA7+7BY1+4ws5CI9ujE0wFunSxovcpNJiac/qsr2Z043+nkIc2vXfOrNQuANDRKnailGpXRopls3j47pKvqLwp7UApgM/kP4tRGhrdLa4kC7mMQBUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/NawScKYp4/SMypnRWuYjLbfu7LDY71IjBnr6J9xKo=;
 b=J7YUNJDVpohrHEkAkoJW0CLXIUo6UMwX0qbv92X57+yxuREEZhLKCsV1EKsXeEJT0QwWVOyzuGV6fE3xN2MXH0L9RkObQD7jXw4zd7uKb1hwWt0voXe+tyeZPTtYfsPmPZUfOPtT6ihOgm5gQDOtOV6tSI8YE3Jc97omaP7M7sCCA4e6aKoo+Tprw02cevqY0TuURv/CLKDyR7GC+xTY1T9oqV2WvO8HAc8lI9NlMZqJgAHDvICo2jwPDLj0yWbTgSJGfTLFgfVLlp6VWx5xfIPJK1Gdc1VKrtfWH7yssl6pgp5u0K0SdSEAn6zfTSnzhqZjsv84y9/3Zk1YMeU1HA==
Received: from DS7PR07CA0003.namprd07.prod.outlook.com (2603:10b6:5:3af::11)
 by DM6PR12MB4403.namprd12.prod.outlook.com (2603:10b6:5:2ab::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 19 Jan
 2023 11:18:14 +0000
Received: from DS1PEPF0000E636.namprd02.prod.outlook.com
 (2603:10b6:5:3af:cafe::d) by DS7PR07CA0003.outlook.office365.com
 (2603:10b6:5:3af::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24 via Frontend
 Transport; Thu, 19 Jan 2023 11:18:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0000E636.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 19 Jan 2023 11:18:14 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 03:18:03 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 03:18:02 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Thu, 19 Jan 2023 03:18:00 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V5 4/6] i2c: nvidia-gpu: Remove ccgx,firmware-build property
Date:   Thu, 19 Jan 2023 11:17:39 +0000
Message-ID: <20230119111741.33901-5-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119111741.33901-1-jonathanh@nvidia.com>
References: <20230119111741.33901-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E636:EE_|DM6PR12MB4403:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b73c0c-dd12-44e4-b745-08dafa0edb4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fVCoTSwbeJhvk6pfj1TRSfQAM9MKelBxeQ7fqT+rFjhVHMK5HKHAEpgGKmgXNuvr17OzvxK/cDCJKZPXq+TbHw0OsuIOazgB1S2og+P1uJvUY+z9NhjUfNGss4J7JpG6YkXN9C2eh1oKqfL4E7QeDHQi/OPw60UHezCFr+3dUThxIVFAkPk351O/7VMT9TUChxv6TtTef5Wo3ey0Bml+ZyJuxlJJl3p/kS3BYRZ87MDQ0j0uZo0r8BsMtJlE8siikSEsMFh1teQBTspK4enpDgYmQLeJV3hwuH551mV/MPQlzQZMKsVVJYOa4x4iqVkMFfzwxlgtCz5jdvNIV0ozQ5LZhAcm0jLEiK0v7+F/neeeQoaUmJ9Dt9Ki2w8gOrDP8Wh/wIbFw+cGPpR7JOk1KCBRv1lc1cEHMUMAQI9had0MSh3txC5STEcmw9ZF747BSfymjN7nZyszhYwmTAlfznCo0wk4uckvIaz1/R0yvz0MuJOxoxzaXiSxE0oDX15q9zmdJLwPJJD/3wrlWDK97DikEYZtQMBnJoATCwLD9HfU+JrKj4ZebX058Pgi42pPEPv/EbzSJtE3RZCM2MS9rtrk+XihfPowOtuIM0I1w3R+2k7WlnfYkUtkJxaWdoIgx1GhD5KF59LIRwA3DnBjV7NjreaxI4DbuAt8FEV8bLlWOJTHcRnACc0LZ2mquFeRhHJOgyFCveA8Z3hhdqJzoQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(36860700001)(2906002)(82740400003)(7636003)(356005)(40460700003)(36756003)(426003)(47076005)(40480700001)(316002)(54906003)(82310400005)(2616005)(336012)(7696005)(110136005)(1076003)(86362001)(70206006)(41300700001)(4326008)(70586007)(8676002)(5660300002)(107886003)(8936002)(26005)(83380400001)(478600001)(6666004)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 11:18:14.0573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b73c0c-dd12-44e4-b745-08dafa0edb4d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E636.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4403
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

Now the Cypress CCG driver has been updated to support the
'firmware-name' property to align with device-tree, remove the
'ccgx,firmware-build' property as this is no longer needed.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V5: Added this patch from V3

 drivers/i2c/busses/i2c-nvidia-gpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 6d81ea530a83..a8b99e7f6262 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -259,8 +259,7 @@ static const struct pci_device_id gpu_i2c_ids[] = {
 MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
 
 static const struct property_entry ccgx_props[] = {
-	/* Use FW built for NVIDIA (nv) only */
-	PROPERTY_ENTRY_U16("ccgx,firmware-build", ('n' << 8) | 'v'),
+	/* Use FW built for NVIDIA GPU only */
 	PROPERTY_ENTRY_STRING("firmware-name", "nvidia,gpu"),
 	{ }
 };
-- 
2.25.1

