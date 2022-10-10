Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D131C433FE
	for <linux-tegra@archiver.kernel.org>; Mon, 10 Oct 2022 10:01:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231337AbiJJKBU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 Oct 2022 06:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbiJJKBR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 Oct 2022 06:01:17 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E510E140AC;
        Mon, 10 Oct 2022 03:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cq7Wt1IgURarVLLLff4ukmrD6x5KzgzTuv9wQ5u7RK9OJyX34K0T0qaSLu42dNB28FTwXtfN+mbIfL+T4nJXQErIVKWMX80iD4QeMqb31ObZ7R5peNn9L8TSTdVTRjTonhDlrynEkm8lRbHUAwmPu1N1pbORxNy82vIe9IKsrQpvFcAa+XskemU6zdwJw3M56ZAVEFT/Z/PXlC8tbV8CJXiy5Hq8/pi0k1GUmgrkW8vZWDh/VqZvEvcTx5SeCrNsuVpNS54cyQvNuBuN9nsEWqdiz2JsIkj6Ynm4AdoCxNccEQMYTmmtwtWHpaAD+J5GnONCcPGBUNL8f6dhfRYhIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdAntF8wV9FvTtO8lDTOhqHwrUG01S7N9YRRkKc+ziI=;
 b=GOfBOwNz/INLOqUYq5GXDtJ51ecHDRh4LYWj03a68LUkj93HBEfFc1iv3S7BwmrWHtgaxRDCgR5W4BCPCVXjiGGJoM1x5YEocXi2c+aW/ZJx+HiEs4DjXmGAIzLWlqb4XHaWRud7AQ8Ip6Guibe+Cj1d7gnslRE5YqozqWUC0O/PmRDtfoLbUF9R43byvfafSCIYyRAX2kesOIpfTfSl5Hlp/QxqmCoLRFgmUdBc3u+V309x1Orl32J/C2xSZRNFTOYSvZl9rKjohxC+BjTfcf3jiz+zWgO1f4z5KZ/AwB3H0g1UuJejwDogX0mQJNpZxkfuAbi5j3gxRS7hoGEStg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=baylibre.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdAntF8wV9FvTtO8lDTOhqHwrUG01S7N9YRRkKc+ziI=;
 b=FlS2kybT8UQEWQLfqmLiXwexw9pcbptuJXrG0BrZO8OOmq4MzCe5jAHAtWmFUAoovheu9eT//nYS0T0mVq8AqargE78fJt3FFqr+JeUcNv7oCW1NFpLKkTjqG/U63nLxRLaky+k7XeKm3Q9mH2I0h7CMkfeGLaeIzUB/QudkOZwtQlBJBw5raDrhnrDkfft69sT0+BnpY7kt6li2v/QOWYnI9E64dyMfRBDgSlpwh3wtfRVZ1LnhdSYKF6PYDKG9Xjf1dW2hH8O/n4eCqp0vtaKgawt/7Bi8tA+PsG5dahFWY5N/JN6vcwb4aCVqfcA0oq3gqzRX+UqGpcWM6s5kxA==
