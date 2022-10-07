Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2A1C433FE
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 08:45:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbiJGIps (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 04:45:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbiJGIpq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 04:45:46 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B264E855;
        Fri,  7 Oct 2022 01:45:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxpE18tjgggGNvXYApGzNi1nBN+Eo+y+PhBGVU7dXim34UOthCSHDgxfAZ3XbqbJBuGwR82Bi5aRg8oWG5ytvtkza3mcgjP/ZkULuQHpWF0cTvH0jYkPMUCUGKysEEnNhSqk8T/VaruATwDHiRRj6jfKE8si+lPtUmCYSOX9AWJe2CUdqZJOho1Dp4U3wPUzzpuaYco5MPBXyeh8icwxbCMTbGKJBgix2h1dHs5K92rrAzF96FtbZsrr7JSd6zBF3GbeLjeUIXHScZMCs9lTXRPoTvNhPB2Y+ab8IlEo6444DZi/V2PXZr1kLz95EAzSQDPIQtEHP2EDuwqJcd9QTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQzNQ4zCElsL8rYunqBXqrdWfbReaDfyHLpjcfqC6rw=;
 b=kLqSSeJXcPGdciBDZ5IqiMi36jeUUdTjykqRlqJaPuVBPzAd0rw74KFE6R1TuuvuxPPAD6bhOtjl3JfwRrZLJ32C9CxvwXy6nGKTgywP17P4nxE3HZ8x2smuj+KIhinnfpViE04iVtD+PuKU6huI9eB5Eqj5Wroc0Spnr3bv7Xj71AD+MUYRlXvflReUv2vYxBNuotFnnl79bSITjHCvEl4t2eLI+8raEekRElXQ9OmoAyuxt4FYJo7NmP2YWWBGYWnRiPorvqxvb+Qx/QmYHEdBWWk/BdsMb/9mQvQ9kkAf3bawRqNQ2548lBKw5YHMhZtUz8MjnxuyE95NYpuk6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=baylibre.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQzNQ4zCElsL8rYunqBXqrdWfbReaDfyHLpjcfqC6rw=;
 b=s5J1BHh363eoC6j8c1tlGt0FVsFTIUEKl3cDJ3zqWJb/dQNVTW5sQaQpms+j0UL+oaoiH5ITde0imNpgBwkZfHmGOhGuwo/A6GwF4ovYxC71qQcwYssKencTL82AR/52Y+MHlu3uhYw9lha/DehmiW8bHDv2WZBQl/TAALfL4TWFjdb+en07xadIphPvU4vfmbzURZiTCdBpV7IOSDSeomCKAVFUH4OqHsWVvOFV317Ir7ZaTGWfV0vMnj5LE8MYKyJ9QOOsp2yDG0sjZ4DfZOXcU2q2gCNEfn9z3bH4NCy/FobT7PaIbtLLHWsy5z4bzhZApirWSQBpV3lwA6AoJw==
Received: from MW4PR03CA0183.namprd03.prod.outlook.com (2603:10b6:303:b8::8)
 by MW4PR12MB6777.namprd12.prod.outlook.com (2603:10b6:303:1e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Fri, 7 Oct
 2022 08:45:41 +0000
Received: from CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::18) by MW4PR03CA0183.outlook.office365.com
 (2603:10b6:303:b8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24 via Frontend
 Transport; Fri, 7 Oct 2022 08:45:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT029.mail.protection.outlook.com (10.13.174.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Fri, 7 Oct 2022 08:45:41 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 7 Oct 2022
 01:45:29 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 7 Oct 2022
 01:45:28 -0700
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Fri, 7 Oct 2022 01:45:26 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2] clk: tegra: Fix Tegra PWM parent clock
Date:   Fri, 7 Oct 2022 09:45:24 +0100
Message-ID: <20221007084524.10712-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT029:EE_|MW4PR12MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ed2b39c-aabe-4589-4897-08daa84050f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nhnRufT1eNbGMrmuF4OMyWTm33+S4yqqEtN/NmbRwR4V4n9n9rxn7Z0g1sFl5rmm/VclxwWs3aSvQ/pXXtO1W3PvA8vbQx8Tui8ayHUX+nzD5UpAm41aSzPY0SW3Vx04frdP5hnB3kGI5aRYF83FxQ/nYMJBYFsbHd8Mdj/FNeU+Up7ZouMWNsnzbc5Jlj7u3VzVU1abyVmeOQVqK/lcRekJG6gdc0X4opsCACM0sl/1es68M8dqZd3yI097ut17ANFyJfoCwfp9rHvCug5hl/zDZfopsEKgtjX/atalzDiBS1eTEjbRA8AmeFts0JPWvsUiJaZV/IcRxuiY7osD3LWerIEMCrjriqXp7QB6+zjJf4YW6S7CnKTBmnEmERlnbJ7YOcTNWLzhnC5nRWDdqlYqV5LklMfdJuWhzlYvmqxNWngLL11jhJ4b3+r5LqsEcIi2OyM5inR+67ZPCKOG1HNyDezWRylQG3enipZnCBOWbGZQhqc0JwXMre+D1wM2/6bbDpv/SNOnNzFGhhEQPbn4sw4FPF+MXBcamcjtHElRqweBnl7bkSlZquJPU4LcKC0ErBEjuDM0vOF3kkNwBsGKblFAr4can8zHkv8DdmBCEkJzFFeasCrv6pgc6lLE7HzD6/roT+GTyKJsWedeZJx7s6wI/S2Qytqc3tJHrN5xLesRfXdMlVMW2Wb+3n6iXBhaFXlcs/02EcI4f3YnaqAuNSKcM+3qjELggJPVLiJCCZVzGjpOkZIsi7FzBfVFYfn5UH6tWHz19gXIBBOvnA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(47076005)(426003)(83380400001)(82310400005)(36860700001)(36756003)(2616005)(336012)(1076003)(70586007)(7636003)(86362001)(186003)(26005)(7696005)(8676002)(356005)(4326008)(478600001)(2906002)(5660300002)(82740400003)(107886003)(8936002)(110136005)(54906003)(316002)(70206006)(40460700003)(41300700001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 08:45:41.5296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed2b39c-aabe-4589-4897-08daa84050f9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6777
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit 8c193f4714df ("pwm: tegra: Optimize period calculation") updated
the period calculation in the Tegra PWM driver and now returns an error
if the period requested is less than minimum period supported. This is
breaking PWM support on various Tegra platforms. For example, on the
Tegra210 Jetson Nano platform this is breaking the PWM fan support and
probing the PWM fan driver now fails ...

 pwm-fan pwm-fan: Failed to configure PWM: -22
 pwm-fan: probe of pwm-fan failed with error -22

The problem is that the default parent clock for the PWM on Tegra210 is
a 32kHz clock and is unable to support the requested PWM period.

Fix PWM support on Tegra20, Tegra30, Tegra124 and Tegra210 by updating
the parent clock for the PWM to be the PLL_P.

Fixes: 8c193f4714df ("pwm: tegra: Optimize period calculation")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---

I have tested this on Tegra210 and boot tested on the Tegra20/30/124
platforms but please confirm if this fixes all the issues seen on these
platforms.

 drivers/clk/tegra/clk-tegra124.c | 1 +
 drivers/clk/tegra/clk-tegra20.c  | 1 +
 drivers/clk/tegra/clk-tegra210.c | 1 +
 drivers/clk/tegra/clk-tegra30.c  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index a9d4efcef2d4..6c46592d794e 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -1330,6 +1330,7 @@ static struct tegra_clk_init_table common_init_table[] __initdata = {
 	{ TEGRA124_CLK_I2S3_SYNC, TEGRA124_CLK_CLK_MAX, 24576000, 0 },
 	{ TEGRA124_CLK_I2S4_SYNC, TEGRA124_CLK_CLK_MAX, 24576000, 0 },
 	{ TEGRA124_CLK_VIMCLK_SYNC, TEGRA124_CLK_CLK_MAX, 24576000, 0 },
+	{ TEGRA124_CLK_PWM, TEGRA124_CLK_PLL_P, 408000000, 0 },
 	/* must be the last entry */
 	{ TEGRA124_CLK_CLK_MAX, TEGRA124_CLK_CLK_MAX, 0, 0 },
 };
diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 8a4514f6d503..422d78247553 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -1044,6 +1044,7 @@ static struct tegra_clk_init_table init_table[] = {
 	{ TEGRA20_CLK_GR2D, TEGRA20_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA20_CLK_VDE, TEGRA20_CLK_PLL_C, 300000000, 0 },
+	{ TEGRA20_CLK_PWM, TEGRA20_CLK_PLL_P, 48000000, 0 },
 	/* must be the last entry */
 	{ TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0 },
 };
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 499f999e91e1..a3488aaac3f7 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -3597,6 +3597,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA210_CLK_VIMCLK_SYNC, TEGRA210_CLK_CLK_MAX, 24576000, 0 },
 	{ TEGRA210_CLK_HDA, TEGRA210_CLK_PLL_P, 51000000, 0 },
 	{ TEGRA210_CLK_HDA2CODEC_2X, TEGRA210_CLK_PLL_P, 48000000, 0 },
+	{ TEGRA210_CLK_PWM, TEGRA210_CLK_PLL_P, 48000000, 0 },
 	/* This MUST be the last entry. */
 	{ TEGRA210_CLK_CLK_MAX, TEGRA210_CLK_CLK_MAX, 0, 0 },
 };
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 168c07d5a5f2..60f1534711f1 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1237,6 +1237,7 @@ static struct tegra_clk_init_table init_table[] = {
 	{ TEGRA30_CLK_VIMCLK_SYNC, TEGRA30_CLK_CLK_MAX, 24000000, 0 },
 	{ TEGRA30_CLK_HDA, TEGRA30_CLK_PLL_P, 102000000, 0 },
 	{ TEGRA30_CLK_HDA2CODEC_2X, TEGRA30_CLK_PLL_P, 48000000, 0 },
+	{ TEGRA30_CLK_PWM, TEGRA30_CLK_PLL_P, 48000000, 0 },
 	/* must be the last entry */
 	{ TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
 };
-- 
2.25.1

