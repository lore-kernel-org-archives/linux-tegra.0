Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62945C433DB
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Feb 2021 04:22:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F375064E3F
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Feb 2021 04:22:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhBDEWN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Feb 2021 23:22:13 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:14477 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230281AbhBDEWJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Feb 2021 23:22:09 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B601b76490000>; Wed, 03 Feb 2021 20:21:29 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb
 2021 04:21:24 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 4 Feb 2021 04:21:19 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <catalin.marinas@arm.com>, <will@kernel.org>,
        <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
CC:     <broonie@kernel.org>, <jonathanh@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <--cc=linux-arm-kernel@lists.infradead.org>, <arm@kernel.org>,
        <soc@kernel.org>, <sharadg@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Bard Liao <bardliao@realtek.com>
Subject: [PATCH v3] arm64: defconfig: Enable RT5659
Date:   Thu, 4 Feb 2021 09:51:16 +0530
Message-ID: <1612412476-24768-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612412489; bh=RNhRnyFlb2nPp8zHaebXuAihysUSSrPgXpjl2Q5IAZk=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         Content-Type;
        b=WidEyCHMu+hKQR+e2d10/bkXcsb8KkRzFppsu6svn3WrlwDKtFW7Yof7d9Oo9vPmg
         6O2y4EjtWKsV9mmK43+jWx5lZ/jTYgk3D97dZPGRrGXVYe5NRschdmQXNVaWPOqALR
         6Zu1K/+Q+hvx0VaJh3izmEM9zmAufqqwiXs274BrgMZ5U1vNECNeHosBafO2Rl/2Gq
         hbiigTO2aUiy1dOG3FYwdT5odA2sshHqMzRAoVtYePqVZ96FQ0bxwLwK3zoJ6zc+Vv
         urrgIxsjamG5zbamCa64jbN91C6orP4mfhPt8P5KTGvH29yXzDejE7ZRfnnX+AFcjG
         Z06evQixX8S0A==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable the RT5659 audio codec driver. Jetson AGX Xavier has RT5658 codec
which is compatible with this driver. This enables user to test external
audio.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Oder Chiou <oder_chiou@realtek.com>
Cc: Bard Liao <bardliao@realtek.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
 This was part of original series,
 https://lore.kernel.org/alsa-devel/1611944866-29373-1-git-send-email-spujar@nvidia.com/

 Since other patches from above series are already applied, sending this
 separately now.

 Also merging emails/groups from the resend version,
 https://lore.kernel.org/linux-arm-kernel/1612260252-31582-1-git-send-email-spujar@nvidia.com/

 Changelog
 =========
 v2 -> v3:
   - Updated commit message to reflect usage of Jetson AGX Xavier
   - Added 'Acked-by' tag from Jon

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d628125..496fcee 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -767,6 +767,7 @@ CONFIG_SND_SOC_ES7134=m
 CONFIG_SND_SOC_ES7241=m
 CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_PCM3168A_I2C=m
+CONFIG_SND_SOC_RT5659=m
 CONFIG_SND_SOC_SIMPLE_AMPLIFIER=m
 CONFIG_SND_SOC_TAS571X=m
 CONFIG_SND_SOC_WCD934X=m
-- 
2.7.4

