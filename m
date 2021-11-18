Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B58AC4332F
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Nov 2021 07:07:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 223C961B5E
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Nov 2021 07:07:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243573AbhKRHKu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 18 Nov 2021 02:10:50 -0500
Received: from mail-sn1anam02on2048.outbound.protection.outlook.com ([40.107.96.48]:44542
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243594AbhKRHKp (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Nov 2021 02:10:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brMnGcqaEfFfxNaHZeuwVi/bNoXkcXPkGOwUOXI+sDGm7NGpS7fb89Dzu6fSqiUM8iCJDhf+P2Eybt68F+893WlrvWG+QKyefQ1V0JveATmdmp54zwRBxPTD+3CyiKG6sm+VuVRG9rpAUORWzT1we8paTZI41HZwnrt1BJP2fwtkHjuQc2ooQqF+FFBzAeKlEWZ5klwOUKqBoB+Sgq/efEwuaUUq66BdBoHoS6TufVMwZSkqY1za8lGTPUKzwTIwMhBcj0eYpFQ8TdVs+3m+BZ3QRE8PJd57/awwzyr8AoBO3jxDZVItmN70Zus7s6VFNRT09x1tJPoJZAfS29JODg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZb6l6gEMXvJ2FiONZI9dL+tCCHZLLekQ7JCKCcfQho=;
 b=iISs9W4lh9PX3Sd877R75eYbZAmYKIEg4lBMs9c3cVCAtmUE7wL2e5j9EYoYEXm6fUtrbJo4xKF9MB/cga1PgkVDTnv726AIuHR/5gK426VY9cgNN7XHcylkl7aWNzzKBw0dVfNRkrGhFMLsP3zN5RfAOK1S2K6sDPhl0MS5HgchSEgQJLSw4EpqJHh74hs/msa7Rf7l/z03zCFTcWFnJjrpjYS/Xv+We2i/S9/oWZEN7Rx8CXZ5oPlEXJP4BJgAakN78owEYcR1WF22qL04kRHzyv03p+FcZn3UhTT80BMaONYD7Ekhc+IdR+w6eES0/raNnmol49I8YFkJTYbUwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZb6l6gEMXvJ2FiONZI9dL+tCCHZLLekQ7JCKCcfQho=;
 b=D1RBVNqDCFQnfyLl3CHePEAmP5MZdjyUL0n0vkxK8ez4blHeE0pam7k+aneRYfvUZkV+tW3QCZUNdCVhl5M8/ZsbOwOmgAtx8sh6mJQ7FmkBFI6IqdZKp8JXHqW/OmI9hLPmZ1zqtaBYJyYzdiZLRjsaPEotNJLZ/ogKZ7j37xWwSwMHChNg2TWJU+rLsseIb6UOw3JK7uUTrtnTzdFoVa4PD/oYtZ7a2Ay/2IGdW9wQGPrnrnB1ki4HREfuLTv7wPQDHsNBnxrPBrz6O2CVF3r1wM2FUxpgTdIDNymH8jHXD0RXl1JC00eWwDauUIxCidcJel6hjvCa/SgboW+pSQ==
Received: from BN6PR1201CA0015.namprd12.prod.outlook.com
 (2603:10b6:405:4c::25) by BN8PR12MB4979.namprd12.prod.outlook.com
 (2603:10b6:408:75::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 07:07:44 +0000
Received: from BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:4c:cafe::cf) by BN6PR1201CA0015.outlook.office365.com
 (2603:10b6:405:4c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT063.mail.protection.outlook.com (10.13.177.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 07:07:42 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 17 Nov
 2021 23:07:42 -0800
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:39 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
        <tiwai@suse.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v3 06/16] ASoC: tegra: Fix wrong value type in MVC
Date:   Thu, 18 Nov 2021 12:37:01 +0530
Message-ID: <1637219231-406-7-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637219231-406-1-git-send-email-spujar@nvidia.com>
References: <1637219231-406-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f89e23e9-bdc8-4bcb-117c-08d9aa621d8d
X-MS-TrafficTypeDiagnostic: BN8PR12MB4979:
X-Microsoft-Antispam-PRVS: <BN8PR12MB497928623F25F0CCCD72AB57A79B9@BN8PR12MB4979.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HYbrOme+4e0aSr2UIwski6gmO7CAYx+HCAw70bMW/cCWZM6/sQa0KMyklERNQEkaDccqXWJjanZ0Pz0dJXUrnXEggRsOX5Cj73TgtY683Wr60GknW3SnWlgucK3nIdUaTCNX4vpRiZummIRLvAZbcT838ZqOZx83OkVcqL02uI+32HWzbFrFL1D+7khaTEuX/c162OuQzGisLXuCVfIzvqytaboqMD20C/mUq13fqdq7vtGNTxQzNdeL1CdueHGaYmCwIfNqlGb7VXJPPNV2VVnPQpCFkehxQEcNed/pC0biNZHIxXCZruukbDcrjpzr4HkEWNkUlxU2pDCYuLY2Iw14VD3xLx3yeCDLIiB0MUdqSF6jTIaDDTELoJN2VzoI8MSIrWPNvpAwAOBhv13mqvPHvpnSE5J3cvFTCv5l4eVn7CXc1rOhiW5er8MpX7ELEZaaGIkcO8UL5a2tlXJoLn2vgP46OcPhBYPeQap4L3mTueAU/lABHufWjoX7lB4fMohI0YcXMBmwQuLoA+Ic5Gfcfh+uasUsjmaby3c57krgnRBBMbVhXE1Tg3VXZkiR+vDFTbPGONN5lgqo/0A9NofUPMEAAUhPNKtaIWAIJEVZQ5CP2r3ZJvjN5ZJNW8K2UI9D+ZKywez2xzohvBg1aDaAKYnEF0nAG6xwtQxH9DsjEGYBlUvWWj8b6cE4Z40pL8ioyKRClG8WIXulI7dreg==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(86362001)(4326008)(5660300002)(356005)(36860700001)(54906003)(36756003)(8676002)(82310400003)(26005)(47076005)(6666004)(7636003)(110136005)(316002)(8936002)(508600001)(70586007)(7696005)(336012)(107886003)(186003)(426003)(2616005)(83380400001)(70206006)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 07:07:42.7358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f89e23e9-bdc8-4bcb-117c-08d9aa621d8d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB4979
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The enum controls are expected to use enumerated value type.
Update relevant references in control get/put callbacks.

Fixes: e539891f9687 ("ASoC: tegra: Add Tegra210 based MVC driver")
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_mvc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_mvc.c b/sound/soc/tegra/tegra210_mvc.c
index 7b9c700..b7e3170 100644
--- a/sound/soc/tegra/tegra210_mvc.c
+++ b/sound/soc/tegra/tegra210_mvc.c
@@ -275,7 +275,7 @@ static int tegra210_mvc_get_curve_type(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
 	struct tegra210_mvc *mvc = snd_soc_component_get_drvdata(cmpnt);
 
-	ucontrol->value.integer.value[0] = mvc->curve_type;
+	ucontrol->value.enumerated.item[0] = mvc->curve_type;
 
 	return 0;
 }
@@ -285,7 +285,7 @@ static int tegra210_mvc_put_curve_type(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
 	struct tegra210_mvc *mvc = snd_soc_component_get_drvdata(cmpnt);
-	int value;
+	unsigned int value;
 
 	regmap_read(mvc->regmap, TEGRA210_MVC_ENABLE, &value);
 	if (value & TEGRA210_MVC_EN) {
@@ -294,10 +294,10 @@ static int tegra210_mvc_put_curve_type(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	if (mvc->curve_type == ucontrol->value.integer.value[0])
+	if (mvc->curve_type == ucontrol->value.enumerated.item[0])
 		return 0;
 
-	mvc->curve_type = ucontrol->value.integer.value[0];
+	mvc->curve_type = ucontrol->value.enumerated.item[0];
 
 	tegra210_mvc_reset_vol_settings(mvc, cmpnt->dev);
 
-- 
2.7.4

