Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E1BC433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Nov 2021 16:35:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353024AbhKZQjC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Nov 2021 11:39:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235636AbhKZQhC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Nov 2021 11:37:02 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D367C0617A0;
        Fri, 26 Nov 2021 08:19:45 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bu18so25628893lfb.0;
        Fri, 26 Nov 2021 08:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wwvCc+bauYKKq4pTyZaKz2pCnGZty8ijk6MykhM6LJk=;
        b=BvKSZeYoEu1pJJt+n6o+vj50x1ldkP551fdVZxAJJQLdVUFGwPBzAIrF5H+7esXwHx
         n8own3qM05XoxI0sjPD064mGbDJYgQsXfUbZ5MIO05z8iIYjmtRdkKT5j0qD5Z2az0Jk
         UgsVHrgG2+MvETMaNKhRvVnkXunohyLJVeytrxOcNVoFj9pd8wQ3SQv8v/ibUtmgacPy
         ks0GJc1FIuDh3ZKQoL4cs4vQxpaDcGcq87T6G6fqBvQzUszhXwvpYZXNRvM4dS7oRSp1
         a4rK+JOdqWuQE1Dhk/XVLpE7/zREWJ2zqRHV9yeoavSk6IclxwhKhMj46sTIj3eb5Cbc
         PU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wwvCc+bauYKKq4pTyZaKz2pCnGZty8ijk6MykhM6LJk=;
        b=ogmYq6vKaM7j1anvLTWudrz2aX7ETr6QyLlE2Bc/EMafpiSmDdzxJZgPfPGEO3L/Jl
         FIzikytQj0vFu8o4bwKTWklwcp+sZLvy9+CGC4l6fvNpCc5+W5WLBZwGY9UAb4FCVA3e
         Mo35y+PcWU16Fbl+mLUEEGH2hqT9xpQPZbHdIfGkgUObNSWaW0IJgoW8hV0bGu/R+VEo
         juSBhvcazDkU8O975DSx194a0VgCe+/tuqbpyw8sF9lr4SL3wggxwfG5eaIJnR5E+MW5
         VvPO69jo5uOYLsvj/tSiZwyC0B7vsfCyzV454TN7Z7ZhOLQJSgUSNWHMosFbpuD42L3H
         yd7Q==
X-Gm-Message-State: AOAM532ruZJDPRsQwymFGvrp57lUbp7MHbmXc4mbyqBk6l0wcVGTCz1l
        KMKIO04ZVA8navnxIpLsESQ=
X-Google-Smtp-Source: ABdhPJw+O1sqA1AEApn4w0e8LsIJFSmfr+1YbfviViPwQQyCT2nco+0hcMYFnmfPveS50cbky2WMkg==
X-Received: by 2002:a19:4312:: with SMTP id q18mr30933828lfa.299.1637943583577;
        Fri, 26 Nov 2021 08:19:43 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:19:43 -0800 (PST)
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
Subject: [PATCH v2 05/20] ASoC: tegra20: spdif: Set FIFO trigger level
Date:   Fri, 26 Nov 2021 19:17:52 +0300
Message-Id: <20211126161807.15776-6-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

FIFO trigger level must be not less than the size of DMA burst, otherwise
audio will be played x4 faster that it should be because part of the DMA
data will be dropped on FIFO input buffer overflow.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 7751575cd6d6..6f0570cde964 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -69,6 +69,14 @@ static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
 
 	regmap_update_bits(spdif->regmap, TEGRA20_SPDIF_CTRL, mask, val);
 
+	/*
+	 * FIFO trigger level must be bigger than DMA burst or equal to it,
+	 * otherwise data is discarded on overflow.
+	 */
+	regmap_update_bits(spdif->regmap, TEGRA20_SPDIF_DATA_FIFO_CSR,
+			   TEGRA20_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_MASK,
+			   TEGRA20_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_TU4_WORD_FULL);
+
 	switch (params_rate(params)) {
 	case 32000:
 		spdifclock = 4096000;
-- 
2.33.1

