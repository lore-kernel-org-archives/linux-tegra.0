Return-Path: <SRS0=mUr2=ED=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 891BEC4363A
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Oct 2020 22:48:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E7C720735
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Oct 2020 22:48:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="VPOzHvI4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389430AbgJ1WsN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:48:13 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:62331 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733008AbgJ1WsK (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 28 Oct 2020 18:48:10 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4CM3d21XGFzB1;
        Wed, 28 Oct 2020 23:48:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1603925287; bh=yHK8V58DLeNnIRye/EkDqjDsAYo8KqTDWpngbFEDW2k=;
        h=Date:From:Subject:To:Cc:From;
        b=VPOzHvI4U7ef/1rEvqJRf3fdux2eJp826q9PAo1J5O4m8KX4mWV3CbinyLpt0lbAx
         Aqy+5jb0yrYvfAf4an6M8ikqvpy3hUJd7PZoQPGBI73Xh83MDgnDK9EZ4kbOOZJwJ/
         66VYSJozuKlfx1s87uEIgUJ+xBfDe8XgRn3t4+jPs0eWHVHew3Z3f9HOgKGCp7wU7V
         fMKFrmwSDoCKCMsb5j6odRdgilmk4q5zrxuby5LVgUNBGwWNXKGhGUyfdX4Hr4Ek7I
         JdJCzqEv8Sg8RTbXRESIf2Y9nAci4V04cRNsSBT2jxDiFqBhQomGUK4p5pb9VOMR3A
         TNKgvEJCIpTdA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Wed, 28 Oct 2020 23:48:05 +0100
Message-Id: <8756eb5aac561173aa222c9cb64dd314ab1b1f9b.1603925200.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v3 1/2] ASoC: tegra20-spdif: remove "default m"
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Warren <swarren@nvidia.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Make tegra20-spdif default to N as all other drivers do.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Fixes: 774fec338bfc ("ASoC: Tegra: Implement SPDIF CPU DAI")
---
v3: split-off the defconfig changes
v2: add the symbol to defconfig as suggested by Thierry Reding
---
 sound/soc/tegra/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 3d91bd3e59cd..a62cc87551ac 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -39,7 +39,6 @@ config SND_SOC_TEGRA20_I2S
 config SND_SOC_TEGRA20_SPDIF
 	tristate "Tegra20 SPDIF interface"
 	depends on SND_SOC_TEGRA
-	default m
 	help
 	  Say Y or M if you want to add support for the Tegra20 SPDIF interface.
 	  You will also need to select the individual machine drivers to support
-- 
2.20.1

