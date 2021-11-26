Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381A5C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Nov 2021 16:36:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378738AbhKZQj7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Nov 2021 11:39:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbhKZQhv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Nov 2021 11:37:51 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 508CDC061D6E;
        Fri, 26 Nov 2021 08:19:53 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id f18so25506774lfv.6;
        Fri, 26 Nov 2021 08:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C6zkQtDZQENoW1Sivb5bfco/O//qUuyceF3hyVGGf7c=;
        b=TJnwJBrvNJkT1a6gaTqkuKSMg/trzJTt+KT0MRm3CDHp+iTU1GPUYU9T2WekDGOWzr
         1147WeSkCkbe/ztrnLz9JmpByGJW1VVpLeKOgwlFEjMS4+qUTOJrHwS4QDUzlxmpNpJc
         UuFYiMsF00Db2/JLMcoPe3eqvib5N7r9d9zoCGXfIx20gWJ+dG1tmyGYv7WpMqTtfv4q
         XUcFIsJ+Ax0/U30r6hfkAViqXzvCyytLNB8hPCE1Yz2kumH9rKmzHcx/Q+cGokUSKFEO
         bcdV9LxfZVce0X34M/dfLhwU3rzxnN2QOUEFYiNW8gnVzIv6McjfJyW/HkBJuHg0IzqV
         Yi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C6zkQtDZQENoW1Sivb5bfco/O//qUuyceF3hyVGGf7c=;
        b=ApYLRe5b7dSzw7Ruh9mt3J/xEfqZyfPtpz+Nqubl0iyvU04BpcqBcWHbNzEFi8isqY
         8z3GReljh0zhlim44IbdS4ulV2aZJZJoLVXGAawtvO5tt6M3jRyhbO13uUcuEX+Sew2D
         790oSB/c7J2qSlZRn4sr8JGK4uuSHXBVZpNVhp1BdS8/bjqXypv34lGuHHa1FbCNreQA
         /BTpXFlXG4K3En/ac7Wnnq1ocqXwNoropxBXFal0pKcxsYrM0eLddEvzyfHdea9oOUeB
         viFtw9LnRqqyjz2+rz9jpIec5PFYWqVfG7GvD5KXZduu+x30/JTBhYPMfau3DlDHl8TI
         gyTA==
X-Gm-Message-State: AOAM533Vy7+pIfgjaOPJxxBRdSvjA0saOGNlP5z9mTvZSmU+OzZQ5PjV
        RrZZfpt9j1MnRTGFV7FgqlM=
X-Google-Smtp-Source: ABdhPJwT1QIqpn6SrUIqAx9QKx1rgWGepcJAaepjwG8YbY5Cgfk2W3egIqISDds2VGCoj1Ig2/wwFg==
X-Received: by 2002:ac2:58d9:: with SMTP id u25mr32199346lfo.514.1637943591668;
        Fri, 26 Nov 2021 08:19:51 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:19:51 -0800 (PST)
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
Subject: [PATCH v2 12/20] ASoC: tegra20: spdif: Filter out unsupported rates
Date:   Fri, 26 Nov 2021 19:17:59 +0300
Message-Id: <20211126161807.15776-13-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

SPDIF and other SoC components share audio PLL on Tegra, thus only one
component may set the desired base clock rate. This creates problem for
HDMI audio because it uses SPDIF and audio may not work if SPDIF's clock
doesn't exactly match standard audio rate since some receivers may reject
audio in that case. Filter out audio rates which SPDIF output can't
support, assuming that other components won't change rate at runtime.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 61 +++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 89f7fc5c8aad..52be59c58126 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -79,6 +79,7 @@ static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
 	struct tegra20_spdif *spdif = dev_get_drvdata(dai->dev);
 	unsigned int mask = 0, val = 0;
 	int ret, spdifclock;
+	long rate;
 
 	mask |= TEGRA20_SPDIF_CTRL_PACK |
 		TEGRA20_SPDIF_CTRL_BIT_MODE_MASK;
@@ -133,6 +134,12 @@ static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
+	rate = clk_get_rate(spdif->clk_spdif_out);
+	if (rate != spdifclock)
+		dev_warn_once(dai->dev,
+			      "SPDIF clock rate %d doesn't match requested rate %lu\n",
+			      spdifclock, rate);
+
 	return 0;
 }
 
@@ -172,6 +179,59 @@ static int tegra20_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
+static int tegra20_spdif_filter_rates(struct snd_pcm_hw_params *params,
+				      struct snd_pcm_hw_rule *rule)
+{
+	struct snd_interval *r = hw_param_interval(params, rule->var);
+	struct snd_soc_dai *dai = rule->private;
+	struct tegra20_spdif *spdif = dev_get_drvdata(dai->dev);
+	struct clk *parent = clk_get_parent(spdif->clk_spdif_out);
+	const unsigned int rates[] = { 32000, 44100, 48000 };
+	long i, parent_rate, valid_rates = 0;
+
+	parent_rate = clk_get_rate(parent);
+	if (parent_rate <= 0) {
+		dev_err(dai->dev, "Can't get parent clock rate: %ld\n",
+			parent_rate);
+		return parent_rate ?: -EINVAL;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(rates); i++) {
+		if (parent_rate % (rates[i] * 128) == 0)
+			valid_rates |= BIT(i);
+	}
+
+	/*
+	 * At least one rate must be valid, otherwise the parent clock isn't
+	 * audio PLL. Nothing should be filtered in this case.
+	 */
+	if (!valid_rates)
+		valid_rates = BIT(ARRAY_SIZE(rates)) - 1;
+
+	return snd_interval_list(r, ARRAY_SIZE(rates), rates, valid_rates);
+}
+
+static int tegra20_spdif_startup(struct snd_pcm_substream *substream,
+				 struct snd_soc_dai *dai)
+{
+	if (!device_property_read_bool(dai->dev, "nvidia,fixed-parent-rate"))
+		return 0;
+
+	/*
+	 * SPDIF and I2S share audio PLL. HDMI takes audio packets from SPDIF
+	 * and audio may not work on some TVs if clock rate isn't precise.
+	 *
+	 * PLL rate is controlled by I2S side. Filter out audio rates that
+	 * don't match PLL rate at the start of stream to allow both SPDIF
+	 * and I2S work simultaneously, assuming that PLL rate won't be
+	 * changed later on.
+	 */
+	return snd_pcm_hw_rule_add(substream->runtime, 0,
+				   SNDRV_PCM_HW_PARAM_RATE,
+				   tegra20_spdif_filter_rates, dai,
+				   SNDRV_PCM_HW_PARAM_RATE, -1);
+}
+
 static int tegra20_spdif_probe(struct snd_soc_dai *dai)
 {
 	struct tegra20_spdif *spdif = dev_get_drvdata(dai->dev);
@@ -185,6 +245,7 @@ static int tegra20_spdif_probe(struct snd_soc_dai *dai)
 static const struct snd_soc_dai_ops tegra20_spdif_dai_ops = {
 	.hw_params = tegra20_spdif_hw_params,
 	.trigger = tegra20_spdif_trigger,
+	.startup = tegra20_spdif_startup,
 };
 
 static struct snd_soc_dai_driver tegra20_spdif_dai = {
-- 
2.33.1

