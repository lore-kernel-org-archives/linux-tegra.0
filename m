Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72EEDC7EE2A
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Jun 2023 15:36:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbjFFPgh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 6 Jun 2023 11:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236037AbjFFPgg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 6 Jun 2023 11:36:36 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 158ED10C3
        for <linux-tegra@vger.kernel.org>; Tue,  6 Jun 2023 08:36:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CutbXc+avqd/pDuuREuv/5HSeClojp1zKRIYEwsN9nSOIRJ6Ogeb1UvlGrSlz0WTHxDRN8SqY1au7Q12q2N5MLVigxjhRpFD4/fbEe2Jm+WNxoDAWqtZSTBOmjJEYVkz21c4wxJI+Vz72t2HX93p1d/96HJKbVAflrxcCfhUku7XO9w0yUaVBwlx37BuO5sUd2kX6PoMBd3A3T7SuGCCR5eJl+9BjDn9YPbu3qJDEC3KSW4qzCA5kElyab1tJooB8Rrf/9FSMoJ7YsVSI8YLtyAj62DlJ1EkKYHHN5KSZdPDR+gKydrdyJHNr2AJXFPNBOVtxvHKVwYJkI3GMfWkDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHduFIRmAura22Jedul/x7qTo2gJ4nvF6/YYptJ7+yE=;
 b=Fxm4oGF/lR45dbb6acb71qeW/qoEr2DSbmdQcOjMqFtaQBywLBmwxXwV72ov8ETf7ACIIiyHSP35oS3QJ5eBa1wV1YfdrsxP4kFpnZLdzDuDOAaUbEvn4M+ae5AXoCuwOvp0W2FLZUiedc5290PO/39qfsqGtMBSbn8hNUM/y1F7RABeHFKJB1nKp7bhb0ZVyCwsGSQ4PGaBhaz/1X2dvVCokvGluC+30xtzlWz9LL8UsdocQpOJpQtC6+396fAluwsG81xNhIN9cJgZuJ7UuQ11/cFGuLWomGqNz8C/CTOxXZI0AyTJu4TGOnxwGqaelDnpl62poobzCbeuSSI9iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHduFIRmAura22Jedul/x7qTo2gJ4nvF6/YYptJ7+yE=;
 b=mJqfJNGfNUFapftjN4C8zbQzGnKCNeVH4gwdrp8fvcGv0vXfMsKKgq3mah5kBkES2mv8MmjC9Pkbm4E4KY01RoYfEAKy+vB2jFsoRxHVUUYZGc5933i89KNADs2ir1J/63MMYqP1VBBzRcp2LqCt1wi9gsoP+WBFYRgpbmvWQxD1u2bZ4EFEZFlf4GJtFDPGDOD9QWHLYLLj1f/FZCLxU8+hccCr63v3keCYxXgbR/cX2m1oUcYvYgTEwsq30Zy+g4zfHDRLZOVe73NNGx5/vUHK+Txe9E+xSvpI8d43lfxufePz0LysE/UxwP1I6/m0sG36XqPcE8PspyYXKIrhZw==
Received: from MW4PR03CA0187.namprd03.prod.outlook.com (2603:10b6:303:b8::12)
 by PH7PR12MB7380.namprd12.prod.outlook.com (2603:10b6:510:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Tue, 6 Jun
 2023 15:36:30 +0000
Received: from CO1NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::af) by MW4PR03CA0187.outlook.office365.com
 (2603:10b6:303:b8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Tue, 6 Jun 2023 15:36:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT108.mail.protection.outlook.com (10.13.175.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33 via Frontend Transport; Tue, 6 Jun 2023 15:36:29 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 6 Jun 2023
 08:36:20 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Tue, 6 Jun 2023
 08:36:20 -0700
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Tue, 6 Jun 2023 08:36:19 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        Petlozu Pravareshwar <petlozup@nvidia.com>,
        Kartik <kkartik@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 3/3] soc/tegra: fuse: Fix Tegra234 fuse size
Date:   Tue, 6 Jun 2023 16:36:08 +0100
Message-ID: <20230606153608.94289-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606153608.94289-1-jonathanh@nvidia.com>
References: <20230606153608.94289-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT108:EE_|PH7PR12MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: 87c24104-e1d3-41e5-dfc3-08db66a3cc69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pL45We40Vlclhr70LBhDrMqrZMCxYH/D4CNiUKYJ82UDhY/w+s+N/p4g7fxJBs5LutV9a/nBX+tDTy5XXFfMdY+Yh6nimU28bnTymnnjVp3WYxvvtPQM51Ptc4wH3Q5QfM/dtiMmhPaEQ2/ePrZRT/FbR9LXg/Jb/loowu+jB7H6XNEY8rnpzp8YlWr+7SlTp0xVbHnBTKfBXElFfSRrNbwxx21GylcrRZ9/9ttVVQZatk2mCVtWo4reoZ8wBdv0MnfAh+dZoJ7tS29/22yQRrEh7PJGGL2AiJHCc9KmbtTS7onsj92IX5EFPIlDCQQMNt/MGq2PhifFKOH26qIusSqnjJfjAp4NNwcqRAAYx04AooK9exO3mcFx/p2SDq10i2NG5M+FxPldDIn+w7a3eLjk8VkSob5y/SkujCnX3NMM6ExTogK7AKy65PrdQupd00qQH0bK6h3Tu8lm+0eGQCWOhIflAEaE1bY8tHS6LkNLXbqvHDagoAjP5sbS1v6DrdjOe+CtbMHZGl9i+1/TPm0smRPkMho3dy+NLcd9ojUnKxBqj+wyyda7WOf267EYfuR2vihz4x5/0FhvGFKNO7cLVm2Kk7Gj/ETTeLfIK60QIUng/bRo4XmWkdPmXNQohKp2uBNv7arW6xtmxkg2/WiG8bKFhZjnVof1thFlaUZnUheXHyKiG5ZFbXbFWVEqmMqbGND2BypCUUpByiLtB4b1e5HeMd0dQYpiuLFtaTUAzRkFuULT9ysZXw6NyfMc
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199021)(40470700004)(46966006)(36840700001)(2906002)(4744005)(8676002)(8936002)(83380400001)(41300700001)(36756003)(36860700001)(426003)(4326008)(2616005)(316002)(6916009)(47076005)(356005)(70206006)(1076003)(26005)(86362001)(7696005)(336012)(107886003)(82740400003)(7636003)(70586007)(54906003)(82310400005)(6666004)(186003)(40460700003)(5660300002)(40480700001)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 15:36:29.7156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c24104-e1d3-41e5-dfc3-08db66a3cc69
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7380
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Kartik <kkartik@nvidia.com>

The Tegra234 fuse size is incorrectly defined as 0x98c. The actual size
of the Tegra234 fuses is 0xf8c and so update the size of the Tegra234
fuses to fix this.

Signed-off-by: Kartik <kkartik@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c
index 932a03c64534..c759fb7c8adc 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra30.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
@@ -663,7 +663,7 @@ static const struct nvmem_keepout tegra234_fuse_keepouts[] = {
 
 static const struct tegra_fuse_info tegra234_fuse_info = {
 	.read = tegra30_fuse_read,
-	.size = 0x98c,
+	.size = 0xf90,
 	.spare = 0x280,
 };
 
-- 
2.34.1

