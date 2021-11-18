Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB78C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Nov 2021 07:08:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E204860EE4
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Nov 2021 07:08:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243639AbhKRHLu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 18 Nov 2021 02:11:50 -0500
Received: from mail-mw2nam08on2088.outbound.protection.outlook.com ([40.107.101.88]:7265
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243643AbhKRHLA (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Nov 2021 02:11:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfmF+5ZU+5SdQDi8mAs5DM/fzOXExlQ2tqjcczIpkib5EtCb7GqyfIKhIv+ifIGEurS2E2W890dPIXysxuHVv0Ne0aiId4V+lNr9mNZ3wzw8prlExI/jA4c4iKbRWguv7R0oxvOZdIgFO/cYvhSr35SbQQPBMrtLqQtnNbG4GW5B3X36Bj8KTqq74jS+JGIFAgk1DDa3yAE3tvnQ+ml8HT/bn0Ly3G25N6DwJCw0WlX2V9oIgs/frGK6SNNRodEUkZd6VPOyiqatiBca9MBsSeuv1pthTTuP8LCwXKYq7qumRPozB2M6+LrNGL4wUeoZXkhj4TtxFe3I4bIQmf0PbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=seKJXWAwKPt0HlTyQtw9cWNRWo8z3o3zV5fHVffk/V0=;
 b=OUx++er7HMowhUrE9ZtHdKJz9GSPrgg/s2p65NVCtmqMJ9in/sMeZRLsK1RtCJuBY26sdi8Ute5wkTI9dDcqHNcL+P3ht5HMoWJCBq4YDTXUYLF01exWy5zcsVJpKaVJIgkuQWVHagikdtQfLgYlWozkN6/N7fl9dzw4vnY0fKWBERD+FBV5HxYZvzklgb/Z4CX52tpc6ZqeBtwhreN07/4M4rP+DP5ASXs2rCddJbINeGRUbzRSCtx30w8otHeWxCOqKK95wzUUyDdKVyfxJnZglV6wa6Runy+qCWL0xszvX+yGWOn9/eOJiEBTStiDz+IUM5RccLHOKs9K2D3y7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=seKJXWAwKPt0HlTyQtw9cWNRWo8z3o3zV5fHVffk/V0=;
 b=S761Z5+E6NQKkHjuK1f5thcn6NyKd2i+sbW+oaLtN0i9vwYmF/8LrrLV0wcqBjZ09tbN6J8kadUTd9asRHN0ahMqbXeFDawL40uahpC4IQ6ir7DSLoUyyxbtY4ELNwarmZQ3EuwMaDXItk7zz6WozKoKAwFnGY65zT+PmPc+4hFdmhjQj4qP2TKbSLBUO1bI7iiALgysgD+mYwinAva5V2gn9xA2US6dvUiDX9IplUHz+AY2CawNVgBRHqSeaC9j31UZdOd2oQe2iFe4SljugRbfVuQ/h8eSxEeiu7ovgy/jlqFCxFkm+pK1vye2PY8dKDqAz3stxjGc4Vhiy9BJ+g==
Received: from MW4PR04CA0162.namprd04.prod.outlook.com (2603:10b6:303:85::17)
 by DM4PR12MB5087.namprd12.prod.outlook.com (2603:10b6:5:38a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 07:07:59 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::98) by MW4PR04CA0162.outlook.office365.com
 (2603:10b6:303:85::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 07:07:57 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 18 Nov
 2021 07:07:56 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:54 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
        <tiwai@suse.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v3 11/16] ASoC: tegra: Fix kcontrol put callback in AHUB
Date:   Thu, 18 Nov 2021 12:37:06 +0530
Message-ID: <1637219231-406-12-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637219231-406-1-git-send-email-spujar@nvidia.com>
References: <1637219231-406-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79e6bd86-f6bc-4a42-8127-08d9aa622661
X-MS-TrafficTypeDiagnostic: DM4PR12MB5087:
X-Microsoft-Antispam-PRVS: <DM4PR12MB508710CF7962947663F0FD9AA79B9@DM4PR12MB5087.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 68a2v4+RVlSZizGF5mtDMlGnj9HJNb49LDlOKhkHg4dWQ1tYmOLVC0ebfENRlIqoso9uJy4YXq+m1gUDJDs9YLugOME7GNAO272GOSWPqdHwdoDbkTpnWVdEh0YD8LBU6ePdF3Fcm8Zh8DfDq7xtAan97jT78yV+TQM6lJn2pnjaPzRBrllyF/jEdATdrabDJhAHQJZEPeE4ZN2oP0OBSD7BQxpVUYwOwVyr07ZHVx4StM5A96fBuPlgsFbybmR35v0ixEhcEugmCxJxpCWtgJbMu6d/nxuh2MQ03QlOK8yz/8+ZkMO6yFdbb9xekXrAgtsKuWAsdZLAC3u1rv7onbDR0nAU/78lYhx38PNOQonlS/ce3XhY5fqmXWATkxxS1L29c0DlgpqEtcedxqzhM8siDN6vXnLI7bLmtV9T1J+hAc1cwO150zllvJFAKh/iR/oGzrLKqc3bOjqCsZZM8H1x/a/dgqR7Gnpw24dQJu+4cpb8HXfvpfGnK/Qb7qTlGVl/7fOClI5BlXunUbZrDbUupr1hzzdbfQ/RZ11GrjD/tGC5WnutbuXSF9EOflhU1e+QrFVXt5e1346ZWNSgU7L+fA84MsWIYVYaKLoH6W0uuAI5kZK4uKCnPJ6wQ4kA2ZE30/uRGCCpn5gLv44DhCqgpI6MObhAiilj2FXoGmyr6IYBv0CJ7m1qLBLStz/c0XiKljV2OZNWM5GybCX4qQ==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36860700001)(26005)(7636003)(5660300002)(356005)(508600001)(47076005)(336012)(186003)(2616005)(82310400003)(426003)(86362001)(2906002)(7696005)(70206006)(70586007)(54906003)(110136005)(36756003)(8936002)(36906005)(8676002)(316002)(83380400001)(107886003)(6666004)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 07:07:57.5947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e6bd86-f6bc-4a42-8127-08d9aa622661
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5087
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The kcontrol put callback is expected to return 1 when there is change
in HW or when the update is acknowledged by driver. This would ensure
that change notifications are sent to subscribed applications. Update
the AHUB driver accordingly.

Fixes: 16e1bcc2caf4 ("ASoC: tegra: Add Tegra210 based AHUB driver")
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra210_ahub.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index a1989ea..388b815 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -62,6 +62,7 @@ static int tegra_ahub_put_value_enum(struct snd_kcontrol *kctl,
 	unsigned int *item = uctl->value.enumerated.item;
 	unsigned int value = e->values[item[0]];
 	unsigned int i, bit_pos, reg_idx = 0, reg_val = 0;
+	int change = 0;
 
 	if (item[0] >= e->items)
 		return -EINVAL;
@@ -86,12 +87,14 @@ static int tegra_ahub_put_value_enum(struct snd_kcontrol *kctl,
 
 		/* Update widget power if state has changed */
 		if (snd_soc_component_test_bits(cmpnt, update[i].reg,
-						update[i].mask, update[i].val))
-			snd_soc_dapm_mux_update_power(dapm, kctl, item[0], e,
-						      &update[i]);
+						update[i].mask,
+						update[i].val))
+			change |= snd_soc_dapm_mux_update_power(dapm, kctl,
+								item[0], e,
+								&update[i]);
 	}
 
-	return 0;
+	return change;
 }
 
 static struct snd_soc_dai_driver tegra210_ahub_dais[] = {
-- 
2.7.4

