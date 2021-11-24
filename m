Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FC2C433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Nov 2021 22:06:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348184AbhKXWJt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 17:09:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345341AbhKXWJs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 17:09:48 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C23C061758;
        Wed, 24 Nov 2021 14:06:38 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id t26so10920046lfk.9;
        Wed, 24 Nov 2021 14:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c5Fktc8z3pKDnGBiR9xJxzlv3HvufbR7qsaFtUM4qP0=;
        b=J+ph0bGfDz+0f3SGqVBhKJcKJtE145w0Qd6X3dDnesGFzTRO3D1oKZZSXP/i31IGrL
         p1luco5cjM6V7Cg8Ikv1d/qcpY5z9yIUKJG+CTO0D7xvFfh5tPLkhUIV92H0l1HkZ7pB
         vEZkYlEuWq5wqgJtgjc4Sfx61LwcS3Yf0NrKKwdJicwDHo0atAO2jNPn1mctE6+eQID5
         38nBlkG/XgtkZR+0ETbCCuqvYOykfTMwvVp8lRlO5cjYyCElqzRbF0YQUHnhAIgdM8lo
         qzgD5yJd/FI6D/F7JpmnzqTjwHkYOgiZamAhCDdQz+r20/xvJwhCv96wID4QmvMihIKs
         FD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c5Fktc8z3pKDnGBiR9xJxzlv3HvufbR7qsaFtUM4qP0=;
        b=ZuR9VT4CJTIi8by7byaDbAtgEh9KWs9AO6qziUBrVpggyyuA7DDbRNN+quEufpqKQs
         QPEW4GtvJGUKOFYM/u/Td6JAjm9BPb/CZd3fzsU54GuOwcFFVNZgT14/Q0YE9thL7gNa
         O/S+xpPMJYt0I3MNy1dIN/VNS10xA8DgUrzogR/iYLT/y6fJ7Z9epShdZHy0UKFQG/Xj
         9mc06nurUE+71gqPsKychcMHuuSRTMNHi2dTyCHarbCW+vQCEDjgNt24RZAm5aDNXOSL
         64AT9ok0Xlzvsl99ZwAQWjMu5rFG4m1ZK8kSCDA1T7Tr4Hc75BB2Byjs1Qzxm20z7nR2
         Elhg==
X-Gm-Message-State: AOAM53242RVWJlGr4COucllNsMrZ8ZjzsYPivL1LaplK7T8ksFNiYl10
        K7H/L6oRdyve0IIAS6VFukM=
X-Google-Smtp-Source: ABdhPJwux3qwntifRbiT4YwO9EgIoEEHEAiuyxDM9ZVeZbtEWZwxZ2RjX4+Z+AMZAYBRz8ID00EvdQ==
X-Received: by 2002:a05:6512:3ba6:: with SMTP id g38mr18521398lfv.330.1637791596481;
        Wed, 24 Nov 2021 14:06:36 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 14:06:36 -0800 (PST)
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
Subject: [PATCH v1 07/20] ASoC: tegra20: spdif: Set FIFO trigger level
Date:   Thu, 25 Nov 2021 01:00:44 +0300
Message-Id: <20211124220057.15763-8-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Program FIFO trigger level properly to fix x4 accelerated playback.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index bd81df5378d1..6650875d2555 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -70,6 +70,14 @@ static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
 
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

