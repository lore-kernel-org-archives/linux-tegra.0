Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD65C43331
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 12:07:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 379D023104
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 12:07:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392161AbhASMBf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 07:01:35 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:4397 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387470AbhASJ3o (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 04:29:44 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6006a6540000>; Tue, 19 Jan 2021 01:28:52 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Jan
 2021 09:28:52 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 19 Jan 2021 09:28:48 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <kuninori.morimoto.gx@renesas.com>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [RESEND PATCH v6 4/6] arm64: defconfig: Enable Tegra audio graph card driver
Date:   Tue, 19 Jan 2021 14:58:14 +0530
Message-ID: <1611048496-24650-5-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611048532; bh=K6ffk+sf+Kr8aOJa1Q3UxSgncS5xJ1/jwgXDUj0CrKg=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=O4kL+JxQDDK1PDJag7/IxjJDsCagLy7qXdmvcw2emgQEQ4W4Re9MtgUuLkav+HiY9
         HfC/vMJ1Eyp1vrvRw+n6F/HCkedIJ08ZzMV0/V7NtqzZXt98h9M4WzR1EER84WzhVC
         wuGQgyJvsrmGLYvNTWptPrHkKlEDyvZje7sTAsibm6JeYWbzeACdbG3j29Qls+ZF1S
         pjZ6LSfN4/NzMehkZDCRA1SuL3gn73FiqrenSNylZl8QoiPzj6W/cFfznb59G2TkV0
         StXMISx7iBsvn0ZFm6GMXtjca93uevaXpEu41ltYMDJRWShiyGfEE/FP9p2Wvd9Fju
         NJcq58OX3lh1A==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This commit enables Tegra audio graph card driver which is based on
the generic audio-graph card driver. This is intended to be used
on platforms based on Tegra210 and later chips.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1cd0106..62763fc 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -747,6 +747,7 @@ CONFIG_SND_SOC_TEGRA210_DMIC=m
 CONFIG_SND_SOC_TEGRA210_I2S=m
 CONFIG_SND_SOC_TEGRA186_DSPK=m
 CONFIG_SND_SOC_TEGRA210_ADMAIF=m
+CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD=m
 CONFIG_SND_SOC_AK4613=m
 CONFIG_SND_SOC_ES7134=m
 CONFIG_SND_SOC_ES7241=m
-- 
2.7.4

