Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62099C6FD1D
	for <linux-tegra@archiver.kernel.org>; Thu, 23 Mar 2023 13:13:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbjCWNNs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 23 Mar 2023 09:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231501AbjCWNNq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 23 Mar 2023 09:13:46 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19C266EBF
        for <linux-tegra@vger.kernel.org>; Thu, 23 Mar 2023 06:13:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OG5RbPn8jzhwcgZmDlzGGCgs2y+VYyq6xEVc7zUplBFL+kMzaSjNpEEKp0FrHzUbncTUSe3J+HS3jNO4qD4fpwvvtDZVSKdw9B9t9ZJX+IaRSnQFiQ5APXZR1I2QOVaLBO4gOHYSXq+n/5Tfbw6j6bXP4f+SdZyhL6zEnTAMRRhFmfXk6OyoZ9OlriFUwRc1ffTvGrqMpyYHsAWNAeIlaZ8Nr6cfbQWiiCDVOKXps8tWmncGmM7D0yxsXDifRXv4nRULw+tvqJfrRC3DT3j/t2d3X3GuXxhPI8rvwlSXxER+my6+zcMps62ENM3iubqwixwxA7RCUEAIKySHShjD9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrLH0XoRWNG2aaOdEHQo22fifq/w8Jufvt6HGNwY9ls=;
 b=UasRgAbxukNDrp6UEY9qM42h23nVwiapxjtgdrpV6Cd2nFjPzV//+stiZzCTwwKZ1L/44wU+TQKyYVDAXMixWdB79JYP2AWBT1lWyrA0sqrSIIvxQTMWVi9pi4cA9gq6UcPlQJ62Y4f/jloU/ptmOy+m+20CBZuUbj0CKYTHJiRXj+ANc/On62EeP8zQvjNIPGoMk3q3sYqsMs8FbDbIdHRYqnzysMlDDVcuMwT+enqxjTVISBLwKRnjUtJoU7BlvzZ+IPK6k780IYkPOWMnfiKU40UNX+Qpmvk3Ybzn9EcJNo3skD924w9VyWm1akp2JInJpPrWw4cvTUEoGlKScg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrLH0XoRWNG2aaOdEHQo22fifq/w8Jufvt6HGNwY9ls=;
 b=TzQEC1w/PajCKo+KoNiQ+21sjhjwLY92ULalkXiQ5D85A986HzssagKng5m+SdmFLgwbr6fWgty6zCazry6+oviQfCV9aYp6DoPZ6r+suNWWq5Rvb3t354hTYaHKBiOfiDxFuM0LHrYYmSYqnAFoSNX7PtQhGxLmTSsiKMAUDl5zwIHaY5lUu5CUdhCl/kUmnHs1E0QVtInS3UJmtPqEMJdEkWiiU1OAeAHJy3WiqM58ROoSin5L5OniYxwgBXPCSfhKljx+nP17LIVhV/mCkpprkle7YZlGvPPWTy2b9lzXyIg8jB40ivCU5hEHGn8mxgkq3NXMuxosJRgTUgA7fQ==
