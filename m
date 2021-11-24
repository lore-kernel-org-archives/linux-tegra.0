Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B4EC43217
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Nov 2021 22:06:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352082AbhKXWKJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 17:10:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345112AbhKXWJz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 17:09:55 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56824C061758;
        Wed, 24 Nov 2021 14:06:45 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id b40so10917282lfv.10;
        Wed, 24 Nov 2021 14:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0mQGburGzaVO6t6m0C9ToG0s590roHzjwKj9a/U1hq8=;
        b=qgeNkG/YSpN04SgTwmxGtE9fxwMvHmG1tLMQxOvQoP90z2gq9ZepTslJVcIW7s8kEQ
         7zhRy11AKHS8DuzXcprd6y1Qj+W6enzLNeFDEsxy366wgx4goUnG9xLOFA7Av10rUrwU
         p0uxzVIavAr0Sc9Pl0vgE5LfMh+sNZG3MQScL89cLobW6QbuVG7V9li1hH5nPso2/xb9
         O4Qa4e90RWIkqWgHgymHXL4eHB+OwBYGdA7mLxG7grHf0UwLrPIkY/JXndONIHbM9geU
         zdWAKYgHScyHnzGS3P86PxAd6oXgSPe5h8ktUVEgm0xBqL/rG7pefq3pj36n1EqntV6M
         v+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0mQGburGzaVO6t6m0C9ToG0s590roHzjwKj9a/U1hq8=;
        b=JOJuRd7LN+TPFwW8BZ5ya0TIbxUpLDdUXzuLnKDqFGTRsN400YcXk4eSL27z7m8keD
         SgNkXWzBG4cDi/BpKABe4ItMlLIreQEG2KTQcyi7w8DKTt7+51OcCVpNqAJf9Qzz9bnx
         JSLAn9Tj7SXtBsl1sSIVUJUO3GjBBb0AwUSZxQHqGJv0kQJ43BMAGCxn8BIKB3aR+znD
         hupACjEBrf+99UqlZVuOWAEVQf6v4BVT3av+2r1YGKOcL5vHoqlECUuxdBaZZhc+/ael
         mnw0TMe0KO874EMuBvwTVHlSlQGSUR2HSWcq8MPOJBV5cTfftdqatIx7Ic6R7RAgOVpE
         fzVQ==
X-Gm-Message-State: AOAM5314ru5d/KuK5Ft+qyC0uJApu7ZSPNZM5k7KOw7cxPaa8bjhM7Ge
        4qI/KaZbUUG1xPKZX/T/Ojw=
X-Google-Smtp-Source: ABdhPJw5VhxwaZFlstkQ6hcX5lmByTMobxw76HSVCCUXmrUW+Z7gg08zBntVYZdk9l/Xjm2zSheOyQ==
X-Received: by 2002:a05:6512:3d1d:: with SMTP id d29mr19171889lfv.685.1637791603722;
        Wed, 24 Nov 2021 14:06:43 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 14:06:43 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v1 16/20] ARM: tegra_defconfig: Enable S/PDIF driver
Date:   Thu, 25 Nov 2021 01:00:53 +0300
Message-Id: <20211124220057.15763-17-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable Tegra20 S/PDIF driver. It's a part of HDMI audio subsystem on
Tegra.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/tegra_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 817b39190d54..1b8f8fdbedc5 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -235,6 +235,7 @@ CONFIG_SND_HDA_CODEC_HDMI=y
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_TEGRA=y
 CONFIG_SND_SOC_TEGRA20_I2S=y
+CONFIG_SND_SOC_TEGRA20_SPDIF=y
 CONFIG_SND_SOC_TEGRA30_I2S=y
 CONFIG_SND_SOC_TEGRA_RT5640=y
 CONFIG_SND_SOC_TEGRA_WM8753=y
-- 
2.33.1

