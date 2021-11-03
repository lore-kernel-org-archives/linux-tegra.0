Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA505C433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Nov 2021 13:53:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB32461106
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Nov 2021 13:53:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbhKCNze (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Nov 2021 09:55:34 -0400
Received: from mail-dm6nam12on2089.outbound.protection.outlook.com ([40.107.243.89]:23809
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231955AbhKCNzd (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 3 Nov 2021 09:55:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHAe3Qr65A4Qjq3EH/zhGCNoBa95KGbjBAdWY4OMp+AknAEPpMrPzSBR+kZbsrg1ZS3eSWRP2ndUy2aeN5eHQW7j05ACEo4+kkmVQcG5f4pGmlPSboaXZI06ik8lzlIROL4Jnq+nWeqpX008E6kH5MghTXT2eBy+uRSR1FezrEDWjTBxWhQqmM/CGOiUWbvRVQBumMPjIer7UnalO1jxI8OAvlBj+OVFEF8vXCkWFuIhUjC8qfFhHrF7XMaF/Sej0Yd3ODCX98NS9WxysAzQgrOQw8Bg6zJPFQaRkzp7a38dMHamMVsxWEAK7c/V6T5EXNDNytecJ7z28n84dmJvFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0vMOIiPRrlYKpYg/ZguOoUpePuSqKZ90grpUKBnQNY=;
 b=oUnqAXQWozCI/ZY38PKd6wUxRJtzYlSKpCQ1JXx5wkEolckA4//hIjgjmuvxaHV3JrwMOBhDeaqGi2qYHGI7MCWC1dfqKgGSzI9kiFR6Wfag4+THrSzKEZof1uu4VhiA1E10A3avXHDB9Qzq7kw4pJpXjSYREEA0QSr6CIaoxB4XtOz++hbLZGEfANi2WEvUTnhK+Q3h33SYudqQkCNL92TO1Ie0OAM+co7W8iSbN6it4RMNyVOIMpSX2KMcnhXaG3ybZg2ap0WjmcL//EKO+JMpq7IKRvGoAE49t1qMUzdi74YKTflNklBAHVGkz/a5jL/LL0AGP3RalWarvKhyAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0vMOIiPRrlYKpYg/ZguOoUpePuSqKZ90grpUKBnQNY=;
 b=CpaKPjqMrw3p4cS7jCBiEjaocMippabLRMIOX/29Zu/ewFhYbFL1VWa63maenvA+W7xAjZs+r4aW/l+vfN/iU+kWNu0CThQlIErB9Rsmz93ugDzkEzne9V4+CP4QpluMvS4vvWsvBZQ8No6lgKD1oP3Zgtz9DeqxwK53j8mOXDf7+zSzt0sFuVoLHwTyflz2S1PF1H7lfaEan5z+DjtH9wPTkoD2EYsRRHPsgBt6buOkY0Vl+uz115GyI6dUXh6wdUzol7zPPb6y2BEwlhQpKcwE8Ep/CNZGw3/K5WDmB+OfqtOaf2zgiqRVTOneWddlyRcmoEC7xVZCCIRkzG58Mg==
Received: from MW4PR03CA0329.namprd03.prod.outlook.com (2603:10b6:303:dd::34)
 by BY5PR12MB4289.namprd12.prod.outlook.com (2603:10b6:a03:204::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Wed, 3 Nov
 2021 13:52:55 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::da) by MW4PR03CA0329.outlook.office365.com
 (2603:10b6:303:dd::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Wed, 3 Nov 2021 13:52:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 13:52:53 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 13:52:49 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 3 Nov 2021 06:52:46 -0700
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
        <tiwai@suse.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 03/10] ASoC: tegra: Fix kcontrol put callback in DMIC
Date:   Wed, 3 Nov 2021 19:22:19 +0530
Message-ID: <1635947547-24391-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
References: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e894dedc-ff6d-415f-5075-08d99ed13baa
X-MS-TrafficTypeDiagnostic: BY5PR12MB4289:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4289171646F6F011A38DE123A78C9@BY5PR12MB4289.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dHmFs0gyY8tJvZMzfMlKpV/zoSjngV8DgvM8BvuE/zSOb3cHOQneKkuo31a94ki8jBzwFGrZO9Yc8a9EEL5GLj0cj+yiixJeK3DeRlblINdEK16R0i1fqb6BkX+0HQF/0KJ032nPTBIxDx32LPEluF7AK6s+aRDxn0iNqimfamYbjjhNe3VYT75hsIrobVsv+jCOdan++Q7bpLnLbXnkR0iRtMy+K1ssAcqs0YwgVY4N3q9uSIwoSBDjxZMyaj17TYWoDtpN6AIyOeX1VfxUM2FirU1xSb4X8YagQrg15Vw5XChmOSDs7FdJQiu6SoFFwWUfXRzgs3+MelFcAQMS5z59az2VUhoDRINGSg9z0nLX5TSD+mHjOkj6Dbi17MN+aLIBmYDsU+yxJlEF9PBPD10GZ7FJgtIAvk+mBQpv597+QZHhEXy9ZZyyMSzhD+QOJlCcvTUmTqCye50jiuczRqzIFifC/wUngSar7227vOFwMwTJOsVPudUSfCOTpRK4/ZV3OjqpPwqfZCAFrmJ3JcAJ+RgzGaI5YHG1Mx5c3/AdDRBhLpoLMICzowgnAb9E4c5XFEolfdcJtmkqC8RdO29FBIO+NuiKGz9nxGEuZCZt6+xVGuwlsJ8quYPxa1g5jxrOkhJC7DmVE7AavPsC6KQviCSIJadfeLYtnkG/r/e5o292j++qXNxsMERTj8vSstPeGC/YfLUu6uBwdKjIXA==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(82310400003)(2616005)(86362001)(47076005)(54906003)(316002)(110136005)(336012)(356005)(107886003)(426003)(508600001)(2906002)(6666004)(26005)(36860700001)(7636003)(186003)(4326008)(5660300002)(8676002)(8936002)(7696005)(83380400001)(70586007)(70206006)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 13:52:53.4887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e894dedc-ff6d-415f-5075-08d99ed13baa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4289
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The kcontrol put callback is expected to return 1 when there is change
in HW or when the update is acknowledged by driver. This would ensure
that change notifications are sent to subscribed applications. Update
the DMIC driver accordingly.

Fixes: 8c8ff982e9e2 ("ASoC: tegra: Add Tegra210 based DMIC driver")
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_dmic.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
index b096478..39a63ed 100644
--- a/sound/soc/tegra/tegra210_dmic.c
+++ b/sound/soc/tegra/tegra210_dmic.c
@@ -185,20 +185,39 @@ static int tegra210_dmic_put_control(struct snd_kcontrol *kcontrol,
 	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
 	int value = ucontrol->value.integer.value[0];
 
-	if (strstr(kcontrol->id.name, "Boost Gain Volume"))
+	if (strstr(kcontrol->id.name, "Boost Gain Volume")) {
+		if (dmic->boost_gain == value)
+			return 0;
+
 		dmic->boost_gain = value;
-	else if (strstr(kcontrol->id.name, "Channel Select"))
-		dmic->ch_select = ucontrol->value.integer.value[0];
-	else if (strstr(kcontrol->id.name, "Mono To Stereo"))
+	} else if (strstr(kcontrol->id.name, "Channel Select")) {
+		if (dmic->ch_select == value)
+			return 0;
+
+		dmic->ch_select = value;
+	} else if (strstr(kcontrol->id.name, "Mono To Stereo")) {
+		if (dmic->mono_to_stereo == value)
+			return 0;
+
 		dmic->mono_to_stereo = value;
-	else if (strstr(kcontrol->id.name, "Stereo To Mono"))
+	} else if (strstr(kcontrol->id.name, "Stereo To Mono")) {
+		if (dmic->stereo_to_mono == value)
+			return 0;
+
 		dmic->stereo_to_mono = value;
-	else if (strstr(kcontrol->id.name, "OSR Value"))
+	} else if (strstr(kcontrol->id.name, "OSR Value")) {
+		if (dmic->osr_val == value)
+			return 0;
+
 		dmic->osr_val = value;
-	else if (strstr(kcontrol->id.name, "LR Polarity Select"))
+	} else if (strstr(kcontrol->id.name, "LR Polarity Select")) {
+		if (dmic->lrsel == value)
+			return 0;
+
 		dmic->lrsel = value;
+	}
 
-	return 0;
+	return 1;
 }
 
 static const struct snd_soc_dai_ops tegra210_dmic_dai_ops = {
-- 
2.7.4