Received: from DM6PR03CA0100.namprd03.prod.outlook.com (2603:10b6:5:333::33)
 by CH0PR12MB5060.namprd12.prod.outlook.com (2603:10b6:610:e3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 13:13:40 +0000
Received: from DM6NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::55) by DM6PR03CA0100.outlook.office365.com
 (2603:10b6:5:333::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38 via Frontend
 Transport; Thu, 23 Mar 2023 13:13:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DM6NAM11FT079.mail.protection.outlook.com (10.13.173.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.21 via Frontend Transport; Thu, 23 Mar 2023 13:13:39 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Thu, 23 Mar 2023
 06:13:30 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Thu, 23 Mar 2023 06:13:29 -0700
Received: from ubu1604-desktop.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.5 via Frontend
 Transport; Thu, 23 Mar 2023 06:13:27 -0700
From:   Sushil Singh <sushilkumars@nvidia.com>
To:     <treding@nvidia.com>, <jonathanh@nvidia.com>,
        <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, <vbhadram@nvidia.com>,
        <sushilkumars@nvidia.com>
Subject: [PATCH V2] soc/tegra: pmc: Add wake source interrupt for MGBE
Date:   Thu, 23 Mar 2023 18:43:24 +0530
Message-ID: <1679577204-8304-1-git-send-email-sushilkumars@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT079:EE_|CH0PR12MB5060:EE_
X-MS-Office365-Filtering-Correlation-Id: d3810190-06c7-420c-aacc-08db2ba06b70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3o5MUsbSmWwmIqdzbTlYHm9x/9jx1TFc6qAre2fc5vG6yEu2QaYw97G48pgpe5h95gSKXGm6AQIugz5lB3vCDNWjLK8LRuvHRo2rx4mKzCt8+WzMTr09+y5YShzpC5jTMm3XPQ262Lvr6d2QHUU4EFdW+pz+6mVtcob4mGsdxcLabH2ig5MkLcnH3N6V3AEBlvkiw8trtR8lPZu6tjP8eBD4pmpM0CybK1RinCOBn2joJCpJZ2X/vxKbGGGimFAxis/yilgoHMT/tf8+58hU0bzqwNAYBzFVCQNqhsX8ZJx9sgcXa49iAyDYO958uauqQORArmLIYjKEAxHQNs+fb4nzyOr0hdJBm1nZdrI305yEJHVRLzUi8MJmbzRHQfJ0Q5X4WpuS61OrVTOTkr784O8PGwEW81be0fUzb/FWKa2lOd9yGifJCTYM+XxnNHUKcwtAIioCUAQs2eOrFY6nxNQ0JHK9jwYuVEcXDt4R4f+st+FIVCI+FBUMMUL4zyisaOV1iByd7u2NR8a2/dIHta3QeXl5bC99mm63PVoMCwsPHK8i+qZtsa5YdKxg2NveGKvkv4ub64FrMKHnI3z2EWs0TqCxvob4wGFTeqNIwFwk8JBykwiYAc2hpFYQNYQXzcoZsl+BougasB+3Bu2WYLalkMaOMNgqVR+IUiVXu865aD1EpK84iriieF1L6mnr8Ts2Eb/SP19xujNkXXyh4jeJdXgKrvBRFkafN222Qs2gFZrM9Lhq/DGZ7R58AyU1
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199018)(36840700001)(40470700004)(46966006)(86362001)(36756003)(36860700001)(82740400003)(356005)(7636003)(2906002)(40460700003)(41300700001)(4326008)(8676002)(5660300002)(8936002)(40480700001)(82310400005)(2616005)(336012)(186003)(83380400001)(47076005)(426003)(54906003)(478600001)(70586007)(70206006)(110136005)(316002)(107886003)(26005)(6666004)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 13:13:39.9114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3810190-06c7-420c-aacc-08db2ba06b70
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5060
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the GPIO wake interrupt for MGBE ethernet controller on Tegra234 SoC.

Signed-off-by: Sushil Singh <sushilkumars@nvidia.com>
---

Changes in v2:
Address Jonathan's comments
Rewrite the commit description
Use "mgbe" instead of "mgbe_wake"

 drivers/soc/tegra/pmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index cf4cfbf..0f3c472 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3,7 +3,7 @@
  * drivers/soc/tegra/pmc.c
  *
  * Copyright (c) 2010 Google, Inc
- * Copyright (c) 2018-2022, NVIDIA CORPORATION. All rights reserved.
+ * Copyright (c) 2018-2023, NVIDIA CORPORATION. All rights reserved.
  *
  * Author:
  *	Colin Cross <ccross@google.com>
@@ -4227,6 +4227,7 @@ static const char * const tegra234_reset_sources[] = {
 static const struct tegra_wake_event tegra234_wake_events[] = {
 	TEGRA_WAKE_GPIO("power", 29, 1, TEGRA234_AON_GPIO(EE, 4)),
 	TEGRA_WAKE_IRQ("rtc", 73, 10),
+	TEGRA_WAKE_GPIO("mgbe", 56, 0, TEGRA234_MAIN_GPIO(Y, 3)),
 };
 
 static const struct tegra_pmc_soc tegra234_pmc_soc = {
-- 
2.7.4

