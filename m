Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75A6C433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  3 Oct 2022 10:16:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbiJCKQQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 3 Oct 2022 06:16:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiJCKQP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Oct 2022 06:16:15 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDCCE2D746;
        Mon,  3 Oct 2022 03:16:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqII3bAlAJRNgZkKdW3mX4xzJExG2hiakTMQtLlEXWnDd+pQ45IG132c4YEpmwNSMG8JjVGdiIhx88mHSuoGE5pMoKL6j2XJf3V9EB+u+MV77l6yinWt3daw+f48N8eRSjTpbGysTFspJ22kSySsNy4HzUcWVFH+k+YTvSfhgk05BlVZbwqSfolzpCHQrcH9Ln7l8rVmKbm9JJ0y5aEIvrROAiqtYDQYQVCCMpKbOqHGkl3HB8ZVI9J9CRVmNX/VEH8AwhXDuxY1Urcs9HFrVVb9pjBv8xUnfvPNjds5Afe5zijvw8PwJxMYXYVlYXQC8os338pZCwH8asWp8+IfKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRIZYlK27Jo02n996oEcTePRcdNiYiwTlNusJbm5MKs=;
 b=Eu9cQ/P6mIBeZPNWxfBIE3DeUyZvHcyuBt34k5OeaLEsMKclj8lV3NntyuXHpa0KdqyEK0YgYsvGc9CxKQ4m5sRLq7rQclhF3UrdlBgqvjhbAXYcIw4kA37FOPkhWfwBoqU8b0mmYmxH/UNhHhtZzsbYJgvnG3jEloe1I/g8GF828PMdmqo2LZVWa/sceCLd5rBb0wQT+N+Ip/YpEcN0tqB+EnB57qoRpwGyvA1aJd5Ybu/3XIy5Fb9I+POEHxHIGWitWrbRjFcbYhLCXnPvp+jdUJb3ePcT6VdCVR7OKIo+WC8g1hmtjEdplgcrhyLG+6OnDoTcVQl3rcEwLfjewQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=baylibre.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRIZYlK27Jo02n996oEcTePRcdNiYiwTlNusJbm5MKs=;
 b=dppiZoFMxjWbBWkoe/tERwKfsTR84kwIPQ6r6e6o5n1SU5WAL1/mPFqwGY9XOnROdhOUoGSWFL4xXxqHy+YY/FZLxwijFxvdgAh0puhIHjqbJjMrP2wWnttnA4FcShELnuuumViDOxwv0uTCFQRmMTW8W0y1bIjTFoGvcmUrwBlenAwvThgHc+EKDjvpbn/06/skdwQ6aC1A208kQ5lylXDcaJb8y3UaYO3HdRGLslfcPM4gldcGwDsKhOPMCX2aXFRvCu4d52N786rda872QFwBCSB5n1RSTVmrNQTWJX6LeeQfMBRZMrsTLEgBRwPFGdcMNnTCFYepKqusNk47tA==
Received: from MW4PR03CA0153.namprd03.prod.outlook.com (2603:10b6:303:8d::8)
 by SA1PR12MB6703.namprd12.prod.outlook.com (2603:10b6:806:253::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Mon, 3 Oct
 2022 10:16:13 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8d:cafe::f5) by MW4PR03CA0153.outlook.office365.com
 (2603:10b6:303:8d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.26 via Frontend
 Transport; Mon, 3 Oct 2022 10:16:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Mon, 3 Oct 2022 10:16:12 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Mon, 3 Oct 2022
 03:16:03 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 3 Oct 2022
 03:16:02 -0700
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.986.29 via Frontend Transport; Mon, 3 Oct
 2022 03:16:01 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] clk: tegra: Fix Tegra210 PWM parent clock
Date:   Mon, 3 Oct 2022 11:15:55 +0100
Message-ID: <20221003101555.25458-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT048:EE_|SA1PR12MB6703:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee31a4a-8780-41dc-ac72-08daa5284c8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LfWga/t3caAe0lMVTWE7vZFIpHnz8lbgmp+DB5RpC57LinwXkT6YeEh5dVZe3k9qyuljfZ2N2MnXjqWI0PE/K2YRpJzKpbjDr8VVA9tlgT6VPLAufQcp5lNX5pekQ+CF8sj3og2tEZULYyy0B07JU2enbipz6dnDyLBWzP3cBFEMZZsKXyutVDs/ln+K3SMsaqf8/pvy9GpE26QjYyv7hAEOv4epQLR7zK4Rz44ENZ7RxiBCsVAL6vMXsAVFQxI7yRjjNlnhvCt1Y9z0PakNmWUmJq2r1QU8NysNgUJ4rK2JYRsplcn+FJwherWr8F/+W7/GTY4VN9bgExNqhJsBnYLLdtMdaEOuvGJ4IAGEk41ziR3WVmKbJMFSZjchP1Jbd+Oi1vkkHPBPTzoQNS2C2ei72l6psdab/T2e4W1QXbRgMjz04TV0Kcju7uPtE6B/JK5e/AQQGqcszUfK39OL/DR7W1M/QcHqIEhDJ5u+bQh4lDsF3UkK+nSeCQtuqhVIZ0d2ZkuwTpoJL+Ui1mMkhKURhrhkwzIfqm2yo5oMp1d2nWkGkwHrU1UJKoR/+puhUmzdv6BgCY+sMVaHTZTbLXnfIrQkP76HsB3/SLC/X8XKgBIsuJt40IJQgHtCulngiAGNJU1jDMJToNqZZkoOKeu6/b1uFc7v05ppDG83hHjegNbTkRgGr1bsLvVAHjLZdXqK7pdPKhN5PGxB0vN+CbQYEm7rkachEawbHyDXhGymDbNCICxFYane5kp9T4Elbc3HfJXkztX8WU/ZcQTGig==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(86362001)(36860700001)(356005)(7636003)(82740400003)(4326008)(8676002)(70586007)(70206006)(40460700003)(110136005)(316002)(54906003)(2906002)(5660300002)(41300700001)(336012)(8936002)(1076003)(186003)(82310400005)(83380400001)(2616005)(47076005)(426003)(107886003)(478600001)(26005)(6666004)(40480700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 10:16:12.6684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee31a4a-8780-41dc-ac72-08daa5284c8a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6703
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit 8c193f4714df ("pwm: tegra: Optimize period calculation") updated
the period calculation in the Tegra PWM driver and now returns an error
if the period requested is less than minimum period supported. This is
breaking PWM fan support on the Tegra210 Jetson Nano platform and
probing the PWM fan driver now fails ...

 pwm-fan pwm-fan: Failed to configure PWM: -22
 pwm-fan: probe of pwm-fan failed with error -22

The problem is that the default parent clock for the PWM on Tegra210 is
a 32kHz clock and is unable to support the requested PWM period. Fix
this by updating the parent clock for the PWM to be the PLL_P which
operates at 48MHz.

Fixes: 8c193f4714df ("pwm: tegra: Optimize period calculation")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 1 +
 1 file changed, 1 insertion(+)

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
-- 
2.7.4

