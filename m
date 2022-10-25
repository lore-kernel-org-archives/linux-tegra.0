Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BC2FA3741
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Oct 2022 15:41:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbiJYPlx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 Oct 2022 11:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232946AbiJYPlw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Oct 2022 11:41:52 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39A1C4A117
        for <linux-tegra@vger.kernel.org>; Tue, 25 Oct 2022 08:41:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNJga98uyBWY6y0djNDLbn41Sh8pBLIw9Nw5xVizF0g3izPkio7R3SuGRvDtz1BdztSvkEtxT/5CPQ9kvM169bRmhHLpNttUSb21QENuvZRTmVVA3VJm+/uHMhd7379oI2nD8hHHPHjpJlKn7SznOfC2q6r/R8dbfcJlmND2xV3fyrWJUM3kwMxRk+FEQTu7FtnxNCqT2eUw2pCavYm+Iuc/aNixOwWGPe4RNwOHX8GMbUNwp5jBnC9tnhwFaOQke/5ljQOqo9/hoFfnzajwvUPZnsoUm027BailhJe/A0e6A1lHeHBuM/ehuKiHKrPUnAaNFaqvr4MgoaYX9II8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmeHRL4IKfWkde/DC1MalL+pQlFS6qwpTCm04SuN6Lc=;
 b=J7caNARz5bA0uvWl+O4q0gIo/dw+Gh2Z66fBbKilzeqfWLnbO5VBsR0u3ySvwM6ywwpiOtM4bQKmc76AsH6n7HJBc1GO1ss49DCLZqTqnX/E7+ekm8XtIJ4PeqrZtTCvB5RpC+xnfojymE5d4w63JnDoyfRfkzrOtfhijXEQagIVwKRW0M0EyU5Ptq7yx+MMECCJ19SXtVvVStrwPy1VXTCg37uMc78hvg4siKbXsjw3MSOy3F6kooIZJvEPPryPhq/7p2A86/rwHu/gRi0voMj7dfgYLrHustuKJUQuV7taKR94PQRr1cISldVIBeHYJfo2cmKNIv3nCCIc6FzSlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmeHRL4IKfWkde/DC1MalL+pQlFS6qwpTCm04SuN6Lc=;
 b=BgNqPmjCaICkxCWbNcFaKSjF0ZzmbAFG4PY63ZgLikWBaV2Eggxc5MZ6GjDgd4Jy87nJpmWR3G6eEHPhmhRLBxLqLxWHq7rr9yvIwr/qoDKDaEWEuBh1JYSaC6WdArOYnR4xjzW+cmK9GLXZpBQLuMQG1vfdnSsIy1auIuCTXMPmbWcfzn2O/JHRWPFA7VCRMErnNrquGQUJHUmhobUiO7fdkFyrSfNultLZgZtE6lsqvfyhDqqEc3EbYBHKnE1U/6BMAw6ucr6Dwfb30T5pH6PSQ7yj4rvu0LEw/yXO95h0vR9PbBvGssA+e6Bs/ui4Z+baWduPHLvT/vIQjsO+tA==
Received: from MW4P223CA0024.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::29)
 by DM4PR12MB6615.namprd12.prod.outlook.com (2603:10b6:8:8d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.28; Tue, 25 Oct 2022 15:41:49 +0000
Received: from CO1NAM11FT071.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::49) by MW4P223CA0024.outlook.office365.com
 (2603:10b6:303:80::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Tue, 25 Oct 2022 15:41:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT071.mail.protection.outlook.com (10.13.175.56) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Tue, 25 Oct 2022 15:41:49 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 25 Oct
 2022 08:41:34 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 25 Oct
 2022 08:41:33 -0700
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Tue, 25 Oct 2022 08:41:32 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] soc/tegra: Enable Tegra186 timer support
Date:   Tue, 25 Oct 2022 16:41:31 +0100
Message-ID: <20221025154131.43418-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT071:EE_|DM4PR12MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: 8347a707-c74f-43e4-f112-08dab69f6e6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c7BLjm5OLyC9wSuPlh6FsmQefXEcMYl86JSF83xHv7eKLx/OXtcKF7L0OCa64/sZ5bhQZiY+HinneyX4UpgoA8MUSpkA/FUsdRGMQoLcyTp4O+DfVFalAWNgk7w8PUV/u0ljizAzHslhuTFIkdl8pOZAoDcnVHoEVHl7v8HV0tTv3HGoyXFisPfxGSrajxRPtNa7yYIL/p+R9MqqUxySRWrGAB6jeoCXd12aGgE7ODowmbrkIh3tccmciW79+frL2oNcUDmvoK7UjelAzTdhRxGXLOnQgP/pCI3Hi1yNwX2pZwzwYu7Xc2zKgs+TVRyu71iC9tIgH/5YEFuPmPFanQhefJWfJsrTyA8RU0AH7fAVYO3+TnjqpKKeHOn8nmBqmIZHTVNyICgrnyWq99Tilpxw4+L528weMSXmJKqgDFBBbp4wFzOTktPgPx1y8fwnF/uhczPfJdPQyqWwNeWI8t93gy7h7rGPa61Ln1RiN0ckC4VpNAq0jnmcwvukcyWtiVXy5jRyVLZjv94BGcPeGb118X1ruzZO8ozaS9w9BT6cRdOHi7HW+fLhRv7uDWLAOOBC4nVsZHYo0dcew9i8OzaGZUgBt0vtbaBGwMkdOkPfn+/f9LasaEtXzoRxq5l+6qWujdG+XhU2XOTD4S4crRUxbKEUrJVC6LbZ3dwYiQbdpRx9XRu7Kg1PvboEoC/pcX2/yVakJtT7S6nEPGpGaU3hUs1dc2wCvHCdS3fcWvj+cgFUNsVn81JMJ3gHpwgELgyJBvkMKqnV1m5XRmGlfQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199015)(36840700001)(46966006)(40470700004)(70586007)(186003)(336012)(478600001)(70206006)(426003)(2616005)(41300700001)(356005)(1076003)(2906002)(4326008)(82310400005)(8676002)(7636003)(36860700001)(54906003)(6916009)(47076005)(86362001)(316002)(40480700001)(82740400003)(4744005)(8936002)(7696005)(107886003)(40460700003)(26005)(36756003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 15:41:49.3472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8347a707-c74f-43e4-f112-08dab69f6e6c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT071.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6615
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable Tegra186 timer support for Tegra186, Tegra194 and Tegra234
devices.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 5f5324294636..e49409b85a39 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -99,6 +99,7 @@ config ARCH_TEGRA_186_SOC
 	select TEGRA_BPMP
 	select TEGRA_HSP_MBOX
 	select TEGRA_IVC
+	select TEGRA186_TIMER
 	select SOC_TEGRA_PMC
 	help
 	  Enable support for the NVIDIA Tegar186 SoC. The Tegra186 features a
@@ -115,6 +116,7 @@ config ARCH_TEGRA_194_SOC
 	select TEGRA_BPMP
 	select TEGRA_HSP_MBOX
 	select TEGRA_IVC
+	select TEGRA186_TIMER
 	select SOC_TEGRA_PMC
 	help
 	  Enable support for the NVIDIA Tegra194 SoC.
@@ -125,6 +127,7 @@ config ARCH_TEGRA_234_SOC
 	select TEGRA_BPMP
 	select TEGRA_HSP_MBOX
 	select TEGRA_IVC
+	select TEGRA186_TIMER
 	select SOC_TEGRA_PMC
 	help
 	  Enable support for the NVIDIA Tegra234 SoC.
-- 
2.25.1

