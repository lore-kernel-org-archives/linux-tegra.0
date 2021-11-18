Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0549CC433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Nov 2021 07:07:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6A9861AA2
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Nov 2021 07:07:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243554AbhKRHKi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 18 Nov 2021 02:10:38 -0500
Received: from mail-dm6nam08on2043.outbound.protection.outlook.com ([40.107.102.43]:41537
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243555AbhKRHKg (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Nov 2021 02:10:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1qGA0XtIJ5WtzHLrhy7wbPXS9y5lLBi1zabJntd45r46f6AZYZkt/IkETKxB9lxPfGcqb9/k5WJeFuyTrU9N/1oKhZuGzt3037zoHb+9VU5CqVMF3eVCa9eLYTD6AanEFN0F81iKbOvxb6X90raSqiCBAXfYGxtMF9atY/ijChuyvFqNmKWuDJ4GM7WaOg6QUPeENlHZN6PzncyuGlZ71eHmKk1h1vCuKsO7YDC7CiS/SJXgOhYec2BTlgx3ng5T6ckMRLW9EeLwlYBBdmQmSjgf8gOLNnfvQ2YjEG778Dp/rdNf4gie5KbuOaX+CrFiwAhPhsvYEgUxwJ+HmxVdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mV0HxFpFjFVpO1xM9KtS6UhVlBJntxLrhxEmgLPZpiM=;
 b=FQ8M3+lRZxa03yIO2V4z9E+xbu/a1aamMFRpBjLanzodqB/XWkoD0qqIxeAzOyBSjfKPHOtptVlXUKA/acQNmiLr2DtWU5D+NgHhReoWuhzkGns1WmYKs8LG8jQ0sGRZPUXbdDKcrY32X92eeGyPRZ64VRg+PIx+aY5hsFq6sQ7gRNXr5plz4PJFNl/v1hDG4FrfbeOpfo0WopEFTJnAa5uqA+k7r0zG49rRu5vkzm4jXpa2GF5EnnF9rcJxh1BSLA5tztLp7CPMMAgQxRNjzlwRKAAil7evRpHZTi7N13Uj9X8YzcOz6iewegaoaQmcv4kKp/rartAc+Nz15wNMxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mV0HxFpFjFVpO1xM9KtS6UhVlBJntxLrhxEmgLPZpiM=;
 b=DZfinv6iozA5ZKX7ltufadsJ47rVw68p9e8PYYlN7ImBWZjYzqcy1qrD+Ui3wPTl6m+pr77YKut7/S8rJhUFV16H22NE+VmfKxvUE85iCbZDkdjPp8HKaR4YONrW5A/vEvJ2w1/ksf60+JaCBtXmXIUP6v5Avn2om2+8IioLrc2kLJlaitErTWrRDGErRbg1+rysEd89/A6iC0WWUn4RFh6XuuIAvUnhkPngk6s487bXy9PMxeI8UGTZziEzd6U9cDxbz7PyaFc3jDBPfQ1+yFXOD8ZlWfxSzqHbCBW94h1H+SgD8WKJmgC8llEmQISGd0Y3ZlzUNnfgbNkKDs62Zg==
Received: from BN9PR03CA0934.namprd03.prod.outlook.com (2603:10b6:408:108::9)
 by CH0PR12MB5124.namprd12.prod.outlook.com (2603:10b6:610:bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Thu, 18 Nov
 2021 07:07:35 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::a) by BN9PR03CA0934.outlook.office365.com
 (2603:10b6:408:108::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 07:07:34 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 18 Nov
 2021 07:07:33 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:30 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
        <tiwai@suse.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v3 03/16] ASoC: tegra: Fix wrong value type in DMIC
Date:   Thu, 18 Nov 2021 12:36:58 +0530
Message-ID: <1637219231-406-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637219231-406-1-git-send-email-spujar@nvidia.com>
References: <1637219231-406-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c871b2bb-76ae-4a16-1689-08d9aa621880
X-MS-TrafficTypeDiagnostic: CH0PR12MB5124:
X-Microsoft-Antispam-PRVS: <CH0PR12MB51240DA01DA102E8AB190096A79B9@CH0PR12MB5124.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hjKyJ9xfcPV7Zwnh90TcZ7bG40tp8aKQPkZjx4lRvu+VIA79RvfOwwkfA1EHVVoobaOVY6zt0PwNZ73V+K9LvuhBxcYp3MpslsPViEqtzb2frC0++vmzdagNRZ4TR3T4vFwULFLr2epAnGchlwdNG3kxk3cPYNAL0yPEfPZIyl2mkrneHjx8WRckXJR1kDw2DC/8E528n+PdwYRWNYXse4IaLHYQQPQbAlOkl9ceFbecDtrJGL601hBsDwMe6UBWaxTC/xy0PqQDskJUDi+6R34BHJfrYtt+Ht5NnNIRJCz60AOOR84HwXfAAp0/2klk08FLreBV/Oz1Hk8Cd/nBRJvRlY3VLw7e7eZUobCMJZ+VqIQfpG4jFOmdBrYJS2hzZI5DQrrMV4GqfolHhrvWC6I6yS+YvxhxQvgEoOMJ4Y8kU2k5jqQyBouXJj84fF+MZYdfdtMf9bDWm7TAGEB7WMWdbaJzcQpm5wuIMHgiO+bYps/3WpKLrQN8BylMKS3wg0WAyFMjpB5lpMzLkwopipcfIv12vA4O566W1ciFSLK6cOWMUWYAxbZw52m6vbbhGO8qOBmgcpLgRIldFlOUDQH2mDoqGR3uRDWNJebnaaC+1ot/xVI1SlI022BQBysHtswylkQIUBGM5YLB+96MC5gLK4bvGbdSqotI6N92LWEYxGeon33wtBbHOfV5GKdFF6UpYrv2JjldQZlkOcHJEA==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(82310400003)(316002)(2906002)(110136005)(70206006)(508600001)(83380400001)(4326008)(70586007)(336012)(8936002)(2616005)(426003)(5660300002)(26005)(186003)(36756003)(7696005)(47076005)(107886003)(86362001)(36860700001)(6666004)(7636003)(54906003)(8676002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 07:07:34.2511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c871b2bb-76ae-4a16-1689-08d9aa621880
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5124
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The enum controls are expected to use enumerated value type.
Update relevant references in control get/put callbacks.

Fixes: 8c8ff982e9e2 ("ASoC: tegra: Add Tegra210 based DMIC driver")
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_dmic.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
index b096478..ee2aedb 100644
--- a/sound/soc/tegra/tegra210_dmic.c
+++ b/sound/soc/tegra/tegra210_dmic.c
@@ -165,15 +165,15 @@ static int tegra210_dmic_get_control(struct snd_kcontrol *kcontrol,
 	if (strstr(kcontrol->id.name, "Boost Gain Volume"))
 		ucontrol->value.integer.value[0] = dmic->boost_gain;
 	else if (strstr(kcontrol->id.name, "Channel Select"))
-		ucontrol->value.integer.value[0] = dmic->ch_select;
+		ucontrol->value.enumerated.item[0] = dmic->ch_select;
 	else if (strstr(kcontrol->id.name, "Mono To Stereo"))
-		ucontrol->value.integer.value[0] = dmic->mono_to_stereo;
+		ucontrol->value.enumerated.item[0] = dmic->mono_to_stereo;
 	else if (strstr(kcontrol->id.name, "Stereo To Mono"))
-		ucontrol->value.integer.value[0] = dmic->stereo_to_mono;
+		ucontrol->value.enumerated.item[0] = dmic->stereo_to_mono;
 	else if (strstr(kcontrol->id.name, "OSR Value"))
-		ucontrol->value.integer.value[0] = dmic->osr_val;
+		ucontrol->value.enumerated.item[0] = dmic->osr_val;
 	else if (strstr(kcontrol->id.name, "LR Polarity Select"))
-		ucontrol->value.integer.value[0] = dmic->lrsel;
+		ucontrol->value.enumerated.item[0] = dmic->lrsel;
 
 	return 0;
 }
@@ -183,20 +183,19 @@ static int tegra210_dmic_put_control(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
 	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
-	int value = ucontrol->value.integer.value[0];
 
 	if (strstr(kcontrol->id.name, "Boost Gain Volume"))
-		dmic->boost_gain = value;
+		dmic->boost_gain = ucontrol->value.integer.value[0];
 	else if (strstr(kcontrol->id.name, "Channel Select"))
-		dmic->ch_select = ucontrol->value.integer.value[0];
+		dmic->ch_select = ucontrol->value.enumerated.item[0];
 	else if (strstr(kcontrol->id.name, "Mono To Stereo"))
-		dmic->mono_to_stereo = value;
+		dmic->mono_to_stereo = ucontrol->value.enumerated.item[0];
 	else if (strstr(kcontrol->id.name, "Stereo To Mono"))
-		dmic->stereo_to_mono = value;
+		dmic->stereo_to_mono = ucontrol->value.enumerated.item[0];
 	else if (strstr(kcontrol->id.name, "OSR Value"))
-		dmic->osr_val = value;
+		dmic->osr_val = ucontrol->value.enumerated.item[0];
 	else if (strstr(kcontrol->id.name, "LR Polarity Select"))
-		dmic->lrsel = value;
+		dmic->lrsel = ucontrol->value.enumerated.item[0];
 
 	return 0;
 }
-- 
2.7.4

