Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC2EC46467
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 12:17:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbjASMR3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 07:17:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231207AbjASMRR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 07:17:17 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C921374E9B;
        Thu, 19 Jan 2023 04:17:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdZThOIvl3dUpHNeUjr2n4roOWO9DHvVgeabLvacpM74Ve0bvX0yX24/2hmCQVPx9Cl9p3FSq4nxd8+KBlECQCiU4s9yks9fnEyog35exLNe79RV6uaiTjUWAzmcfUNsxPSWg2Ntx5vxasgduC31pAungHWfvSJw+QvvfzKR/4tRC5c+UGDN5i1fzHR7joM0gn52by6JgPC4pZ5ATr6Mf8c/vEQbrH/yV7Xm6WK/We+4CZSHjRE6aku6119ayGc7zOphSFmqmZefEVj15oal4hlQhlB+wrUQMQekgoGST2S9Uv9NexaeWvx+s5TAk3hQfA4MvtFOybKEm9rZgg5DvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9Zj8l/fSmCBrrYP4n0wsXfyNBrbko7z/znipV0C06Y=;
 b=WHcp3KjUxgsMOi2JaHvQ5jy/g/OO+QS3n18JiePptPxGcgoiI1XE9/tc30ohROtpMH2dpAVP612CdVoQRM4E0jSqGE3ZBMsmV0QWNXH16cOsMMrN7Gfy5gi8aydM+FEioa3APz2cm0LnZHwznsWqR9NzpyIG78D/U0e4SW3OjbTcR+kUonJ1RlM6aEKW8x/FBIfI29c2Eh+1FsUtKdNY87hJwgqNJSKpNGyu8ASgxlJfFq7CRToq0hDD58EvW9NVi5DpFRezh6Tknw+fwOiVeGWCPkpFYUGROWRUivNoM8SjTxXSxWZl9H0TxMnITj0Rjo1r3J18YLaV85WTvmvxyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9Zj8l/fSmCBrrYP4n0wsXfyNBrbko7z/znipV0C06Y=;
 b=on3N6L4C2lKp6UFpl+We5qO7k6Qk5HvFrfB2d9fBcyjRt2SacHm0WK57zIZauJiZdddiGHrsT0qzpyjMSeUwc4ixE+xlEoSXMiOxrpxB2onxhGmaGMq1Huuhunlcx78CAwjLJnpG/Ub7Mx4lnBJF9ZZYDaN8CcKOEnDbRHVU/Q4dTySLp9a8Ff4pRgT5YzPGAR+ZCcCL6b8KtVhhkeb/yaDRG67Nb8vPAXYGiaSRKRLcL+z28tD9JrOG+BOkgFSae+GwUgdKUgMU2wYjwyHUB81PiwOcrc3NJC6Umy4DU/jaL72t/WfWPEhtyo44RYcSh1CCzkNTtqqoXO9gy5OSfQ==
Received: from DM6PR07CA0090.namprd07.prod.outlook.com (2603:10b6:5:337::23)
 by SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 12:17:09 +0000
Received: from DS1PEPF0000E657.namprd02.prod.outlook.com
 (2603:10b6:5:337:cafe::c8) by DM6PR07CA0090.outlook.office365.com
 (2603:10b6:5:337::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26 via Frontend
 Transport; Thu, 19 Jan 2023 12:17:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF0000E657.mail.protection.outlook.com (10.167.18.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 19 Jan 2023 12:17:09 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 04:17:04 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 19 Jan 2023 04:17:03 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Thu, 19 Jan 2023 04:17:02 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V6 4/6] i2c: nvidia-gpu: Remove ccgx,firmware-build property
Date:   Thu, 19 Jan 2023 12:16:37 +0000
Message-ID: <20230119121639.226729-5-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119121639.226729-1-jonathanh@nvidia.com>
References: <20230119121639.226729-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E657:EE_|SJ1PR12MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: 78b97c41-cdc9-4f25-f7ac-08dafa171690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MzBkrec+OJ/PyuqkUkKAYRFYAEmmHW8rc63Ro2At4odG7u6NGZXHuRQKiVScoI5tbjQjtozIqUtfmQYY18FtqaVLEE6f8KvLGDPVblq4FMEA3xmP4J1nmrnxcmm8/BSBGMUDxZ8zX2HSTJL0/yBxXMLFts14CDLI5FcgkLQFEulIfcrdyZaTWlJ2b0DQYo7Nabi+fh1LeDMKZ+dOeu55RfWKDVBdp9FDDmOf+4FfbQII0XcO5YZc0dQ7jkYJ+no4XkV4Mm0ElGOcbSeHaVmieWkvC1RVQzc4RjtKkKWI5q+E4qIT2Tu6hMa3GhGOVQpLAqRIwhs6piw1t3M0xvqMV0Bk1kmMN0zpW/iDAGxSwFSIYFGTtTN7tUNVp3R7epVBB5FaXmOi7WFDOEnpDcaW5VFlM1tBBi0iEut78XFoV0EM+cYibgPfJv9/G3Bo9OQmXc+XNLsx6tAtO/p8454fZ0FLB/MHXkBhZfSUuWpZtgbo+HnjQxLPcE+RdsAKzz9ST55S18NehY1ZAhlBXcO5kBA81Z4s0BgP5AsfU6jh7ehoYBJIeA3EUIkIBftcPKz+KlMa29gEOFyOlTCMPf0p30WlY2spBeDWDAhiV8APPzHowpv6crCkaKzenjNuDlcmDI9EZxhvZoaet8uldfu59X9K96BjB8Y4JMkDXovKY62kfgui2t5PH95fLbvTWM4iDOPccU2hFEhOgQtqgWNcDQ==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(7696005)(107886003)(7636003)(36860700001)(6666004)(36756003)(110136005)(86362001)(2906002)(54906003)(8936002)(8676002)(70206006)(4326008)(40460700003)(40480700001)(82740400003)(70586007)(82310400005)(5660300002)(316002)(1076003)(478600001)(47076005)(2616005)(186003)(426003)(356005)(26005)(41300700001)(83380400001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 12:17:09.4731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b97c41-cdc9-4f25-f7ac-08dafa171690
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E657.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6339
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

