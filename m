Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2552CC433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Nov 2021 07:09:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E5C560EE4
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Nov 2021 07:09:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243673AbhKRHL4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 18 Nov 2021 02:11:56 -0500
Received: from mail-mw2nam08on2071.outbound.protection.outlook.com ([40.107.101.71]:11872
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243584AbhKRHLD (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Nov 2021 02:11:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGNs+IOGRRkz8D7WJM+zI7KHqbqtRjJM4AuYK6k6P/JPOzNLwm7xrhh2ArARcaKomW44/P6cA7NftLBmpSlJjl+lKxb05QRtW7P81TTEb/QMmTo25DQGLL3d71+MropPqbcwqrnHSKXY6VewEz0pYJu9qC4JE+5nTWtLp9bQDbYytSeMFg/UPP+9X9tOExm3FpbOrvcQZTcii1ywpX4eWvaftDMINOJaVi9WCxEWG8WxDX7R7Mwtvkr61GrGGxdJ+BxY+0i02ACyQxWRglHdaSxZ2r6rYLZBFkve9mt2F2P2B13NH9SHnqoVr14w16kgm1Q7nzt+xvQBUG22dTWzMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CV2x6b6gAZ+bVot2eqGvSzCcoLsmqlxVgN+rM5CthDw=;
 b=OimeooWv3agOeCBNVtIrmZR+u710Jc/8rodbJMJKV9aOxqGV/ywFtiMUJAfYYQHk/ONgRAuJy3V3iUlwnAa0v4K3w+HEyua2mb9ZHxitHPKFjCxvMN+L5UsvyQhUtsqpM/8aAFmtzDkzk/cpK4SKpKKHBK6cPEeW7HbiTa4tBbHqowJFmGWv/f9eBeUQR81K3mugtcocmkoM+Xn6+EUGL/0xbR3x9xlTDknv0yfOou9ihF8Wu2tsalI4iaCZOmAkD8Z4rOTWEeZ2ig0j9cvopMI93QAEdu9YnrneIr/83Zglc91dmqxQ6tvPZTdl7pvWLvNIacHv3HKU7/ipat8dgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CV2x6b6gAZ+bVot2eqGvSzCcoLsmqlxVgN+rM5CthDw=;
 b=o5PcF9mQWd/ctRHEnXoXo36Jm5dX/c5Yn+OEo/zpBzyxevCP1U+BY65x7+pLQIK9mRI79UsH1IHmxZpRFHvvVpepDQp9sHDNpYoRSNbwfyUBsQYz2TLxRbJ0GLZOqhvG7ujNRytuoLQejyx1OqPFbaCx9+k0r2/b/grRWDvdqmH3P3wj1nuqMVxzfsEkVVe/u/89JiALmm2YbIIW54dupIHs8k/ap5JK5AERlVS6WJTyDoxCWiZ0evaFwzW03XOhIZrsfUyW9wX9QyyGJ//6ylzkCFBA9o0h1lfxJNl9CfiVY0N8rZdHiRDTpNJ1PSVQNy8FFcIj4mDMuBMS0ReNlA==
Received: from BN9PR03CA0653.namprd03.prod.outlook.com (2603:10b6:408:13b::28)
 by BY5PR12MB4834.namprd12.prod.outlook.com (2603:10b6:a03:1b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 07:08:02 +0000
Received: from BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::c9) by BN9PR03CA0653.outlook.office365.com
 (2603:10b6:408:13b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Thu, 18 Nov 2021 07:08:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT051.mail.protection.outlook.com (10.13.177.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 07:08:00 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 17 Nov
 2021 23:07:59 -0800
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:57 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
        <tiwai@suse.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v3 12/16] ASoC: tegra: Fix kcontrol put callback in MVC
Date:   Thu, 18 Nov 2021 12:37:07 +0530
Message-ID: <1637219231-406-13-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637219231-406-1-git-send-email-spujar@nvidia.com>
References: <1637219231-406-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 035b8c50-c5c9-4ec0-2e68-08d9aa62284e
X-MS-TrafficTypeDiagnostic: BY5PR12MB4834:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4834B69686FC191311571DE6A79B9@BY5PR12MB4834.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wPdW2a1Ihz5hQULpQC/JSiRHkckq4AWPZjU8zl+pg0jJRBVUji1/gwa7n7rSd0r2JsIxYZxkWSyBmsLJXY1AEf7Kc39xbYdkfr6g8QgQiIyKZA1CIBrTSIQ+nyS7lmXwfUXYbVSbXqR/tI5c/+gHDyadS/+1NlXH4ixlW0fJtci8PQZfN0LdHbGULp4cx3V5QJvehkDbIQwmV/KFZarGaKhZ5ONUInCttz+nsm0zurG+YddzISzzjfTilJjmK9Td7CCI7osL6EDp24RvOWAKnYvsZytcC/zlZzj5KgHKU0vaD/Wn6Pc1dyHIwAs7QN0VpJ4CTwRpTKY/Uon251g8vwp0jURUzcXH+CjthDJ1hfTdLM7jaIaLudIZ93kQZyncGxN7Ww7bPivnUELAGhtPTihyu0EXu/+TRwF3qEQTt5tGJZ6R/ZuW/Klqy4u47iqhO7/P0OB7SEjosgaH/prKU/8AbYXKqJm5XnDP7Xpm2Rc2ARiShoc0RZDQcKsqfxSQ+rGMa19lOsStieCMsfBVujch0cnxtk0M3JFaMLJXTDmghs3JmTcpJQ5aHYgBOYyHrfFellgtsWolkgL6xTUGS0/8hmZqU51+2G8nu1VQcY+s/berlDzy7jtHfooEiHl55/XgWIQcLDxzNzmghFsUptE/CW5Yq1HFjcsOIf/6wOwVdwxyzdN7srVQsR93ASRz+FPVQCabq8JkVRQ5sryHTw==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(316002)(2906002)(86362001)(26005)(8936002)(54906003)(47076005)(7636003)(426003)(356005)(7696005)(5660300002)(336012)(36860700001)(186003)(2616005)(83380400001)(36756003)(4326008)(110136005)(70586007)(8676002)(508600001)(70206006)(107886003)(82310400003)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 07:08:00.7816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 035b8c50-c5c9-4ec0-2e68-08d9aa62284e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4834
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The kcontrol put callback is expected to return 1 when there is change
in HW or when the update is acknowledged by driver. This would ensure
that change notifications are sent to subscribed applications. Filter
out duplicate updates in MVC driver.

Fixes: e539891f9687 ("ASoC: tegra: Add Tegra210 based MVC driver")
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra210_mvc.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_mvc.c b/sound/soc/tegra/tegra210_mvc.c
index b7e3170..85b1558 100644
--- a/sound/soc/tegra/tegra210_mvc.c
+++ b/sound/soc/tegra/tegra210_mvc.c
@@ -136,7 +136,7 @@ static int tegra210_mvc_put_mute(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
 	struct tegra210_mvc *mvc = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int value;
-	u8 mute_mask;
+	u8 new_mask, old_mask;
 	int err;
 
 	pm_runtime_get_sync(cmpnt->dev);
@@ -148,11 +148,19 @@ static int tegra210_mvc_put_mute(struct snd_kcontrol *kcontrol,
 	if (err < 0)
 		goto end;
 
-	mute_mask = ucontrol->value.integer.value[0];
+	regmap_read(mvc->regmap, TEGRA210_MVC_CTRL, &value);
+
+	old_mask = (value >> TEGRA210_MVC_MUTE_SHIFT) & TEGRA210_MUTE_MASK_EN;
+	new_mask = ucontrol->value.integer.value[0];
+
+	if (new_mask == old_mask) {
+		err = 0;
+		goto end;
+	}
 
 	err = regmap_update_bits(mvc->regmap, mc->reg,
 				 TEGRA210_MVC_MUTE_MASK,
-				 mute_mask << TEGRA210_MVC_MUTE_SHIFT);
+				 new_mask << TEGRA210_MVC_MUTE_SHIFT);
 	if (err < 0)
 		goto end;
 
@@ -195,7 +203,7 @@ static int tegra210_mvc_put_vol(struct snd_kcontrol *kcontrol,
 	unsigned int reg = mc->reg;
 	unsigned int value;
 	u8 chan;
-	int err;
+	int err, old_volume;
 
 	pm_runtime_get_sync(cmpnt->dev);
 
@@ -207,10 +215,16 @@ static int tegra210_mvc_put_vol(struct snd_kcontrol *kcontrol,
 		goto end;
 
 	chan = (reg - TEGRA210_MVC_TARGET_VOL) / REG_SIZE;
+	old_volume = mvc->volume[chan];
 
 	tegra210_mvc_conv_vol(mvc, chan,
 			      ucontrol->value.integer.value[0]);
 
+	if (mvc->volume[chan] == old_volume) {
+		err = 0;
+		goto end;
+	}
+
 	/* Configure init volume same as target volume */
 	regmap_write(mvc->regmap,
 		TEGRA210_MVC_REG_OFFSET(TEGRA210_MVC_INIT_VOL, chan),
-- 
2.7.4

