Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70872C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 10:16:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E35164FE2
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 10:16:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233250AbhCLKQM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Mar 2021 05:16:12 -0500
Received: from mail-dm6nam11on2070.outbound.protection.outlook.com ([40.107.223.70]:33063
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233274AbhCLKP6 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Mar 2021 05:15:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dETwSmy0jxC+6p4kNM93txQCiGFmuLHBgN7SbvZOWX2e/Rr5EwysrVmWJyOF/Vvg9vHqETOjYMBncP1GfpXmG6p8AQsWGXEaZQCTQznRgHx7TIT1iiCFA0eb1A8KLmH5wEDPDV6q1vv/6AEtXNpKeELwkBi3d942aQnO2DxDI7LReN8I7j+PNnqGQuxlnp+wHTr8+xe2U4uqLReLkeImDJM3vh3xux6caemLuS4E3Q6oUKPRWA0yLjfuDZ4o2myK+letOyZ9Y1g3nAQ8K18H2Yx7tAZfWkBqWCFatfGoRphan+ZHvNr+xjudceTClXd3gk4VXO+y2qDgqJOExDg02Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hp4V+wmk3/hb+VtJMOD/xh+rITP8Nmd+cJYI0665ZOk=;
 b=K45niwn5gAG+Mb7e80N7aPCLVtMahz8KVoaBH21ulXR6McB3ZEfn1tiy04qX4YhAdeX1WDKvPyH0iFqzi0rZVUA73s51eyrAy5jltKpoKjqhWHUhkNKvRXq9LnOhLz9uCFMw3w+ukDoIjFR1WAEvvOdx1NaHE/iVdMamndxpg9sy751wQj2hXjbr00qGuQBSxUF/ft39Z1Sd31wYT82tPYvJ8jhM8Nlw8ZtksYNvqJ0LpY/LL/sUS2a6wVLfJ+/UgQDRpNqFxRtPkR2HWXADhzp1uKCfCcHGEF0M/Uq5cEojR4H0uWK/ntqrhTPJ6sE6b2BrmMvD8rxDcAJQL6iR4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hp4V+wmk3/hb+VtJMOD/xh+rITP8Nmd+cJYI0665ZOk=;
 b=bxfiRpGLwVwWDwsxphTNlfLNULqJwa7bD7b8cR8ONrFNkVkrJzBbvT/PDLnGMnJyyGNeqAu1wyT700j3P/yxfNuxeKSspZB43QmDNjOGW5osNGC/uukqyWtkJwc/mlW0t/gIv617Zj+LTTN9DSDvczuRaUkuVGeDAD3YblOMXDi3vst6byMcd0KoxbzfMFD9xqSlFvgDFQNHsqP3539xECFxZxMDfa72of3kz7to9ZoXzD23S0w/Bl7LHn+e/nMlBZ+C8iLeIbgJ/5zA05rv1ardSByo/x1XQxc46MfLLmZssgUtpkfYqWeK5EG3FphMF4KYo4m0KOxOftUc3O93kw==
Received: from MW4PR04CA0379.namprd04.prod.outlook.com (2603:10b6:303:81::24)
 by MW3PR12MB4458.namprd12.prod.outlook.com (2603:10b6:303:5d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.30; Fri, 12 Mar
 2021 10:15:56 +0000
Received: from CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::46) by MW4PR04CA0379.outlook.office365.com
 (2603:10b6:303:81::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 10:15:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 CO1NAM11FT007.mail.protection.outlook.com (10.13.174.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Fri, 12 Mar 2021 10:15:56 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 12 Mar
 2021 10:15:55 +0000
Received: from moonraker.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Mar 2021 10:15:54 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] ARM64: tegra: Set fw_devlink=on for Jetson TX2
Date:   Fri, 12 Mar 2021 10:15:51 +0000
Message-ID: <20210312101551.757457-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef901517-31b6-433e-621c-08d8e53fd332
X-MS-TrafficTypeDiagnostic: MW3PR12MB4458:
X-Microsoft-Antispam-PRVS: <MW3PR12MB445816555F102D97BC55D784D96F9@MW3PR12MB4458.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b06m65CGuqC1Qedrz6L86C0aBpq1nn11Z+6c5mNHeqllw5rBxC5njCSJhcjKFz6ILJfv+Oi+0sAHom4bzmeP0RmrxWLqy5nBKTiYSVPKAQ3QCoSDAThEAp9oIPnems+r+T8sAFcU+bj1WBuLVQQiNFtRpbGsxPr7uj3llkC4Sib45Wy8QCEGuQRtLcFZFvTonfiywbURmvPyvfEoh/HfFTpTjWLyR0nZ+WBzIoxK6hy+xs6Yxn4C8YabuZTzCSr/ajUjox8vxodFBFVEDIaI0+hUa548WR/BdlD3puw+g1zoUPEVgoYkLOkm8YdcEOhVNUwJjvO1ozt5fxdEQGyjD7GIOlwVOc9x0A9vMHWLmt0vMcah0037MsWTewRIQ67G+i7nkcwHmRaGCFd0vz17xCp5WdcfbbJFoxjd40vw8MeBO65vq7dhm8yzqaZNRQ9F2CJJQJKLQaUJp5zHqT4+zAQoQPZjTpzP+EJQ6rKl8wxPqBVAjVjikd5vK/+fR19svatkq2uLke9cuGjbEPTP6zoJNVfN0/an6GebCf2CKKntizhyoSJYoyNmRaEfm0si+j20vq7PLGr2WrU7IhOaBAagJuCrduOhMckAROR8oIYxXOoypVzoMtSmLLalzJRMkuzbnblAFiLPr8jzenJrp2hGAP8gAI8GEyxE2YL4J7Nt/9q+FDSH/B2yZrm4QNmr
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(36840700001)(46966006)(36906005)(54906003)(82310400003)(6666004)(336012)(426003)(2616005)(316002)(107886003)(1076003)(6916009)(356005)(5660300002)(36860700001)(7636003)(47076005)(83380400001)(86362001)(82740400003)(36756003)(7696005)(70586007)(186003)(478600001)(70206006)(26005)(34020700004)(2906002)(8936002)(8676002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 10:15:56.0900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef901517-31b6-433e-621c-08d8e53fd332
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4458
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit 5d25c476f252 ("Revert "arm64: tegra: Disable the ACONNECT for
Jetson TX2"") re-enabled the Tegra ADMA and ACONNECT drivers to support
audio on Jetson TX2. However, this revert was dependent upon commit
e590474768f1 ("driver core: Set fw_devlink=on by default") and without
this commit, enabling the ACONNECT is causing resume from system suspend
to fail on Jetson TX2. Resume fails because the ACONNECT driver is being
resumed before the BPMP driver, and the ACONNECT driver is attempting to
power on a power-domain that is provided by the BPMP.

Commit e590474768f1 ("driver core: Set fw_devlink=on by default") has
since been temporarily reverted while some issues are being
investigated. This is causing resume from system suspend on Jetson TX2
to fail again. Rather than disable the ACONNECT driver again, fix this
by setting fw_devlink is set to 'on' for Jetson TX2 in the bootargs
specified in device-tree.

Fixes: 5d25c476f252 ("Revert arm64: tegra: Disable the ACONNECT for Jetson TX2")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index fd9177447711..fcd71bfc6707 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -23,7 +23,7 @@ aliases {
 	};
 
 	chosen {
-		bootargs = "earlycon console=ttyS0,115200n8";
+		bootargs = "earlycon console=ttyS0,115200n8 fw_devlink=on";
 		stdout-path = "serial0:115200n8";
 	};
 
-- 
2.25.1