Received: from BN0PR04CA0116.namprd04.prod.outlook.com (2603:10b6:408:ec::31)
 by BL1PR12MB5112.namprd12.prod.outlook.com (2603:10b6:208:316::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Mon, 10 Oct
 2022 10:01:12 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::e9) by BN0PR04CA0116.outlook.office365.com
 (2603:10b6:408:ec::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Mon, 10 Oct 2022 10:01:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Mon, 10 Oct 2022 10:01:11 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Mon, 10 Oct
 2022 03:00:54 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 10 Oct
 2022 03:00:54 -0700
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Mon, 10 Oct 2022 03:00:51 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Robert Eckelmann <longnoserob@gmail.com>,
        Antoni Aloy Torrens <aaloytorrens@gmail.com>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>
Subject: [PATCH V3] clk: tegra: Fix Tegra PWM parent clock
Date:   Mon, 10 Oct 2022 11:00:46 +0100
Message-ID: <20221010100046.6477-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT012:EE_|BL1PR12MB5112:EE_
X-MS-Office365-Filtering-Correlation-Id: 861212c3-fc42-4997-df7c-08daaaa65c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r3cIxY0EVxlFA3VcQ/z3Kd+f8qvY1KKBa9CmsiZ9+UfsCuPA13WgkfZMu5OojYR17/CemHhGQxhKugo1NrZs+kA8b9TJombN6Bewq4lU/VIEcQH6dfI8aHnQHTVy9qe2kg4fKz5px+kXocsFCBeZNAifC0ay8jSwm18hI0r8AMj4PLCSArpBKQgKy8KqQcAezerubRXgHI0m8a0kYeKfT4WEta8BVWx1Vgm0sGLIDwX8OrNP5jWel8QZa1eyZ3MG8U92veYU+3T5sWwMjMWkpN+N+UZmd9zjOTuNj1HcfEQL3CwHGWcpYe2Q8zcHm1aHHZ09MuYIXdPycCvz6+gydIqme5HuB29rKoweNnkqab+IDMF6iOMmsmiLLBo2BNULKSiAMz16kTI8dMpdZnbk/gLeWJRxCA4YjTZc4MQRRCExtoP9ptYEfhz/S7PLJIR5cG3I4G5mUkK1+DKU0TaXiZRKaSrwGysKx6MZnPsGRmw6xqZknQAPbElXu2OmSItSWFI+abWdfD2JBmvODzPQK2u2DA12ZvQw4UQ7vPVX8ymvbtnN4AcYPmbODybzgKwkXBCQjNXuPF713sJiIRjNgHOK71/nrHqpyJ1/WZ/jpbnuxOURVKjP+rkFOjzTXOWbRUfrSlowBjCX60komx9v5ar45C0N1DiD4X8dPMGqn/XxaBAlCcS4DI9Z1WR2lSdXcQRyt4lT1JxRk+ILhzJTTWEcbqXnLJXiKRrCRavGZbkQoupwCJkEPbUWh9eh1/pMYbVGdbZ5PWSmfU+qrJLpww==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199015)(40470700004)(46966006)(36840700001)(478600001)(40460700003)(316002)(7416002)(8936002)(5660300002)(356005)(40480700001)(426003)(1076003)(336012)(47076005)(86362001)(83380400001)(2616005)(82740400003)(6666004)(7636003)(41300700001)(26005)(186003)(2906002)(7696005)(82310400005)(36860700001)(36756003)(8676002)(4326008)(110136005)(54906003)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 10:01:11.0611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 861212c3-fc42-4997-df7c-08daaaa65c16
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5112
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

Fix PWM support on Tegra20, Tegra30, Tegra114, Tegra124 and Tegra210 by
updating the parent clock for the PWM to be the PLL_P.

Fixes: 8c193f4714df ("pwm: tegra: Optimize period calculation")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Robert Eckelmann <longnoserob@gmail.com> # TF101 T20
Tested-by: Antoni Aloy Torrens <aaloytorrens@gmail.com> # TF101 T20
Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # TF201 T30
Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # TF700T T3
---
Changes since V2:
- Added fix for Tegra114
- Added tested-by info from various testers (sent directly to me)

Changes since V1:
- Added fixes for Tegra20 and Tegra30

 drivers/clk/tegra/clk-tegra114.c | 1 +
 drivers/clk/tegra/clk-tegra124.c | 1 +
 drivers/clk/tegra/clk-tegra20.c  | 1 +
 drivers/clk/tegra/clk-tegra210.c | 1 +
 drivers/clk/tegra/clk-tegra30.c  | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index f7405a58877e..73303458e886 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -1166,6 +1166,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA114_CLK_I2S3_SYNC, TEGRA114_CLK_CLK_MAX, 24000000, 0 },
 	{ TEGRA114_CLK_I2S4_SYNC, TEGRA114_CLK_CLK_MAX, 24000000, 0 },
 	{ TEGRA114_CLK_VIMCLK_SYNC, TEGRA114_CLK_CLK_MAX, 24000000, 0 },
+	{ TEGRA114_CLK_PWM, TEGRA114_CLK_PLL_P, 408000000, 0 },
 	/* must be the last entry */
 	{ TEGRA114_CLK_CLK_MAX, TEGRA114_CLK_CLK_MAX, 0, 0 },
 };
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

