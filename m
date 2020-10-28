Return-Path: <SRS0=mUr2=ED=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEADEC56201
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Oct 2020 22:48:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53FBD20732
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Oct 2020 22:48:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="CLTm37zS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388944AbgJ1WsN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:48:13 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:5016 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733025AbgJ1WsK (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 28 Oct 2020 18:48:10 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4CM3d36WwDzBl;
        Wed, 28 Oct 2020 23:48:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1603925288; bh=GmVRoXMgIpLjRV1MtCfP4Y33+nWTcUFIfZX3NQeEk3Q=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=CLTm37zSuIC3+w5yRdHbUp6edZU05Jws7T3eCt1u7aw+hkUkozIHLQy8RMe5qwfdl
         hrjBDnyvZqqbpVLC9Hkx1QcpTaGY3kUntyKExD9b2Dbrbl6cIy2L+z+n6swZcKq7B0
         zUgE2pH+fk1hZ19epYMWBczaAd27+jQho4DDt4DCTNrUXIytbLWOdfPMfPCp4XghBE
         EDJn5X6Wc1kgmkEb4Ddc4KLYg9n7XNR7CeskGwN3AgfAIeIPmUMPj8DVInzwxfe+oZ
         dVCdhG+tvKVlQnGeV0g9bxgPB773VupGMd6cnhr0WhTknaX7MTGurncGHS15KQOVIq
         unVSscbUrZe4A==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Wed, 28 Oct 2020 23:48:07 +0100
Message-Id: <eb2ab1666f39575f65467ac6e0dd7d987a35b926.1603925200.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <8756eb5aac561173aa222c9cb64dd314ab1b1f9b.1603925200.git.mirq-linux@rere.qmqm.pl>
References: <8756eb5aac561173aa222c9cb64dd314ab1b1f9b.1603925200.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v3 2/2] arm: defconfig: enable tegra20-spdif
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Stephen Warren <swarren@nvidia.com>,
        Takashi Iwai <tiwai@suse.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable tegra20-spdif in tegra and multiplatform defconfigs. The driver
will be switched to "default n" in another patch.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
  v3: split from main patch
  v2: add the symbol to defconfig as suggested by Thierry Reding
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 arch/arm/configs/tegra_defconfig    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index e731cdf7c88c..681742f81c08 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -745,6 +745,7 @@ CONFIG_SND_SOC_STM32_I2S=m
 CONFIG_SND_SUN4I_CODEC=m
 CONFIG_SND_SOC_TEGRA=m
 CONFIG_SND_SOC_TEGRA20_I2S=m
+CONFIG_SND_SOC_TEGRA20_SPDIF=m
 CONFIG_SND_SOC_TEGRA30_I2S=m
 CONFIG_SND_SOC_TEGRA_RT5640=m
 CONFIG_SND_SOC_TEGRA_WM8753=m
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index fff5fae0db30..08526eb50484 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -225,6 +225,7 @@ CONFIG_SND_HDA_CODEC_HDMI=y
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_TEGRA=y
 CONFIG_SND_SOC_TEGRA20_I2S=y
+CONFIG_SND_SOC_TEGRA20_SPDIF=y
 CONFIG_SND_SOC_TEGRA30_I2S=y
 CONFIG_SND_SOC_TEGRA_RT5640=y
 CONFIG_SND_SOC_TEGRA_WM8753=y
-- 
2.20.1

