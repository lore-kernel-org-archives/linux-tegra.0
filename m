Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71562C433FE
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Nov 2021 05:06:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 580BF61106
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Nov 2021 05:06:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbhKCFIu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Nov 2021 01:08:50 -0400
Received: from mail-mw2nam12on2063.outbound.protection.outlook.com ([40.107.244.63]:2497
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231208AbhKCFIq (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 3 Nov 2021 01:08:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZO5HZnLJ9wfjnYkml/ds5UL8YXn1fQKbBLrUWu8F54A/fD+e71Jn3/W2pu9RgyWMj9fzCktuf3qkTJ0ei5GVY30EZGsqv9DZYYO5g4GcDFwIJAFMUxGY6LV58JXgFaaWRMXbQ6GM+IfKPLgD80/TA1jzeD1SzMvWY8gnlvmkSbVZAGFqpgddZLTaY3fIuDoVxhnWLsBFsyuq0rD0lcyG99wrDFwv2ZKkSkexeDWHH7nhl9XbiLsRc9GjSiMZu7tAMOAW+8hmyGEi6uPuTvsC/6eLeYY35CELLGD8amE1+vujxQK2ATFJ6LN04UgFoSCHtAnCTwAxPWYZXMNq55Lcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIPhphCbUKWY+QnSK6mE0owgWF+MEU/osPefBYcutKk=;
 b=hozQU57UkYZvPCHSu1F3meQVF4ZRvzL5/vr2+DyTmOK4WoXxacUVv7fsNqqxN5V60gmLCD3iSKSVlaqTgciDFkOQHF2PuaYPg3fYvSJbI/w6+UkexCIqid5CILQNPyerGXcGOB0wSr5aQhdv1AaLbXcs8Oary0AavXZGkBLB9PpWxAqQZ30cAAI2qO1hJjM5InW0S2qnZBt7iaY+Nf3kruYxU35QLJFCJf8BbXmYZqDAHUf3kkB2BGvRYOZlzuDNE28/YyXWJf5zctiso4wsRHRjf2k44ONlDkiisxqu6qro5qG2W8pWkQ4fjqlrUyy5V3y+S3AOBGGN+ygQDMN/Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIPhphCbUKWY+QnSK6mE0owgWF+MEU/osPefBYcutKk=;
 b=c0iiUG3ynbzmMbwEw20e7+Uwh4xelkgzgW9crAgO4BMSQlVSV6zyGuovTEYZjGYI1Kzhag6vaqBKzKKmVcuK6xl97J5VmsJuEAABzkG0Ts6XXGvT91CfpzpLZ7shpwLUTKcNNrambHknSGgCKR5KG53Ge9ZhTnBViIi5+Tg02NGUMtUmR3I5zhm/niecw3dMfebeFw8Vejx3kU604hVjNpUgIvL9+6VXQLmuhzCk7qdjHaxa8oEyT3F8gVwtbLk3gZNcMv7a6Kw8VLlxkzU4suloIW/pSZ0Q5VgHmPkrEvIX2q+NnBmdD8LSMcT708OuBM0dovPygLCx3KF0sPC/ZA==
Received: from DM6PR06CA0089.namprd06.prod.outlook.com (2603:10b6:5:336::22)
 by DM5PR12MB2519.namprd12.prod.outlook.com (2603:10b6:4:b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 05:06:08 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::49) by DM6PR06CA0089.outlook.office365.com
 (2603:10b6:5:336::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 05:06:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 05:06:08 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 05:06:03 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 3 Nov 2021 05:06:01 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
        <tiwai@suse.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 4/4] ASoC: tegra: Fix kcontrol put callback in DSPK
Date:   Wed, 3 Nov 2021 10:34:57 +0530
Message-ID: <1635915897-32313-5-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635915897-32313-1-git-send-email-spujar@nvidia.com>
References: <1635915897-32313-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90056966-5fe8-472c-4466-08d99e87a5c1
X-MS-TrafficTypeDiagnostic: DM5PR12MB2519:
X-Microsoft-Antispam-PRVS: <DM5PR12MB25191C0EC5B565B7167C472EA78C9@DM5PR12MB2519.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VI1o45MjHxQCl+Q46OII6vdZJWPwbZSqQGTa8x1X2LjpiB7L4IvT4S0cnOnqZAqOr0Jai0o8QbQUz+JR11SBqqA09rUlEq9c1AOEfij+qe1EE/QU4kkQMHYm9usQJioYF8P02V1H9cL1NPjWNutxBBfRgZHm3k6f4+P7q/v7yMr4Ijhl+auGWPzF8GFjbhPIkHXSAZprF8K6t3H1U1LDc7M92D0lbVpAZP86XbD1KjPh639hG0MLEDmQQp59UPVWJVdPn/h3BtZ9WfBpds5g0trvf2B4wDZYquQ8+ebFh/06SmgPR2Tavq6xcKjc4DAxvuMFjT1QagkcDMHhfbXziBxADdPVsfzhZ8ZRQ/jC444jbNLYI03v1DYNvYtLkDcPVvPhk/0mQlsFBsDR6ycY3eX7zCga4A1k3cmeEw2IvjgASU+KCXZPGbCDEH2iTHP47Uc85d/1PAIEYUehiUTdfXtv2dsYPX4j+Hht6k79I6w7ppWQmJE+1QLSjhICyw5nzjAhrhux55zr9n4376NRG7wzrtPXn7RS2V2MHfujkOh+pbNBsW8j5G6BlU/0HRKYzJ3mtq0pTYkU7iopDuAIDwtNerSI5afUowu//TqQDbo4c9QVr3ecgbFrTWGd6YyMHN0+m7oxJ+VrHnt2kJQ4YTyugS2QS8nShMUYUNJis1g+fwzomM575eryQ0xmIlMO+ksHBrKGnYeeNWz+DC2bhw==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8936002)(426003)(2616005)(86362001)(186003)(4326008)(2906002)(7696005)(356005)(107886003)(7636003)(336012)(6666004)(8676002)(5660300002)(36860700001)(82310400003)(47076005)(36906005)(83380400001)(316002)(110136005)(36756003)(70206006)(508600001)(54906003)(26005)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 05:06:08.7126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90056966-5fe8-472c-4466-08d99e87a5c1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2519
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The kcontrol put callback is expected to return 1 when there is change
in HW or when the update is acknowledged by driver. This would ensure
that change notifications are sent to subscribed applications. Update
the DSPK driver accordingly.

Fixes: 327ef6470266 ("ASoC: tegra: Add Tegra186 based DSPK driver")
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra186_dspk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra186_dspk.c b/sound/soc/tegra/tegra186_dspk.c
index 8ee9a77..3b1bdb7 100644
--- a/sound/soc/tegra/tegra186_dspk.c
+++ b/sound/soc/tegra/tegra186_dspk.c
@@ -67,8 +67,10 @@ static int tegra186_dspk_put_control(struct snd_kcontrol *kcontrol,
 		dspk->mono_to_stereo = val;
 	else if (strstr(kcontrol->id.name, "Stereo To Mono"))
 		dspk->stereo_to_mono = val;
+	else
+		return 0;
 
-	return 0;
+	return 1;
 }
 
 static int __maybe_unused tegra186_dspk_runtime_suspend(struct device *dev)
-- 
2.7.4

