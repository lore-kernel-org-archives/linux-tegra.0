Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A062C47085
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 23:45:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E4C7611ED
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 23:45:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232107AbhEWXqe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 23 May 2021 19:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232073AbhEWXqc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 23 May 2021 19:46:32 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD5F8C06138C;
        Sun, 23 May 2021 16:45:03 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id t17so14480566ljd.9;
        Sun, 23 May 2021 16:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/lnkbAwGfOTfE0faI+z2uEvnE5UMJQap5u4jnvd3/0c=;
        b=IJA0RuH/sxS2Z+PU8lnm6gg+AWa/osTuuDRLJBja5ZoFA/Rc0S+ZwBtUg3qXdDpVBr
         5p+HtqqpAvYYWbfD6yEZ2HkFsXyGeAFoM3Wl9wiEFPDWsU6bTX6rmRy/swrN9QMYao+W
         C8BpL+mkpawvSfh9Phg6zRVSs7ksdmWh7fXp1dpgfKGbWU14aXvvxbkVBMCmgqj2gafh
         RMzK0def2t0xL+uiy1NFRU5l3USxqw60mG8iasWkM6z4nwwKuUfoynXDTec6T9vh6gun
         gLMPVmOgMmio00vgbLkh3Nx0ku2iEjnkmi88G7KwNyp/kGhkUQw+WSljXtD7ZJMhu75u
         U0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/lnkbAwGfOTfE0faI+z2uEvnE5UMJQap5u4jnvd3/0c=;
        b=XowYkX7t2bkGupzOPuYpmCeoVO2YNKH5AKcNVCkn0K9PZGX+nOfuDbIH6uVrYvOq9X
         iJcAZpvCR1JQMIZjmc1z9MOKQDlzF5mfHNYsZhC5Dg7EOAB4jmYRA918AMXEzeNQ28yA
         hnhXdFGB8aYkrQbcNcyYxqnqdHniIgxky0+8DJbfHtwsAiFBdw8Uo019AH3+aT6oYHp+
         W8O3s+UxZRzn74oT0quGUfyZrxAgG3zp7L4XP0HrLiOjWNt/fX8+wtNzalYJDaQJaGTb
         1N09bCLaVBarDnj8/tsojByqIu7IgWYFIC+1l/JOTv0V3VDdWSL+k5fY4hg54ae0e+Nt
         CjXg==
X-Gm-Message-State: AOAM533VBwhTuxmLuUQRLnOSNnsJieW/ro6rw90ES7pb383qvNulg2oT
        Phgpk1sA9KKkNwrQ/hDcYnU=
X-Google-Smtp-Source: ABdhPJzkNA0BZJDWAFB/SC7LMu5UUqSITysCieeLViToB3wz26EiSa2n/a1EqfTgwH9wnsir3JLQbw==
X-Received: by 2002:a2e:9cc:: with SMTP id 195mr14750317ljj.291.1621813502210;
        Sun, 23 May 2021 16:45:02 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-110.dynamic.spd-mgts.ru. [109.252.193.110])
        by smtp.gmail.com with ESMTPSA id u11sm1269054lfg.243.2021.05.23.16.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 16:45:02 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] ASoC: tegra: Specify components string for Nexus 7
Date:   Mon, 24 May 2021 02:44:37 +0300
Message-Id: <20210523234437.25077-5-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210523234437.25077-1-digetx@gmail.com>
References: <20210523234437.25077-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Specify components string for Nexus 7 using the Intel BayTrail components
format. This may allow us to create a more generic UCM for RT5640 codec.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index a81f2ebfc00c..87e0a47040a5 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -671,6 +671,24 @@ static const struct tegra_asoc_data tegra_rt5640_data = {
 	.add_hp_jack = true,
 };
 
+/*
+ * Speaker: Connected to SPO L/R P/N pins, stereo.
+ * Internal Microphone: Digital, connected to DMIC1_DAT IN2P/N pins.
+ * Headphones: Connected to HPOL/R pins.
+ * Headset Microphone: Unconnected.
+ *
+ * IF2_DAC/ADC are unpopulated.
+ */
+static const struct tegra_asoc_data tegra_rt5640_grouper_data = {
+	.components = "codec:rt5640 cfg-spk:2 cfg-mic:dmic1 aif:1",
+	.mclk_rate = tegra_machine_mclk_rate_256,
+	.card = &snd_soc_tegra_rt5640,
+	.add_common_dapm_widgets = true,
+	.add_common_controls = true,
+	.add_common_snd_ops = true,
+	.add_hp_jack = true,
+};
+
 /* RT5632 machine */
 
 SND_SOC_DAILINK_DEFS(rt5632_hifi,
@@ -712,6 +730,7 @@ static const struct of_device_id tegra_machine_of_match[] = {
 	{ .compatible = "nvidia,tegra-audio-wm8753", .data = &tegra_wm8753_data },
 	{ .compatible = "nvidia,tegra-audio-rt5677", .data = &tegra_rt5677_data },
 	{ .compatible = "nvidia,tegra-audio-rt5640", .data = &tegra_rt5640_data },
+	{ .compatible = "nvidia,tegra-audio-rt5640-grouper", .data = &tegra_rt5640_grouper_data },
 	{ .compatible = "nvidia,tegra-audio-alc5632", .data = &tegra_rt5632_data },
 	{},
 };
-- 
2.30.2

