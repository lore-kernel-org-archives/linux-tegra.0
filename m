Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E8DC54EED
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Jan 2023 20:43:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236248AbjAYUnH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Jan 2023 15:43:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235659AbjAYUnG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Jan 2023 15:43:06 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A8723BD94;
        Wed, 25 Jan 2023 12:42:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jA0S8LoAC3t5m0ZXKZTgJ0nAP6Y2HENqN7UAtVA4z/jY88fI7WCzN8+93uQLaoBjTCftUVOf8f494XFdsh6K+krEibQe5Vqp4myoUiN++K7GSrtmLXOMcAlBpe6VRS1jWAZi8SjGftOlFpsK0VcHBKc062IY5126NgFdKOgf62ud7NkrN0w4Kf2+BpcIfeKp2IgHChj5x6+gOUQRVbg1uTuVERQL7NouN4oN3XVztfKLl353EyWe8cLq5uwdOlBnIHQIJj8V/MOes79hYHn+pN6ghCboXHqZlQyDleG64PQxlbsGYaPXCbY+mq7HYVDZL2I31x4wLmko+3bCfW2l3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePDnBh75bAtDwEjRe0A4ub91Npk6kvlL5RKjDjLYXI8=;
 b=GdDakTuyKDtD1ZDpFAqkyHJ+WjwymIqQhqrkOH9y4jUOXrGlA0tTaUGarEaBcWIEY8TJIda0328wCiVjXhKfbm/GcV42b3yexOBe2CQ1cwNKCwTR7Kb0LruL87plL93KQN/0IAdAxJ/NEJIsQJmYtGGCmW0Rz5Bqpu/p9D04FzQJ8nEQiGoLBLd5lCj1AFVJC0+eGjChTlzANB9miET/V7+0yU3fRdV4jBpEukKKHbwut1CFHYYz2G2ajTWSdoGNVOk4Gy0+BIa6zKy3XgZ4uuhF6zSZG+EHhf4YFZQz5L4EkRWEQBZOelfa5uk73kGhH6HAuq+dlH4hQg7KK3hdyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePDnBh75bAtDwEjRe0A4ub91Npk6kvlL5RKjDjLYXI8=;
 b=uCksqkg+GATe+nHU/5jFj9oqMX570/VWTaVOCSuzCcSbb5CNdvprGP3coJLYLzDbU9L5Neo+3ohzeG7iF7GPnzZoRyyS6HmhJcZLl6+lnQBlpkN+/GV+xw4h4MLl/LKKejlvu/JoNZacgTT5Eq3O8/wByAOk8SuDofot5ccVwUwI1bjYvtRkP59nyZvhdtT/QG03ljY38jJuvvKMMLjkqDlPH/IeiSMmxn8Tz24w8tOl6jdxVpKtsjKNIx0GX7aBX+hoBMcFXkX5qvwNDiMc4De+OyWvVFqVod1snOTdQqL8qz2jRsxRzonuuaEaIJVEG6/KCG+Bg089PuePipdiGQ==
Received: from BN9P221CA0023.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::11)
 by BY5PR12MB4227.namprd12.prod.outlook.com (2603:10b6:a03:206::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.20; Wed, 25 Jan
 2023 20:42:51 +0000
Received: from BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::b2) by BN9P221CA0023.outlook.office365.com
 (2603:10b6:408:10a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 20:42:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN8NAM11FT113.mail.protection.outlook.com (10.13.176.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 20:42:51 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 25 Jan
 2023 12:42:35 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 25 Jan
 2023 12:42:34 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Wed, 25 Jan 2023 12:42:32 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V8 4/6] i2c: nvidia-gpu: Remove ccgx,firmware-build property
Date:   Wed, 25 Jan 2023 20:42:09 +0000
Message-ID: <20230125204211.63680-5-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125204211.63680-1-jonathanh@nvidia.com>
References: <20230125204211.63680-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT113:EE_|BY5PR12MB4227:EE_
X-MS-Office365-Filtering-Correlation-Id: 92435d83-01ec-4d5e-5acd-08daff14ba20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x3Dni1dGETrL6xC5BAtM2mb7t0IzX5+CUAUYJS1skfW83Xbp2mRWDWfvcV4F7TTh4DkKZw2Zcr7mkHhlzg6ulzB+tSnVjPWb2qmc6cxko3HJ0p8Vfnd/ENw9Iife6xmdJgolLo7qOrPM0+hmw7W+t9dGuBQHZho+pnBJShvvIgOvUuMWicugtT/QG3XUmm2gcRL2ZHvtqbjMoGAfPmfsf6NEN+eBmYANR1AQCXhP0mGPNQcLaSu2orK4gjjwB+2QjoyAKMkJJJBA43ta1w+Bwdg0Km3zSCT3I8JqTiOg4P4t5DzWPP10FM08Ln3cLoKoZ0rXpwipw1GWG/y+6tqHqKhjzNYNpBZIsleZWaE0bMExhaJ42kQdIjCT9TWHj1NEr1dqRHa4suAe9j0tVEdVQkijvwoWBx6m4j6wdvHhg99iyZUkuxNGsS3EpAALznQzQzj2QayDSYy/+pYRBctW3VT37nWCWA7Ig+bM9nJWyDm3bfjhlK2bgO9Bs9m3R75PAgDdYNtW5T5Tw9NsIAxdpomi/FwPxCzQVd9MJQrCkXpmOPQHRywdWSUM3f+ABWJwqsao1hOBaCEVuSbYLmFKo3YMMZPzHk3R93d9uxhUZoQJO0/JWcrbaExfkBVUnRtjfOtmDGgUXYV2pMnbWST8+AjrRkd1TKZd0ExTwI4HHLI=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199018)(36840700001)(46966006)(47076005)(82310400005)(86362001)(36756003)(40480700001)(356005)(36860700001)(316002)(7636003)(82740400003)(54906003)(110136005)(70206006)(2906002)(4326008)(41300700001)(70586007)(8676002)(8936002)(5660300002)(26005)(186003)(2616005)(426003)(83380400001)(336012)(478600001)(7696005)(6666004)(1076003)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 20:42:51.1426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92435d83-01ec-4d5e-5acd-08daff14ba20
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4227
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
V8: no changes
V7: no changes
V6: no changes
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

