Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD80C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Nov 2021 16:37:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353655AbhKZQkc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Nov 2021 11:40:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbhKZQib (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Nov 2021 11:38:31 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0E54C061D74;
        Fri, 26 Nov 2021 08:19:57 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id u3so25493742lfl.2;
        Fri, 26 Nov 2021 08:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0mQGburGzaVO6t6m0C9ToG0s590roHzjwKj9a/U1hq8=;
        b=fuV2rpY5vWtXLgfFL3kQDRM+ioE76IqkOsczEVCgP55ZUOsM6JRi1k1DUic6KroJPS
         0tKyZlRv6Eyfnu2i63/8F5l3GQ3gMNc9CdD0hLqviK+wvyStY1jg5iC7kGuzI3eIMcEf
         PB+2xvrZY342AogXJzAfszoXobBHB6Q3p0iYRgcdy2pL+5r5mbobIWDkdh/z9DTNnsQb
         x59msvnA+cjRsiH/FH7HPP0qQ5JLIZK47Am2iLsa5Qd3Lq9qRfBeS03r7y+yojAESQhP
         ShNJV3gqMzXfS0qwS2eGeNOLcm9Wh0FHqRbij68DTKDMYHAQ1d0SLguifx4pu026d7wv
         /dEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0mQGburGzaVO6t6m0C9ToG0s590roHzjwKj9a/U1hq8=;
        b=YfiqBak4PuMy41JVIMdxC7jav1GAda0WiJzLwENOGQzg1B7psRn7n+AwZYxZ3NE8sN
         uDntoeiFUk+saqnWWqrePOALnammoXIw4q0mmPgd7A8fEwuG3AiAWttHUbu+gSIy4hwM
         zUB62eh8fM7mqKr3reU6L69X8Hd0wTiGx/Egac2iyccof74S/4CYBXRNy6tuuVuizBbj
         F0fdtmeiD1VpwbQbbge/WNAxxQfT4F5TLE1Y0xv603OO3S62LXhPJ8Ga3JExG1EaGcdU
         wfGiKOmnwQ1nXZHFTyZC7uU+ScxsMgaW+6JkI8xRnWDfmB236PBFPoWjKo4RTRzWUepC
         gIng==
X-Gm-Message-State: AOAM531kTdsTKHgnArRAPiQiDLu/iyZlcVOUECVVbWY/fsByjw9OacwI
        UNTbuyHIDMHlOFOiCgAeGog=
X-Google-Smtp-Source: ABdhPJylJzqB2ZvlpxpzfeqjArW2IsHMhFnA0BIsWJR6W+91PfSCYZb5GLBH1w9hRPLmfiiTF5DZOg==
X-Received: by 2002:a05:6512:23a7:: with SMTP id c39mr31318838lfv.655.1637943596282;
        Fri, 26 Nov 2021 08:19:56 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:19:55 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 16/20] ARM: tegra_defconfig: Enable S/PDIF driver
Date:   Fri, 26 Nov 2021 19:18:03 +0300
Message-Id: <20211126161807.15776-17-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
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

