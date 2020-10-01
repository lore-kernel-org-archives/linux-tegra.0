Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41186C4727E
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 17:35:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5604208C7
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 17:35:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="ajD/D6gQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732874AbgJARf2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 13:35:28 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10098 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732569AbgJARf2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 13:35:28 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f76132c0001>; Thu, 01 Oct 2020 10:34:36 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 17:35:24 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 1 Oct 2020 17:35:18 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <pierre-louis.bossart@linux.intel.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>,
        <nwartikar@nvidia.com>, <swarren@nvidia.com>,
        <nicoleotsuka@gmail.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v3 11/13] arm64: defconfig: Enable Tegra audio graph card driver
Date:   Thu, 1 Oct 2020 23:03:05 +0530
Message-ID: <1601573587-15288-12-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601573676; bh=qDPqO8snvmPtLs4im4/TAUzuOCuGZgTtCSBi0BVunOI=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=ajD/D6gQV6Ee99aQq3KbAalONOM5U8D8IYIVqyg0kg9OxCQSUHOKZt6ousCke3cJZ
         O//AKKX956awcqkApYHXzdD9tdrVkCSkCz4q9xEYnl6oThlpP7OQ4qSISLhRwQ/Nsm
         4SRVHz2K1anuFNMf6cg2WHHLbx8KYvTgk1iOUuQKfcLvB0iHZ26ymjp6vGZWBqGy/C
         zz6QGd3q2k1bmeBwfTdRCvH2s6oAXSFq24s6blTkMjb/5njZD0n/7vNbPgI8vL2Y08
         f4UDGPg4w6Di6knML4O2v+GJa3OWZbQ3AXW9XlFLsfX2/n9Ko35lkp972/0XjrraGb
         bnJaACiD/LUsQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This commit enables Tegra audio graph card driver which is based on
the generic audio-graph card driver. This is intended to be used
on platforms based on Tegra210 and later chips.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 55f9c35..2841f77 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -712,6 +712,7 @@ CONFIG_SND_SOC_TEGRA210_DMIC=m
 CONFIG_SND_SOC_TEGRA210_I2S=m
 CONFIG_SND_SOC_TEGRA186_DSPK=m
 CONFIG_SND_SOC_TEGRA210_ADMAIF=m
+CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD=m
 CONFIG_SND_SOC_AK4613=m
 CONFIG_SND_SOC_ES7134=m
 CONFIG_SND_SOC_ES7241=m
-- 
2.7.4

